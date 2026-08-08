local Context = {}
function Context.new(options) return { options = options or {}, diagnostics = {} } end
return Context
