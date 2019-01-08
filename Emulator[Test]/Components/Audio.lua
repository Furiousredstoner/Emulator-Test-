local Component = require("Component")
local Audio = Component:Create("Audio")

function Audio:Init()
    self.Audio = love.audio
end

function Audio:PlayMusic(Track)
    local Song = Audio.Audio.newSource(Track,"stream")
     Song:play()
end

function Audio:PlayEffect(EffectName)
    local Effect = Audio.Audio.newSource(EffectName,"static")
     Effect:play()
end

function Audio:StopMusic(Track)
    local Song = Audio.Audio.newSource(Track,"stream")
     Song:stop()
end

function Audio:StopEffect(EffectName)
    local Effect = Audio.Audio.newSource(EffectName,"static")
     Effect:stop()
end

function Audio:PauseMusic(Track)
    local Song = Audio.Audio.newSource(Track,"stream")
     Song:pause()
end

function Audio:PauseEffect(EffectName)
    local Effect = Audio.Audio.newSource(EffectName,"static")
     Effect:pause()
end

return Audio