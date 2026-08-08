local Semver = require("lc.package.semver")
local Range = {}
function Range.matches(range, version) if range == "*" or not range then return true end; return Semver.compare(Semver.parse(range:gsub("^%D", "")), Semver.parse(version)) == 0 end
return Range
