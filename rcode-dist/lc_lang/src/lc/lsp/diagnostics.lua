local Diagnostics = {}
function Diagnostics.from_error(message) return { { severity = 1, message = message } } end
return Diagnostics
