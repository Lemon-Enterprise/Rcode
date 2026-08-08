local Navigation = {}
function Navigation.new() return { routes = {}, current = nil } end
function Navigation.add(nav, route, screen) nav.routes[route] = screen end
return Navigation
