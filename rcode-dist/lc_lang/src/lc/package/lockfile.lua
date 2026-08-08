local Lockfile = {}
function Lockfile.new() return { packages = {} } end
function Lockfile.pin(lockfile, name, version) lockfile.packages[name] = version end
return Lockfile
