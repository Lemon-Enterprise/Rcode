--[[
Rcode Configuration Module
Manages IDE settings and preferences
]]

local Config = {}

Config.defaults = {
  editor = {
    show_line_numbers = true,
    syntax_highlighting = true,
    tab_size = 2,
    auto_indent = true,
    theme = "default",
  },
  parser = {
    auto_validate = true,
    show_ast = false,
  },
  runner = {
    show_output = true,
    auto_run = false,
  },
  ui = {
    color_scheme = "ansi",
    status_bar = true,
  },
}

Config.current = {}

function Config.load()
  -- Try to load from config file
  local config_file = "rcode_config.lua"
  local file = io.open(config_file, "r")
  
  if file then
    local content = file:read("*a")
    file:close()
    
    local success, config = pcall(function()
      return loadstring(content)()
    end)
    
    if success and type(config) == "table" then
      Config.current = Config.merge(Config.defaults, config)
    else
      Config.current = Config.deep_copy(Config.defaults)
    end
  else
    Config.current = Config.deep_copy(Config.defaults)
  end
  
  return Config.current
end

function Config.save()
  local config_file = "rcode_config.lua"
  local file = io.open(config_file, "w")
  
  if file then
    file:write("return {\n")
    file:write(Config.serialize(Config.current))
    file:write("}\n")
    file:close()
    return true
  end
  
  return false
end

function Config.get(key)
  local keys = Utils.split(key, ".")
  local current = Config.current
  
  for _, k in ipairs(keys) do
    if current[k] then
      current = current[k]
    else
      return nil
    end
  end
  
  return current
end

function Config.set(key, value)
  local keys = Utils.split(key, ".")
  local current = Config.current
  
  for i = 1, #keys - 1 do
    local k = keys[i]
    if not current[k] then
      current[k] = {}
    end
    current = current[k]
  end
  
  current[keys[#keys]] = value
  return true
end

function Config.merge(t1, t2)
  local result = Config.deep_copy(t1)
  
  for k, v in pairs(t2) do
    if type(v) == "table" and type(result[k]) == "table" then
      result[k] = Config.merge(result[k], v)
    else
      result[k] = v
    end
  end
  
  return result
end

function Config.deep_copy(original)
  local copy = {}
  for k, v in pairs(original) do
    if type(v) == "table" then
      copy[k] = Config.deep_copy(v)
    else
      copy[k] = v
    end
  end
  return copy
end

function Config.serialize(t, indent)
  indent = indent or 0
  local result = {}
  
  for k, v in pairs(t) do
    if type(v) == "table" then
      table.insert(result, string.rep("  ", indent) .. string.format("[%s] = {\n", k))
      table.insert(result, Config.serialize(v, indent + 1))
      table.insert(result, string.rep("  ", indent) .. "},")
    else
      local value = type(v) == "string" and string.format('"%s"', v) or tostring(v)
      table.insert(result, string.rep("  ", indent) .. string.format("[%s] = %s,", k, value))
    end
  end
  
  return table.concat(result, "\n")
end

-- Load defaults on module load
Config.load()

return Config
