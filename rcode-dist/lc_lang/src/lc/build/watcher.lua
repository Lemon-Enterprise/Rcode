local Watcher = {}
function Watcher.new(callback) return { callback = callback, files = {} } end
function Watcher.track(watcher, path) watcher.files[path] = true end
return Watcher
