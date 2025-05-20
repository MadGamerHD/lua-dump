global function StartScene()
	local amy = GetActor("amy")

	HideFade()
	
	ShowLetterBox()
	
	amy:SetBehaviour("wait")
	
	PlayMusic(FindNodeByName("Cut_6MusicDef"))
end

global function StartSound()
end

global function EndScene()
	local amy = GetActor("amy")
	local clock1 = FindNodeByShortName("EM_ANIMATOR_Clock_frame:0")
	local clock2 = FindNodeByShortName("second_clock")	
	local startup = FindNodeByName("StartupScript")
	startup.script.SetFloating()
	
	clock1:StopTrigger()
	clock2:Trigger()
	
	HideLetterBox()
	amy:SetBehaviour("pc")

	--Search the Drawing Room (done)
	SetGlobalObjectiveState("Objective_1_3_1", 3)
	--Locate Tractor Beam element (unlocked)
	SetGlobalObjectiveState("Objective_1_3_2", 2)
	
	FindNodeByName("ClockFact"):Sleep()
	FindNodeByName("ClockInteract"):Wake()
	
	PlayMusic(FindNodeByName("ExploreMusicDef"))
	
	--NEW
	--VO
	--explain the shake
		amy::SID_2476:We must have slipped into another riptide pocket. The TARDIS is really taking a pounding.
end

global function Text()
end
