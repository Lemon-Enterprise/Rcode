local Notes = {}
function Notes.new(version, entries) return { version = version, entries = entries or {} } end
return Notes
