local Manifest = {}
function Manifest.new(fields) return { name = fields.name, version = fields.version or "0.1.0", entry = fields.entry or "src/main.lc", dependencies = fields.dependencies or {} } end
function Manifest.from_lspec(spec) return Manifest.new({ name = spec.name, version = spec.version, dependencies = spec.packages }) end
return Manifest
