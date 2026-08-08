local Android = {}
function Android.package_name(manifest) return manifest.app.identifier end
return Android
