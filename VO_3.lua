global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	ShowLetterBox()

	amy:SetBehaviour("wait")

	PlayMusic(FindNodeByName("ExploreMusicDef"))
end

global function PlaySound()
end

global function EndScene()
	local amy = GetActor("amy")
	local startup = FindNodeByName("StartupScript")
	local mon = FindNodeByName("MonitorMoveTo")
	
	startup.script.SetFloating()
	
	HideLetterBox()
	
	amy:Teleport(mon)
	amy:SetBehaviour("pc")
	
	--Levers done
	SetGlobalObjectiveState("Objective_1_1", 3)
	
	--Gain access to the Drawing Room
	AddGlobalObjective("Objective_1_2")
	--Enter the Drawing Room
	SetGlobalObjectiveState("Objective_1_2_3", 2)	
	
	FindNodeByName("AllControlsScript").script.ResetAllControls()	
	FindNodeByName("AllControlsScript").script.ResetConsoles()

	FindNodeByName("MonitorInteract"):Wake()

	PlayMusic(FindNodeByName("ExploreMusicDef"))
end
