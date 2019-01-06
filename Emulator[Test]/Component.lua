local Component = {}
Component.__index = Component 
function Component:Create(type)
    local Comp = {}
    self.type = type
    setmetatable(Comp , self)
    return Comp
end


function Component:Dialog(MsgType,Comp,Msg)
    self.Comp = "["..Comp.."]: "
    if MsgType == "Error" then 
        self.Type = "Error: " 
    elseif MsgType == nil then 
        self.Type = ""
    end
    self.Msg = Msg
    print(self.Comp..self.Type..self.Msg)
end

return Component
