local Semver = {}
function Semver.parse(value) local major, minor, patch = value:match("^(%d+)%.(%d+)%.(%d+)"); return { major = tonumber(major) or 0, minor = tonumber(minor) or 0, patch = tonumber(patch) or 0 } end
function Semver.compare(left, right) for _, key in ipairs({ "major", "minor", "patch" }) do if left[key] ~= right[key] then return left[key] < right[key] and -1 or 1 end end return 0 end
return Semver
