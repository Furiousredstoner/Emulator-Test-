local CPU = require("CPU")
local GPU = require("GPU")
ScreenWidth, ScreenHeight = love.window.getDesktopDimensions(1)
love.window.setMode( ScreenWidth/2, ScreenHeight/2, {vsync = false, fullscreen = false, resizable = true} )

a = 0 
b = 1
Val = 0 
function MainLoop() -- main loop (feeds off of Draw loop) 
  a = a + b
  Val = a
  CPU:Timer(1.5)
  b = b + a
  Val = b
  CPU:Timer(1.5)
end

function love.draw()
GPU:Sharpen(12)
LocalFPS = tostring("FPS: "..CPU.FPS)
W,H = GPU:GetDimensions()
GPU:RenderText(CPU.FPS,0,H-15)
GPU:RenderText(Val,W/2,H/2)
MainLoop()
end