local Resolver = {}
function Resolver.resolve(manifest, registry) local resolved = {}; for name, range in pairs(manifest.dependencies) do local versions = registry:find(name); if not versions then return nil, "package not found: " .. name end; resolved[name] = versions[1] or range end; return resolved end
return Resolver
