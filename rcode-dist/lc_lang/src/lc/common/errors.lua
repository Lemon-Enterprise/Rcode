local Errors = {}
function Errors.syntax(token, message)
  return string.format("LC-lang syntax error at %d:%d: %s", token.line or 0, token.column or 0, message)
end
function Errors.runtime(message) return "LC-lang runtime error: " .. message end
return Errors
