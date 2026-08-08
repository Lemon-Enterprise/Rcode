local Cache = {}; Cache.__index = Cache
function Cache.new() return setmetatable({ values = {} }, Cache) end
function Cache:put(key, value) self.values[key] = value end
function Cache:get(key) return self.values[key] end
return Cache
