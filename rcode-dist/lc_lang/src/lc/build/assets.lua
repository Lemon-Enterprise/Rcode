local Assets = {}
function Assets.new() return { files = {} } end
function Assets.add(assets, path) assets.files[#assets.files + 1] = path end
return Assets
