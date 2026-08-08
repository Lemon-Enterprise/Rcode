#!/usr/bin/env luajit
-- Rcode Launcher
-- This script sets up the environment and launches Rcode

local root = "?/.lua;?/init.lua;"
local rcode_path = "rcode/?.lua;rcode/?/init.lua;"

-- Add current directory to package path
package.path = "./" .. rcode_path .. root .. package.path

-- Add lc_lang to path (if available)
package.path = "./lc_lang/src/?.lua;" .. package.path

-- Load and run Rcode
local success, err = pcall(function()
  require("rcode").run(arg)
end)

if not success then
  print("Error: " .. tostring(err))
  os.exit(1)
end
