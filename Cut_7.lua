global function StartScene()
	local amy = GetActor("amy")

	HideFade()

	ShowLetterBox()
	
	amy:SetBehaviour("wait")

	PlayMusic(FindNodeByName("Cut_7MusicDef"))
end

global function EndScene()
	local amy = GetActor("amy")
	local waypoint = FindNodeByName("DownstairsTPMoveTo")
	local laser =  FindNodeByName("LaserScrewdriverInvItem")
	local clock_fact = FindNodeByName("second_clock_fact")	
	local startup = FindNodeByName("StartupScript")
	local solid = FindNodeByTag("BottleMesh")
	local broken = FindNodeByTag("broken")
		
	startup.script.SetFloating()
	
	clock_fact:Trigger()
	solid:StopTrigger()
	broken:Trigger()
	
	HideLetterBox()

	amy:Teleport(waypoint)
	amy:EnablePhysics()
	amy:AddInventoryItem (laser)
	amy:SetBehaviour("pc")
	
	--Investigate the Drawing Room for Tractor Beam element (done)
	SetGlobalObjectiveState("Objective_1_3", 3)
	--Locate Tractor Beam element (done)
	SetGlobalObjectiveState("Objective_1_3_2", 3)

	--Assemble the Tractor Beam and rescue the Doctor
	--Attach the Laser Screwdriver to the Fabrication Panel
	AddGlobalObjective("Objective_1_4")
	
	FindNodeByName("ClockProp"):TeleportToOrigin()
	FindNodeByName("AllControlsScript").script.TurnOnAllConsoles()
	
	PlayMusic(FindNodeByName("ExploreMusicDef"))
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
end

global function ShowScrew()
end