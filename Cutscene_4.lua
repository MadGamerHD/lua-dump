global function PerformCutscene4()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("cs4_1_music")

	PlayMusic(music)
		
	CutToLetterBox()
	
	doctor:AddInventoryItem(FindNodeByName("screwdriver"))
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function EndCutscene4()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local doors1 = FindNodeByName("Lift_Doors_Upper")
	local doors2 = FindNodeByName("Lift_Doors_Lower")
	local loc1 = FindNodeByName("JonesRoomLocator_Doctor")
	local loc2 = FindNodeByName("JonesRoomLocator_Amy")
	local cs4_endcam = FindNodeByName("cs4_endcam")
	local game_cam = FindNodeByName("EmDefaultCamera")
	local amb = FindNodeByName("act2_amb_def")
	local Flanagan_Skeleton = FindNodeByName("EM_ENTITY_Flanagan_Skeleton_0")
	local lift_script = FindNodeByName("lift_script_upper")

	Flanagan_Skeleton:Trigger()

	PlayMusic(amb)
		
	--moved from Act2Progression below...
	doctor:Teleport(FindNodeByName("ExitLift_Doctor"))
	amy:Teleport(FindNodeByName("ExitLift_Amy"))

	cs4_endcam:CutTo()

	doctor:SetTarget(loc1)
	doctor:SetMoveTime(3)	
	doctor:SetBehaviour("move")

	amy:SetTarget(loc2)
	amy:SetMoveTime(3)	
	amy:SetBehaviour("move")
	
	Wait(3)
	doors1:Trigger()
	doors2:Trigger()
	WaitFrame()
	--amy and doc inside
	lift_script.script.DoorOpen()
	lift_script.script.DoorOpen()
	HideLetterBox()
	game_cam:CutTo()
	
	FindNodeByName("Act2Progression").script.SetStage_JourneyToGenerator()
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
	SaveCheckpoint()
end
