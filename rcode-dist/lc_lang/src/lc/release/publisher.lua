local Publisher = {}
function Publisher.plan(artifact, channel) return { artifact = artifact, channel = channel } end
return Publisher
