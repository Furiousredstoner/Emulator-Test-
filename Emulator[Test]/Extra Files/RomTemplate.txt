local CPU = require("CPU")
local GPU = require("GPU")
ScreenWidth, ScreenHeight = love.window.getDesktopDimensions(1)
love.window.setMode( ScreenWidth/2, ScreenHeight/2, {vsync = false, fullscreen = false, resizable = true} )


function MainLoop() -- main loop (feeds off of Draw loop) 
end

function love.draw()
GPU:Sharpen(12)
LocalFPS = tostring("FPS: "..CPU.FPS)
W,H = GPU:GetDimensions()
GPU:RenderText(CPU.FPS,0,H-15)
MainLoop()
end