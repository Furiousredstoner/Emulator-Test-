local Component = require("Component")
local GPU = Component:Create("GPU")

function GPU:Load()
    
    self.WindowHeight,self.WindowWidth = GPU:GetDimensions()
end

function GPU:GetDimensions()
    return love.graphics.getWidth(),love.graphics.getHeight()
end
 
function GPU:Sharpen(factor)
 love.graphics.setDefaultFilter( "nearest" )
 love.graphics.setNewFont(factor)
end 

function GPU:Unsharpen(factor)
 love.graphics.setDefaultFilter( "linear" )
 love.graphics.setNewFont(factor)
end 

function GPU:SetColor(r,g,b)
 r,g,b =  r/255 , g/255 , b/255
 love.graphics.setColor(r,g,b)
end 


function GPU:SetDimensions(Width,Height)

end 

function GPU:Fullscreen()

end 

function GPU:Minimize()
end 


function GPU:RenderObj(Type,Obj,X,Y,R,W,H,D)
    if Type ~= nil then 
        if Type == "Image" then 
           Obj = love.graphics.newImage(Obj)
        end
         X = X or 0
         Y = Y or 0 
         R = R or 0
         D = D or 1
         love.graphics.draw(Obj,X,Y,R,W,H,D)
    end
end

function GPU:RenderText(Text,X,Y)
    X = X or 0
    Y = Y or 0
    Text = tostring(Text)
    love.graphics.print(Text,X,Y)
end

function GPU:PlotPixel(x,y,r,g,b) -- x can be table, leave y blank 
 GPU:SetColor(r,g,b)
 if type(x) ~= "table" then 
  love.graphics.points(x,y)
 else
    love.graphics.points(x)
 end
 GPU:SetColor(255,255,255)
end




return GPU