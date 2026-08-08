local Output = {}
function Output.plan(artifacts) local paths = {}; for _, artifact in ipairs(artifacts) do paths[#paths + 1] = artifact.path end; return paths end
return Output
