local Task = {}; Task.__index = Task
function Task.new(name, action) return setmetatable({ name = name, action = action, dependencies = {} }, Task) end
function Task:depends_on(task) self.dependencies[#self.dependencies + 1] = task; return self end
return Task
