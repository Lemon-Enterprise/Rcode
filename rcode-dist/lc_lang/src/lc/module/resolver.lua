local Resolver = {}
function Resolver.path(root, namespace) return root .. "/" .. namespace:gsub("::", "/") .. ".lc" end
return Resolver
