--[[
Watcher Service
Background service for Rcode
]]

local Service = require("rcode.core.service")

local WatcherService = Service:extend("Rcode.WatcherService")

function WatcherService:init(config)
  self:super(config)
  self.running = false
end

function WatcherService:start()
  self.running = true
  -- Start service logic
end

function WatcherService:stop()
  self.running = false
  -- Stop service logic
end

return WatcherService
