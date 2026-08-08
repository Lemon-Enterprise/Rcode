--[[
Rcode LC-lang Parser Module
Integrates with lc_lang compiler to parse and validate LC-lang code
]]

local Parser = {}
local Source = require("lc.common.source")
local Compiler = require("lc.compiler.compiler")
local Manifest = require("lc.studio.manifest")
local Json = require("lc.common.json")
local Utils = require("rcode.utils.helpers")

-- Cache for compiled modules
local compiled_modules = {}

function Parser.parse_text(text)
  local result = Compiler.compile(text)
  if not result or not result.ast then
    return nil, "Failed to parse: invalid syntax"
  end
  return { ast = result.ast, analysis = result.analysis }
end

function Parser.parse_file(filepath)
  local text, err = Source.read(filepath)
  if not text then
    return nil, string.format("Failed to read file: %s", err)
  end
  
  return Parser.parse_text(text)
end

function Parser.parse_and_validate(filepath)
  local result, err = Parser.parse_file(filepath)
  if not result then
    return nil, err
  end
  
  if not result.analysis.ok then
    local errors = {}
    for _, error_msg in ipairs(result.analysis.errors) do
      table.insert(errors, error_msg)
    end
    return nil, table.concat(errors, "\n")
  end
  
  return result
end

function Parser.generate_manifest(filepath)
  local result, err = Parser.parse_and_validate(filepath)
  if not result then
    return nil, err
  end
  
  local manifest = Manifest.from_program(result.ast)
  if not manifest then
    return nil, "File does not contain a valid Lemon Studio app"
  end
  
  return manifest
end

function Parser.get_ast_json(filepath)
  local result, err = Parser.parse_file(filepath)
  if not result then
    return nil, err
  end
  
  return Json.encode(result.ast)
end

function Parser.validate_syntax(text)
  local result = Compiler.compile(text)
  if not result or not result.analysis.ok then
    return false, result and result.analysis.errors or {"Unknown error"}
  end
  return true
end

return Parser
