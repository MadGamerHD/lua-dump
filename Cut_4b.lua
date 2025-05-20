global function EndScene()
	local amy = GetActor("amy")
	local Teleport = FindNodeByName("Stairs_1_Trigger")
	local DrawingEntrance = FindNodeByName("EntranceToDrawing")
	local startup = FindNodeByName("StartupScript")
	
	startup.script.SetFloating()
	
	HideLetterBox()
	
	amy:SetBehaviour("pc")

	Teleport:Sleep()
	
	DrawingEntrance:Wake()
	
	--Move all the Levers up on the Mechanical Panel (done)
	SetGlobalObjectiveState("Objective_1_2_2", 3)
	--Enter the Drawing Room (unlocked)
	SetGlobalObjectiveState("Objective_1_2_3", 2)
	
	FindNodeByName("AllControlsScript").script.TurnOnAllConsoles()	
end