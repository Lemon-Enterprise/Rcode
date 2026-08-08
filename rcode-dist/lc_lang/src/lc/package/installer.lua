local Installer = {}
function Installer.install(cache, resolved) for name, version in pairs(resolved) do cache:put(name, { version = version, installed = true }) end; return resolved end
return Installer
