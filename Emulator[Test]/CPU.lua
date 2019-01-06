local Component = require("Component")
local CPU = Component:Create("CPU")
local BIOS = require("BIOS")

function CPU:Load()
 Component:Dialog(_,"CPU","CPU Loaded")
end

function CPU:Init()
    Component:Dialog(_,"CPU","Loading BIOS")
    BIOS:Load()
    Component:Dialog(_,"CPU","Executing BIOS")
    BIOS:Init()
end

function CPU:update(dt)

end

return CPU