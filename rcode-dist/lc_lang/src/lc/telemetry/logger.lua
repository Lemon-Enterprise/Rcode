local Logger = {}
function Logger.record(store, event) store[#store + 1] = event end
return Logger
