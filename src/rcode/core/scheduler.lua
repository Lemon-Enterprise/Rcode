--[[
Scheduler Service
Background service for Rcode
]]

local Service = require("rcode.core.service")

local SchedulerService = Service:extend("Rcode.SchedulerService")

function SchedulerService:init(config)
  self:super(config)
  self.running = false
end

function SchedulerService:start()
  self.running = true
  -- Start service logic
end

function SchedulerService:stop()
  self.running = false
  -- Stop service logic
end

return SchedulerService
