--11.1
--played when doc returns with prod items 
--ends and chars move to vis room

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_interact_script = FindNodeByName("amy_interact_script")
	local chronon = FindNodeByTag("Chronon")
	local music = FindNodeByName("music_11_1")
	
	chronon:StopTrigger()	
	PlayMusic(music)
	
	SayPrep("skip", "")	
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	amy:StopInvisibilityFading()

	amy_interact_script.script.tired_anim = false
	SetGlobalObjectiveState("Dalek_2_2_4", 3)
end

global function Chronon()
	local chronon = FindNodeByTag("Chronon")
	chronon:Trigger()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local DocWaypoint = FindNodeByName("ChrononDoctor1Loc")
	local AmyWaypoint = FindNodeByName("ChrononAmy1Loc")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	local chronon = FindNodeByTag("chronon")
	local stealthTrigger = FindNodeByName("activateStealth1")
	local stealthTrigger2 = FindNodeByName("activateSteatlh2")
	local stealthTrigger3 = FindNodeByName("activateSteatlh3")
	local stealthTrigger4 = FindNodeByName("activateSteatlh4")
	local IntroTrigger = FindNodeByName("VisualiserCorridorIntroTrig")
	local ForceReturn1 = FindNodeByName("DocForceReturn_1_topprod")
	local ForceReturn4 = FindNodeByName("DocForceReturn_4_bottomprod")
	local ForceReturn2 = FindNodeByName("DocForceReturn_2_topvis")
	local ForceReturn3 = FindNodeByName("DocForceReturn_3_bottomvis")
	local chronon = FindNodeByTag("Chronon")
	local theme = FindNodeByName("dalek_city_theme_def")

	chronon:SyncDataFromDef()
	chronon:Trigger()

	doctor:Teleport(DocWaypoint)
	doctor:EnableWalls()
	doctor:SetBehaviour("pc")

	amy:Teleport(AmyWaypoint)
	amy:EnableWalls()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	HideLetterBox()
	
	PlayMusic(theme)
	
	amy_hint_interact:Wake()
	stealthTrigger:Sleep()
	stealthTrigger3:Sleep()
	stealthTrigger2:Wake()
	stealthTrigger4:Wake()
	ForceReturn2:Sleep()
	ForceReturn3:Sleep()
	ForceReturn1:Wake()
	ForceReturn4:Wake()
	chronon:Show()
	IntroTrigger:Wake()
	
	SetGlobalObjectiveState("Dalek_2_2_1", 3)
	SetGlobalObjectiveState("Dalek_2_2_2", 3)
	SetGlobalObjectiveState("Dalek_2_2_3", 3)
	SetGlobalObjectiveState("Dalek_2_2_4", 3)
	SetGlobalObjectiveState("Dalek_2_2_5", 3)
	SetGlobalObjectiveState("Dalek_2_2", 3)
	AddGlobalObjective("Dalek_2_3")
	
	FindNodeByName("lua_transition").script.BlackScreen(3)
end