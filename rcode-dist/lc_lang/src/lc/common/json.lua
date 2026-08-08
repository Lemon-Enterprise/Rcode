local Json = {}
local function escape(value) return value:gsub('\\', '\\\\'):gsub('"', '\\"'):gsub('\n', '\\n'):gsub('\r', '\\r'):gsub('\t', '\\t') end
local function is_array(value)
  local count, max = 0, 0
  for key in pairs(value) do if type(key) ~= "number" then return false end; count = count + 1; if key > max then max = key end end
  return max == count
end
function Json.encode(value, indent, level)
  indent, level = indent or "  ", level or 0
  local kind = type(value)
  if value == nil then return "null" end
  if kind == "boolean" or kind == "number" then return tostring(value) end
  if kind == "string" then return '"' .. escape(value) .. '"' end
  if kind ~= "table" then return '"' .. escape(tostring(value)) .. '"' end
  local array, parts = is_array(value), {}
  for key, item in pairs(value) do
    local prefix = array and "" or Json.encode(tostring(key), indent, level + 1) .. ": "
    parts[#parts + 1] = string.rep(indent, level + 1) .. prefix .. Json.encode(item, indent, level + 1)
  end
  if #parts == 0 then return array and "[]" or "{}" end
  return (array and "[" or "{") .. "\n" .. table.concat(parts, ",\n") .. "\n" .. string.rep(indent, level) .. (array and "]" or "}")
end
return Json
