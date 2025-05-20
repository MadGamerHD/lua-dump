global function StartScene()
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("CorridorEntryLoc")
	local loc2 = FindNodeByName("DrawingRoomEntryLoc")
	local sting = FindNodeByName("room_pan")
	local doorprop1 = FindNodeByName("Door1Prop")
	local doorprop2 = FindNodeByName("Door2Prop")

	amy:DisablePhysics()
	amy:SetBehaviour("wait")
	amy:Teleport(loc1)

	ShowLetterBox()

	amy:SetTarget(loc2)
	amy:SetMoveTime(5)
	amy:SetBehaviour("move")

	Wait(0.5)
	doorprop1:Move(FindNodeByName("Door1Loc_1"),2,"sine")
	doorprop2:Move(FindNodeByName("Door2Loc_1"),2,"sine")

	Wait(0.5)
	PlayMusic(sting)
	
	Wait(6)
	doorprop1:MoveToOrigin(1,"sine")
	doorprop2:MoveToOrigin(1,"sine")	
end

global function EndScene()
	local amy = GetActor("amy")
	local music = FindNodeByName("dr_bg_music")
	
	PlayMusic(music)

	HideLetterBox()

	amy:EnablePhysics()
	amy:SetBehaviour("pc")
	
	--Gain access to the Drawing Room (done)
	SetGlobalObjectiveState("Objective_1_2", 3)
	--Enter the Drawing Room (done)
	SetGlobalObjectiveState("Objective_1_2_3", 3)

	--Investigate the Drawing Room for Tractor Beam element
	--Search the Drawing Room
	AddGlobalObjective("Objective_1_3")
end