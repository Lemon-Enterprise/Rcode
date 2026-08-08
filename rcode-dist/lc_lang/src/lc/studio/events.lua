local Events = {}
function Events.bind(widget, name, handler) widget.events = widget.events or {}; widget.events[name] = handler end
return Events
