
global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	doctor:EnableStealth()
	amy:EnableStealth()
	--local music = FindNodeByName("music_enter_stealth_def")
	--PlayMusic(music)
end

	