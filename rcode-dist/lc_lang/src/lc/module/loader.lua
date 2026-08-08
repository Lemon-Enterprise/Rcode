local Loader = {}; Loader.__index = Loader
function Loader.new() return setmetatable({ loaded = {} }, Loader) end
function Loader:register(name, module) self.loaded[name] = module end
function Loader:load(name) return self.loaded[name] end
return Loader
