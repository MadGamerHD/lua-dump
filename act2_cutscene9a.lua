


global function run_cutscene()
		
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	ShowLetterBox()
--	local music = FindNodeByName("music_exposition_30s")
	local music = FindNodeByName("CS9a_music")
	PlayMusic(music)
--		local snowfall = FindNodeByName("snowfall_FX")
--	snowfall:StopTrigger()
	
	
	HideFade()
	Wait(8.2)
	local positiona=FindNodeByName("tower_door_posa")
	local door=FindNodeByName("door_prop")
	door:Move(positiona, 2, "lerp")
	Wait(39.9)
	ShowFade()
	
end

global function end_cutscene()
	local cutscene = FindNodeByName("Cutscene_9")
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Chisholm")
	breath:StopTrigger()
	local snowfall = FindNodeByName("snowfall_FX")
	snowfall:StopTrigger()
	Wait(2)
	cutscene:Trigger()
	HideFade()
end