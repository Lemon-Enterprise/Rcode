local Pipeline = {}
function Pipeline.new() return { tasks = {} } end
function Pipeline.add(pipeline, task) pipeline.tasks[#pipeline.tasks + 1] = task end
return Pipeline
