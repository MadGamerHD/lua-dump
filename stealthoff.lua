global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	--local dalek = GetActor("dalek")	
	--local patrol1a = FindNodeByName("patrol1a")
	local explore_music = FindNodeByName("explore_music_def")
					
	doctor:DisableStealth()
	amy:DisableStealth()
	PlayMusic(explore_music)
	
	--dalek:SetSpline(patrol1a)
	--dalek:SetBehaviour("patrol")
end