local Annotations = {}
function Annotations.parse(text) return { raw = text, accepts = text:match("LS[%a]+") } end
return Annotations
