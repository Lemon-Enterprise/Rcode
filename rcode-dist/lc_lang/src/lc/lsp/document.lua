local Document = {}
function Document.new(uri, text) return { uri = uri, text = text, version = 1 } end
return Document
