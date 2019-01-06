local CPU = require("CPU")
function love.load()
CPU:Load()
print("[EMU Main]: Executing CPU")
CPU:Init()
end

function love.update(dt)
    CPU:update(dt)
end

function love.draw()
end


