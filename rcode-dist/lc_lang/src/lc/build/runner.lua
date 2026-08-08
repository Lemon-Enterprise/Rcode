local Runner = {}
function Runner.run(task, completed) completed = completed or {}; if completed[task.name] then return end; for _, dependency in ipairs(task.dependencies) do Runner.run(dependency, completed) end; if task.action then task.action() end; completed[task.name] = true end
return Runner
