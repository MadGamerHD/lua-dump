global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("background_music")	
				
	doctor:DisableStealth()
	amy:DisableStealth()
	PlayMusic(music)	
end