local Pipeline = {}
function Pipeline.run(stages, value) for _, stage in ipairs(stages) do value = stage(value) end; return value end
return Pipeline
