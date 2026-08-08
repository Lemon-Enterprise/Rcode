--[[
Cache Service
Background service for Rcode
]]

local Service = require("rcode.core.service")

local CacheService = Service:extend("Rcode.CacheService")

function CacheService:init(config)
  self:super(config)
  self.running = false
end

function CacheService:start()
  self.running = true
  -- Start service logic
end

function CacheService:stop()
  self.running = false
  -- Stop service logic
end

return CacheService
