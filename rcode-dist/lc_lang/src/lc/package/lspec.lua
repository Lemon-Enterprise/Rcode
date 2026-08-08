local Source = require("lc.common.source")
local Lspec = {}

local function without_comments(text)
  local output, index, quoted = {}, 1, false
  while index <= #text do
    local char, next_char = text:sub(index, index), text:sub(index + 1, index + 1)
    if char == '"' and text:sub(index - 1, index - 1) ~= "\\" then quoted = not quoted end
    if not quoted and char == "-" and next_char == "-" then
      while index <= #text and text:sub(index, index) ~= "\n" do index = index + 1 end
    else output[#output + 1] = char; index = index + 1 end
  end
  return table.concat(output)
end

function Lspec.parse(text)
  local clean = without_comments(text)
  local name = clean:match("%f[%a]name%s*=%s*%\"([^\"]+)%\"")
  local version = clean:match("%f[%a]version%s*=%s*%\"([^\"]+)%\"")
  if not name or not version then return nil, ".lspec requires name and version strings" end
  if not version:match("^%d+%.%d+%.?%d*$") then return nil, ".lspec version must be 1.0 or 1.0.0" end
  local body = clean:match("%f[%a]packages%s*=%s*{(.-)}") or ""
  local packages = {}
  for package_name, package_version in body:gmatch("([%a_][%w_]*)%s*=%s*%\"([^\"]+)%\"") do packages[package_name] = package_version end
  return { name = name, version = version, packages = packages }
end

function Lspec.read(path)
  if not path:match("%.lspec$") then return nil, "expected an .lspec file" end
  local text, err = Source.read(path)
  if not text then return nil, err end
  return Lspec.parse(text)
end

function Lspec.encode(spec)
  local lines = { 'name = "' .. spec.name .. '"', 'version = "' .. spec.version .. '"', "", "packages = {" }
  for name, version in pairs(spec.packages or {}) do lines[#lines + 1] = '  ' .. name .. ' = "' .. version .. '",' end
  lines[#lines + 1] = "}"; return table.concat(lines, "\n") .. "\n"
end

return Lspec
