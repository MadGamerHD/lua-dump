
global function run_cutscene()

	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	amy:SetBehaviour("wait")
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	
	--HideFade()
	local ambience = FindNodeByName("ambience_TARDIS")
	ambience:Trigger()	
	
	local music = FindNodeByName("CS2_music")
	PlayMusic(music)
	
	Wait(24.8)
	ShowFade()
	local ambience = FindNodeByName("ambience_TARDIS")
	ambience:StopTrigger()	

end


global function end_cutscene()

	local cutscene = FindNodeByName("Cutscene_2_1")
		--local cutscene = FindNodeByName("intro")
	cutscene:Trigger()
end