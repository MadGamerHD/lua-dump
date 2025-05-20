global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	local music = FindNodeByName("CS9_music")
	PlayMusic(music)

	
	Wait(13)
	local music = FindNodeByName("music_exposition_30s")
	PlayMusic(music)
	Wait(6.6)
	ShowFade()
	
end

global function end_cutscene()		
	--take cure to Chisholm
	--SetGlobalObjectiveState("Cyber_2_6", 3) -- 2 is unlock, 3 is done
	--EndAct()
	local next_cutscene = FindNodeByName("Cutscene_9b")
	next_cutscene:Trigger()
end