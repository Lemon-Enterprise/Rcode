local Node = {}
function Node.new(kind, fields) fields = fields or {}; fields.kind = kind; return fields end
return Node
