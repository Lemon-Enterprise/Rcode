local Result = {}
function Result.ok(value) return { ok = true, value = value } end
function Result.err(message) return { ok = false, error = message } end
function Result.unwrap(result) if not result.ok then error(result.error, 2) end return result.value end
return Result
