--played on interaction with TARDIS
--ends act

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local traf_amb = FindNodeByName("traf_amb")	
	local tard_amb = FindNodeByName("tard_amb")	
	local music = FindNodeByName("cs_8_music")
	
	SayPrep("skip", "")
	doctor:DisableStealth()
	amy:DisableStealth()
	doctor:GetTransform():StopTrigger()
	amy:GetTransform():StopTrigger()
	
	traf_amb:StopTrigger()
	tard_amb:Trigger()
	PlayMusic(music)

	ShowLetterBox()
end

global function End_8()
	FindNodeByName("lua_transition").script.BlackScreen(3)
end

global function Start_8_1()
	local TARDIS = FindNodeByShortName("EM_ANIMATOR_TARDIS:0")
	--local music = FindNodeByName("cs_8_1_music")

	TARDIS:StopTrigger()
	--PlayMusic(music)
end

global function End()
	SetGlobalObjectiveState("Dalek_1_4", 3)
	CutToFade()
	EndAct()
end