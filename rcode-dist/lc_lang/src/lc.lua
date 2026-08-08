local root = "src/?.lua;src/?/init.lua;"
if not package.path:find("src/%?%.lua", 1, false) then package.path = root .. package.path end
require("lc.cli.main").run(arg)
