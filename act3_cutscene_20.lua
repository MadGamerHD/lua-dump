--20
--plays when amy interacts with emperor
--ends and play shifts to doctor

global function Start()
	local doctor = GetActor("doctor")
	local vis_dis = FindNodeByShortName("EM_ANIMATOR_vivion_disruptor:0")
	local music = FindNodeByName("music_20")

	SayPrep("skip", "")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	vis_dis:Trigger()
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local autofire_trigger = FindNodeByName("autofire_trigger")
	local dalek5 = FindNodeByShortName("EM_ENTITY_dalek_golden_5")
	local dalek6 = FindNodeByShortName("EM_ENTITY_dalek_golden_6")
	local dalek7 = FindNodeByShortName("EM_ENTITY_dalek_golden_7")
	local dalek8 = FindNodeByShortName("EM_ENTITY_dalek_golden_8")
	local dalek9 = FindNodeByShortName("EM_ENTITY_dalek_golden_9")
	local dalek10 = FindNodeByShortName("EM_ENTITY_dalek_golden_10")
	local dalek11 = FindNodeByShortName("EM_ENTITY_dalek_golden_11")
	local dalek12 = FindNodeByShortName("EM_ENTITY_dalek_golden_12")
	local chronon = FindNodeByTag("Chronon")
	local cs21_start = FindNodeByName("cs21_start")
	local amy_ill = FindNodeByName("amy_ill")
	
	chronon:SyncDataFromDef()
	
	doctor:DisableStealth()
	doctor:SetBehaviour("pc")
	amy:Teleport(cs21_start)
	amy_ill.script.SetIll()
	
	autofire_trigger:Trigger()

	dalek5:FindActor():EnableRandomFire()
	dalek6:FindActor():EnableRandomFire()
	dalek7:FindActor():EnableRandomFire()
	dalek8:FindActor():EnableRandomFire()
	dalek9:FindActor():EnableRandomFire()
	dalek10:FindActor():EnableRandomFire()
	dalek11:FindActor():EnableRandomFire()
	dalek12:FindActor():EnableRandomFire()
	
	HideLetterBox()

	SetGlobalObjectiveState("Dalek_3_5_2", 3)	
	AddGlobalObjective("Dalek_3_6")

	FindNodeByName("lua_transition").script.BlackScreen(2)
	
	--VO
	--Instructions for Doctor after cs20
		doctor::SID_1890:OK, so I need to get to that Generator Console.
end
