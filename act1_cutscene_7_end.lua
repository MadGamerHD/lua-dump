global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalek = GetActor("dalek")
	local dalek5 = GetActor("dalek5")
	local dalek6 = GetActor("dalek6")
	local dalek7 = GetActor("dalek7")
	local dalek8 = GetActor("dalek8")
--	local dalek9 = GetActor("dalek9")
	local patrol2 = FindNodeByName("patrol2")
	local pat_loc = FindNodeByTag("pat_loc")
	local manhole_start = FindNodeByName("interact_manhole_start")	
	local manhole_end = FindNodeByName("interact_manhole_end")	
	local tardis_start = FindNodeByName("interact_tardis_start")	
	local tardis_end = FindNodeByName("interact_tardis_end")	
	local exit_stealth1 = FindNodeByName("stealth_toggle_bags")
	local exit_stealth2 = FindNodeByName("dalek_preview_and_stealth")
	local dalek_block = FindNodeByName("dalek_blockage")
	local doc_loc = FindNodeByName("doctor_manhole")
	local amy_loc = FindNodeByName("amy_manhole")
	local lookat = FindNodeByName("tardis_lookat")
	local position = FindNodeByName("tardis_pos")
	local giant_taxi = FindNodeByShortName("EM_ENTITY_second_taxi:0")
	
	giant_taxi:SyncDataFromDef()

	doctor:Teleport(doc_loc)	
	doctor:EnableStealth()
	doctor:EnablePhysics()

	amy:Teleport(amy_loc)
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	amy:EnableStealth()
	amy:EnablePhysics()

	--dalek:Teleport(pat_loc)
	--dalek:SetSpline(patrol2) 
	--dalek:SetBehaviour("patrol")

	dalek:GetTransform():StopTrigger()
	dalek5:GetTransform():Trigger()
	dalek6:GetTransform():Trigger()
	dalek7:GetTransform():Trigger()
	dalek8:GetTransform():Trigger()
--	dalek9:GetTransform():Trigger()
	
	manhole_start:StopTrigger()
	manhole_end:Trigger()
	tardis_start:StopTrigger()
	tardis_end:Trigger()
	exit_stealth1:StopTrigger()
	exit_stealth2:StopTrigger()
	dalek_block:Trigger()	
	
	FindNodeByName("lua_transition").script.BlackScreen(3)
	
	DisableActorCameraCollision()
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(3, 4, 3, true, true)
	
	SayPrep("", "async")
	
	--VO
	--Explain route back to TARDIS
		doctor::SID_1547:The Daleks have changed their patrols. We need to try and sneak round them.

	Wait(10)
	EnableActorCameraCollision()
	doctor:SetBehaviour("pc")
	HideLetterBox()
	
	SetGlobalObjectiveState("Dalek_1_3_3", 3)
	AddGlobalObjective("Dalek_1_4")
	
	SaveCheckpoint()
end
