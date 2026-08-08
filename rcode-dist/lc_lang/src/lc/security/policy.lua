local Policy = {}
function Policy.define(name, description) return { name = name, description = description, enabled = true } end
return Policy
