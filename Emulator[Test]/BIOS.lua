local Component = require("Component")
 local BIOS = Component:Create("BIOS")

 function BIOS:Load()
  Component:Dialog(_,"BIOS", "BIOS Loaded")
 end

 function BIOS:CheckComponent(Name)
    local File = love.filesystem.exists(Name)
    if File == nil then 
        return false 
    else
        return true 
    end
end

function BIOS:Init()
    self.debug = true 
    Component:Dialog(_,"BIOS","Initilizing BIOS")
    BIOS:POST()
end

function BIOS:POST()
    self.POSTDone = false
     if BIOS:BootComponent("KeyBoard") then 
        if BIOS.debug == true then 
            Component:Dialog(_,"BIOS","COMPONENT KEYBOARD IS LOADED")
        end
        local KeyBoard = require("Components/KeyBoard")
        KeyBoard:Init()
    else
        Component:Dialog("Error","BIOS","COMPONENT: KEYBOARD IS CORRUPTED ")
     end
     if BIOS:BootComponent("Audio") then 
        if BIOS.debug == true then 
            Component:Dialog(_,"BIOS","COMPONENT AUDIO IS LOADED")
        end
        local Audio = require("Components/Audio")
        Audio:Init()
    else
        Component:Dialog("Error","BIOS","COMPONENT: AUDIO IS CORRUPTED ")
     end
     if BIOS.debug == true then
        Component:Dialog(_,"BIOS","POST FINISHED")
    end
     self.POSTDone = true 
end


function BIOS:BootComponent(ComponentName)
    if BIOS:CheckComponent("Components/"..ComponentName) then 
        local ComponentName = require("Components/"..ComponentName)
        if not ComponentName.Init then 
            Component:Dialog("Error","BIOS","COMPONENT:"..ComponentName.."IS CORRUPTED ")
        end
        return true 
    else
        return false 
    end
end

 return BIOS
