local Builtins = {}
function Builtins.invoke(name, args)
  if name == "println" then print(table.concat(args, " ")); return nil end
  if name == "String::isPath" then return type(args[1]) == "string" and #args[1] > 0 end
  if name == "Hex::new" or name == "Color::Hex::new" then return { kind = "Color", color = args[1] } end
  if name == "LSPlatform::Mobile" then return { kind = "Platform", name = args[1] } end
  if name == "Result" then return args[1] end
  return { kind = "CallResult", name = name, arguments = args }
end
return Builtins
