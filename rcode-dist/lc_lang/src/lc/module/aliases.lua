local Aliases = {}
function Aliases.new() return {} end
function Aliases.add(aliases, name, target) aliases[name] = target end
return Aliases
