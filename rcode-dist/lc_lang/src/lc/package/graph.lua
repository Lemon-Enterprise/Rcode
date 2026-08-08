local Graph = {}
function Graph.new() return { nodes = {}, edges = {} } end
function Graph.add(graph, name, dependencies) graph.nodes[name] = true; graph.edges[name] = dependencies or {} end
function Graph.dependencies(graph, name) return graph.edges[name] or {} end
return Graph
