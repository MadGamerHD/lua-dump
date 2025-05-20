global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	--local music = FindNodeByName("music_enter_stealth_def")
				
	doctor:EnableStealth()
	amy:EnableStealth()
	--PlayMusic(music)	
end