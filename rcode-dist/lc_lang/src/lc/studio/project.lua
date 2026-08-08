local Project = {}
function Project.new(manifest) return { manifest = manifest, platform = manifest.target } end
return Project
