return { nil_value = { kind = "nil" }, boolean = function(value) return { kind = "boolean", value = value } end, number = function(value) return { kind = "number", value = value } end }
