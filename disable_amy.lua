global script_node

	local light_dr_up = FindNodeByPartialName("EM_LIGHT_DR_Up:0")
	local light_dr_left = FindNodeByPartialName("EM_LIGHT_DR_Left:0")
	local light_dr_left_back = FindNodeByPartialName("EM_LIGHT_DR_Left_Back:0")
	local light_dr_right = FindNodeByPartialName("EM_LIGHT_DR_Right:0")
	local light_ay_up = FindNodeByPartialName("EM_LIGHT_AY_Up:0")
	local light_ay_left = FindNodeByPartialName("EM_LIGHT_AY_Left:0")
	local light_ay_left_back = FindNodeByPartialName("EM_LIGHT_AY_Left_Back:0")
	local light_ay_right = FindNodeByPartialName("EM_LIGHT_AY_Right:0")


global function Trigger()
	local CutsceneNode = FindNodeByName("DisableAmyCut")
	CutsceneNode:Trigger()	
end

global function ReachedPos()
	local doctor = GetActor("doctor")
	local CutsceneNode = FindNodeByName("DisableAmyCut")
	CutsceneNode:Trigger()	
	doctor:SetBehaviour("pc")
	HideFade()
	HideLetterBox()
end

global function SetupCut()
	light_dr_up:Trigger()
	light_dr_right:Trigger()
	light_ay_up:Trigger()
	light_ay_left_back:Trigger()
	light_ay_right:Trigger()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local amy_script = FindNodeByName("amy_startup_0")
	local DocWaypoint = FindNodeByName("DocPos2")
	local AmyWaypoint = FindNodeByName("AmyMove1")
	local doctorEnt = FindNodeByTag("doctor")
	local amyEnt = FindNodeByTag("amy")
	
	SayPrep("skip", "")

	doctor:SetBehaviour("wait")
--	amy:PlayAnim(amy_death,1,0)
	amy_script.script.AmyState  = 1

	doctor:Teleport(DocWaypoint)
	amy:Teleport(AmyWaypoint)
--	doctor:SetFocus(amyEnt)
--	amy:SetFocus(doctorEnt)
	HideFade()
end

global function ReachedAmy()
	local amy_interact = FindNodeByName("Amy_Interact")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
end

global function EndCut()
	light_dr_up:StopTrigger()
	light_dr_right:StopTrigger()
	light_ay_up:StopTrigger()
	light_ay_left_back:StopTrigger()
	light_ay_right:StopTrigger()
	local amy_interact = FindNodeByName("Amy_Interact")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_anim = FindNodeByPartialName("Anim_AMY_Exhausted_Idle")
--	local DoorTrigger = FindNodeByTag("VisuliserCorridorDoor")
	ShowFade()
	amy:SetBehaviour("wait")
	Wait(1)
	amy:PlayAnim(amy_anim,1,0)
	doctor:SetBehaviour("pc")
	HideLetterBox()
	amy_hint_interact:Sleep()
	amy_interact:Wake()
--	DoorTrigger:Sleep()
	doctor:EnablePhysics()
	doctor:EnableWalls()
	HideFade()
	SetGlobalObjectiveState("Dalek_2_1_2", 3 )
	SetGlobalObjectiveState("Dalek_2_1", 3 )
	AddGlobalObjective("Dalek_2_2")
	SaveCheckpoint()
end