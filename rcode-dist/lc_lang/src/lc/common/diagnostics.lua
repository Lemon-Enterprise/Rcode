local Diagnostics = {}
function Diagnostics.new() return { items = {} } end
function Diagnostics.add(store, severity, message, token) store.items[#store.items + 1] = require("lc.common.diagnostic").new(severity, message, token) end
function Diagnostics.has_errors(store) for _, item in ipairs(store.items) do if item.severity == "error" then return true end end return false end
return Diagnostics
