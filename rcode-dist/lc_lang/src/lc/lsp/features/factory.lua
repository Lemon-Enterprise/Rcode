local Factory = {}
function Factory.feature(name) return { name = name, supported = true } end
return Factory
