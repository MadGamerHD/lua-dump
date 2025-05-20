
global function run_cutscene()

	local chisholm=GetActor("chisholm")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	chisholm:SetBehaviour("wait")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	local music = FindNodeByName("CS5_music")
	PlayMusic(music)
	Wait(13.9)
	ShowFade()	
end

global function end_cutscene()
	--connect the Sat Nav to the TARDIS
	SetGlobalObjectiveState("Cyber_1_6_2", 3) -- 2 is unlock, 3 is done
	EndAct()
end