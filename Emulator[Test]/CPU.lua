local Component = require("Component")
local CPU = Component:Create("CPU")
local BIOS = require("BIOS")
local Audio = require("Components/Audio")
local KeyBoard = require("Components/KeyBoard")

function CPU:Load()
 Component:Dialog(_,"CPU","CPU Loaded")
 self.PC = 0
 self.Bits = 0
 self.Clock = os.clock()
 self.TickSpeed = 1

end

function CPU:Init()
    Component:Dialog(_,"CPU","Loading BIOS")
    BIOS:Load()
    Component:Dialog(_,"CPU","Executing BIOS")
    BIOS:Init()
end

function CPU:update(dt)
if os.clock() > CPU.Clock + CPU.TickSpeed then 
    print("test")
    CPU.Clock = os.clock()
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