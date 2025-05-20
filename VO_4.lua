global function StartScene()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")

	ShowLetterBox()

	amy:SetBehaviour("wait")
	doctor:Wake()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
end

global function EndScene()
	local amy = GetActor("amy")
	local startup = FindNodeByName("StartupScript")
	startup.script.SetFloating()
	
	HideLetterBox()

	amy:SetBehaviour("pc")

	--Move all the Levers up on the Mechanical Panel (unlocked)
	SetGlobalObjectiveState("Objective_1_2_2", 2)

	FindNodeByName("AllControlsScript").script.TurnOnAllConsoles()
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)	
end