local Trace = {}
function Trace.start(name) return { name = name, started = os.clock() } end
function Trace.finish(span) span.duration = os.clock() - span.started; return span end
return Trace
