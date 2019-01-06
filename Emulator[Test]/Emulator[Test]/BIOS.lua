local Component = require("Component")
 local BIOS = Component:Create("BIOS")

 function BIOS:Load()
  Component:Dialog(_,"BIOS", "BIOS Loaded")
 end

 function BIOS:CheckComponent(Name,Type)
    local File = love.filesystem.getInfo(Name, Type)
    if File == nil then 
        return false 
    else
        return true 
    end
end

function BIOS:Init()
    Component:Dialog(_,"BIOS","Initilizing BIOS")
    if BIOS:CheckComponent("Components/KeyBoard","file") then 
        local KeyBoard = require("Components/KeyBoard")

         if not KeyBoard.Init then 
            Component:Dialog("Error","BIOS","COMPONENT: KEYBOARD IS CORRUPTED ")
         else
            KeyBoard:Init()
         end

    else
        Component:Dialog("Error","BIOS","COMPONENT: KEYBOARD NOT FOUND ")
    end

    if BIOS:CheckComponent("Components/Audio","file") then 
    local Audio = require("Components/Audio")

     if not Audio.Init then
        Component:Dialog("Error","BIOS","COMPONENT: AUDIO IS CORRUPTED ")
     else
        Audio:Init()
     end

    else
        Component:Dialog("Error","BIOS","COMPONENT: AUDIO NOT FOUND ")
    end

end


 return BIOS 