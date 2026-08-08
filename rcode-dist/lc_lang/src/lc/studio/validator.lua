local Validator = {}
function Validator.validate(manifest) return manifest and manifest.language == "LC-lang", "expected LC-lang manifest" end
return Validator
