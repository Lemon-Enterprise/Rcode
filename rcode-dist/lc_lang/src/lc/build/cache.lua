local Cache = {}
function Cache.key(source, target) return target .. ":" .. #source .. ":" .. source:sub(1, 12) end
return Cache
