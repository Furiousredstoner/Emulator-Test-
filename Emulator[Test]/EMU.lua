
local Component = require("Component")
local EMU = Component:Create("EMU")

function EMU:Load()
Component:Dialog(_,"EMU","EMU Loaded")
self.ROMLoaded = false -- if the ROM is Loaded 
self.RequestROM = true -- Asks For List ROMS/ ROM Name
self.ListROMS = false -- List All ROMS
self.LoadROM = false -- loads the ROM
self.CheckROM = false -- Checks For ROM 
self.ROMExists = false -- If The ROM Exists
self.ROMDir = "ROMS/"
self.ROMList = love.filesystem.getDirectoryItems(self.ROMDir)
end


function EMU:RomLocate(dir,rom) -- dir is a table
 rom = rom..".lua"
 for Rom = 1 , #dir do
    if dir[Rom] == rom then 
        Component:Dialog(_,"EMU",dir[Rom])
        return Rom 
    elseif Rom == #dir and dir[Rom] ~= rom  then 
        Component:Dialog("Error","EMU","ROM ERROR: ROM NOT FOUND")
        EMU.RequestROM = true 
        return nil 
    end
 end
end

function EMU:LoadRom(ROM_Name)
    EMU.LoadROM = false 
    EMU.CheckROM = true 
        RomLocation = EMU:RomLocate(EMU.ROMList,ROM_Name) 
        if RomLocation ~= nil then 
        Component:Dialog(_,"EMU","Valid Rom")
         Component:Dialog(_,"EMU","Loading: "..EMU.ROMDir..ROM_Name..".lua")
         local ROM_Dir = tostring(EMU.ROMDir..EMU.ROMList[RomLocation])
         ROM_Dir = string.sub(ROM_Dir,0,#ROM_Dir-4)
         self.ROM = require(ROM_Dir)
         EMU.ROMLoaded = true 
         Component:Dialog(_,"EMU",EMU.ROMDir..ROM_Name..".lua ".."has been loaded")
        end
end

function EMU:ROMSList(dir) -- dir is a table 
    EMU.ListROMS = false 
    Component:Dialog(_,"EMU","Listing All Avaliable ROMS:")
    local Roms = 0 
    for Roms = 1 , #dir do 
        Component:Dialog(_,"EMU",dir[Roms])
        if Roms == #dir then 
            Component:Dialog(_,"EMU","Done Listing All Available ROMS")
        end
    end
end

function EMU:update(dt)
    while EMU.RequestROM == true do 
        Component:Dialog(_,"EMU","List All ROMS? (Y/N): ")
        self.List = string.upper(io.read())
        if self.List == "Y" then 
            EMU.ListROMS = true 
            EMU.RequestROM = false 
        elseif self.List == "N" then 
            EMU.ListROMS = false 
            EMU.RequestROM = false 
            break 
        else
            Component:Dialog(_,"EMU","Invalid Response: ") 
        end
    end

    if EMU.ListROMS == false and EMU.ROMLoaded == false then 
        Component:Dialog(_,"EMU","ROM Name: ")
        self.ROMName = tostring(io.read())
        EMU.LoadROM = true 
    elseif EMU.ListROMS == true then 
        EMU:ROMSList(EMU.ROMList)
    end

    if EMU.LoadROM == true then 
        EMU:LoadRom(EMU.ROMName)
    end

end

return EMU