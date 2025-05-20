
global function SetupCut()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local DocWaypoint = FindNodeByName("ChrononDoctor1Loc")
	local AmyWaypoint = FindNodeByName("ChrononAmy1Loc")
	CutToFade()
	HideFade()
	SayPrep("skip", "")
	CutToLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	doctor:DisableWalls()
	amy:DisableWalls()
	doctor:Teleport( DocWaypoint )
	amy:Teleport( AmyWaypoint )

	SetGlobalObjectiveState("Dalek_2_2_4", 3)
end



global function FinishCut()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	local chronon = FindNodeByTag("chronon")
	local stealthTrigger = FindNodeByName("activateStealth1")
	local stealthTrigger2 = FindNodeByName("activateSteatlh2")
	local stealthTrigger3 = FindNodeByName("activateSteatlh3")
	local stealthTrigger4 = FindNodeByName("activateSteatlh4")
	local IntroTrigger = FindNodeByName("VisualiserCorridorIntroTrig")
	
	local ForceReturn1 = FindNodeByName("DocForceReturn1Trigger")
	local ForceReturn2 = FindNodeByName("DocForceReturn2Trigger")
	local ForceReturn3 = FindNodeByName("DocForceReturn3Trigger")
	local ForceReturn4 = FindNodeByName("DocForceReturn4Trigger")
	
	doctor:EnableWalls()
	amy:EnableWalls()
	amy:SetTarget(doctor)
	doctor:SetBehaviour("pc")
	amy:SetBehaviour("follow")
	amy_hint_interact:Wake()
	stealthTrigger:Sleep()
	stealthTrigger3:Sleep()
	stealthTrigger2:Wake()
	stealthTrigger4:Wake()
	HideLetterBox()
	ForceReturn3:Sleep()
	ForceReturn1:Sleep()
	ForceReturn2:Wake()
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
	
	
end