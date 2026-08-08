local Module = {}
function Module.new(name) return { name = name, functions = {}, globals = {} } end
return Module
