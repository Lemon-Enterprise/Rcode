local Resolver = {}
function Resolver.resolve(scope, name) return scope:lookup(name) end
return Resolver
