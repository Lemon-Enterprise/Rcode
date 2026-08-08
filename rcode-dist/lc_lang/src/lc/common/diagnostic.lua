local Diagnostic = {}
function Diagnostic.new(severity, message, token) return { severity = severity, message = message, line = token and token.line or 0, column = token and token.column or 0 } end
return Diagnostic
