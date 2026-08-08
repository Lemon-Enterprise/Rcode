local Server = {}
function Server.new() return { name = "LC-lang language server", capabilities = { completion = true, hover = true, definition = true } } end
return Server
