local CPU = require("CPU")
local BIOS = require("BIOS")
function love.load()
CPU:Load()
print("[EMU Main]: Executing CPU")
CPU:Init()
end

function love.update(dt)
     if BIOS.POSTDone then 
      CPU:update(dt)
     end
end

function love.draw()
end


