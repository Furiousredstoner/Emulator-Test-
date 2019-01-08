local Component = require("Component")
local KeyBoard = Component:Create("KeyBoard")

function KeyBoard:Init()
    self.KeyBoard = love.keyboard
end


function KeyBoard:Input(Key)
    if KeyBoard.KeyBoard.isDown(Key) then 
        return true 
    else
        return false 
    end
end

return KeyBoard