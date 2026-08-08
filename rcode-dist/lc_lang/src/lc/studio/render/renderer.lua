local Renderer = {}
function Renderer.render(widget) return { type = widget.type, properties = widget.properties, children = widget.children } end
return Renderer
