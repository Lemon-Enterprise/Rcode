--[[
Rcode Utilities Module
Helper functions for file operations, JSON, etc.
]]

local Utils = {}
local Json = require("lc.common.json")

function Utils.file_exists(filepath)
  local file = io.open(filepath, "r")
  if file then
    file:close()
    return true
  end
  return false
end

function Utils.read_file(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return nil, string.format("File not found: %s", filepath)
  end
  
  local content = file:read("*a")
  file:close()
  return content
end

function Utils.write_file(filepath, content)
  local file = io.open(filepath, "w")
  if not file then
    return false, string.format("Cannot write to file: %s", filepath)
  end
  
  file:write(content)
  file:close()
  return true
end

function Utils.split(str, delimiter)
  local result = {}
  local from = 1
  local delim_from, delim_to = string.find(str, delimiter, from)
  
  while delim_from do
    table.insert(result, string.sub(str, from, delim_from - 1))
    from = delim_to + 1
    delim_from, delim_to = string.find(str, delimiter, from)
  end
  
  table.insert(result, string.sub(str, from))
  return result
end

function Utils.trim(str)
  return (str:gsub("^%s+", ""):gsub("%s+$", ""))
end

function Utils.json_encode(data)
  return Json.encode(data)
end

function Utils.json_decode(json_str)
  return Json.decode(json_str)
end

function Utils.get_file_extension(filepath)
  local filename = filepath:match("[^/\\]+$") or filepath
  local extension = filename:match("%.([^%.]+)$")
  return extension
end

function Utils.get_filename_without_extension(filepath)
  local filename = filepath:match("[^/\\]+$") or filepath
  local name = filename:match("^(.-)%.([^%.]+)$") or filename
  return name
end

function Utils.get_directory(filepath)
  local dir = filepath:match("^(.*[/\\])[^/\\]*$") or "."
  return dir
end

function Utils.join_paths(...)
  local parts = { ... }
  local result = parts[1]
  for i = 2, #parts do
    if result:sub(-1) ~= "/" and parts[i]:sub(1, 1) ~= "/" then
      result = result .. "/" .. parts[i]
    else
      result = result .. parts[i]
    end
  end
  return result
end

return Utils
