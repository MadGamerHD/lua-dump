global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local explore_music = FindNodeByName("explore_music_def")
				
	doctor:DisableStealth()
	amy:DisableStealth()
	PlayMusic(explore_music)
end