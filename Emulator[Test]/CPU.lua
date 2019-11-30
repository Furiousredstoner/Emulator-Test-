local Component = require("Component")
local CPU = Component:Create("CPU")
local BIOS = require("BIOS")
local Audio = require("Components/Audio")
local KeyBoard = require("Components/KeyBoard")
local EMU = require("EMU")
local GPU = require("GPU")

function CPU:Load()
 Component:Dialog(_,"CPU","CPU Loaded")
 self.TickSpeed = 1 * 60   -- (Measured in Seconds)
 self.Clock =  self.TickSpeed/60
 self.FPS = love.timer.getFPS( ) -- FPS
 self.dt = 0 
 EMU:Load()
 GPU:Load()
end

function CPU:Timer(n)
 local Time = os.clock()
  while true do 
   if os.clock() > Time + n then
    break
  end
 end
end

function CPU:Init()
    Component:Dialog(_,"CPU","Loading BIOS")
    BIOS:Load()
    Component:Dialog(_,"CPU","Executing BIOS")
    BIOS:Init()
end

function CPU:update(dt)
 CPU.FPS = love.timer.getFPS( )
 EMU:update(dt)
 CPU.dt = dt
 if EMU.ROMLoaded == true then
  CPU.Clock = CPU.Clock - dt 
  if CPU.Clock <= 0 then
   CPU.Clock = CPU.TickSpeed/60
  end
 end
end



return CPU

--self.TickSpeed = 300   -- High = Slow , Low = Fast (Measured in Seconds)
--self.Clock =  self.TickSpeed/60

--CPU.Clock = CPU.Clock - dt 
--if CPU.Clock <= 0 then 
 --CPU.PC = CPU.PC + 1
 --Component:Dialog(_,"CPU",CPU.PC)
 --CPU.Clock = CPU.TickSpeed/60
--end
--if CPU.PC > CPU.Bits then 
  -- CPU.PC = 0 
--end