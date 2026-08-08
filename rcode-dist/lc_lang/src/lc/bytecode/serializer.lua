local Json = require("lc.common.json")
return { encode = function(chunk) return Json.encode(chunk) end }
