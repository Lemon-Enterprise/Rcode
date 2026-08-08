local Factory = {}
function Factory.make(widget_type, defaults) return function(properties) return { kind = "LSWidget", type = widget_type, properties = properties or {}, defaults = defaults or {}, children = {} } end end
return Factory
