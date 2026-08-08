local App = {}
function App.new(properties) return { kind = "LSApp", properties = properties or {}, widgets = {} } end
function App.add_widget(app, widget) app.widgets[#app.widgets + 1] = widget end
return App
