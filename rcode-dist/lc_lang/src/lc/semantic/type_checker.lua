local Types = require("lc.semantic.type")
local Checker = {}
function Checker.infer(node)
  if node.kind == "Literal" then if node.literal_type == "number" then return Types.LSDouble elseif node.literal_type == "boolean" then return Types.LSBoolean else return Types.LSString end end
  if node.kind == "FormatString" then return Types.LSString end
  return "unknown"
end
return Checker
