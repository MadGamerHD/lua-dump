global function PerformCutscene3()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local flanagan = GetActor("flanagan")
	local music = FindNodeByName("cs3_music")

	PlayMusic(music)

	-- Sleep in game shark
	FindNodeByName("Shark_Prop_0"):Sleep()

	-- Disable trigger node
	FindNodeByName("Flanagan_Trigger"):DisableNode()

	ShowLetterBox()

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	-- Hide the door leading to Jones computer room as another one is pulled in for the cutscene
	FindNodeByTag("posiedon_outer_entrance_door"):DisableNode()
	
	local cutscene3 = FindNodeByName("ActiveCutScene_3")
	cutscene3:Trigger()
	FindNodeByName("lua_transition").script.BlackScreen(2)
end

global function EndCutscene3()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local flanagan = GetActor("flanagan")
	local amb = FindNodeByName("act1_amb_def")

	PlayMusic(amb)
			
	-- Complete the first objective
	SetGlobalObjectiveState("POSEIDON_1_1", 3);
	
	--New objective - get Jones to open the door!
	AddGlobalObjective("POSEIDON_1_2")
	SetGlobalObjectiveState("POSEIDON_1_2", 2);
	
	-- Return the level's door
	FindNodeByTag("posiedon_outer_entrance_door"):EnableNode()
	
	--teleport amy and the doctor to the cutscene end position
	doctor:Teleport(FindNodeByName("poseidon_entrance_loc_doctor"))
	amy:Teleport(FindNodeByName("poseidon_entrance_loc_amy"))
	
	--temp should be done at end of cs3
	amy:SetTarget(FindNodeByName("jones_conversation_loc_amy"))
	amy:SetMoveTime(2.5)
	amy:SetBehaviour("move")

	--temp should be done at end of cs3	
	flanagan:SetTarget(FindNodeByName("jones_conversation_loc_flanagan"))
	flanagan:SetMoveTime(2.5)
	flanagan:SetBehaviour("move")
	
	doctor:SetBehaviour("pc")

	-- Wake up in game shark
	FindNodeByName("Shark_Prop_0"):Wake()

	HideLetterBox()
end