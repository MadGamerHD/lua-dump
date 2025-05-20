

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	doctor:DisableStealth()
	amy:DisableStealth()
	local music = FindNodeByName("background_music")
	PlayMusic(music)
end