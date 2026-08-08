local Documents = {}
function Documents.new() return { values = {} } end
function Documents.put(store, document) store.values[document.uri] = document end
function Documents.get(store, uri) return store.values[uri] end
return Documents
