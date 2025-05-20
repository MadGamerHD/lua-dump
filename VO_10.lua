global function StartScene()
	local doctor = GetActor("doctor")

	ShowLetterBox()
	
	doctor:SetBehaviour("wait")

	SetPOIPosAndLookZ(FindNodeByName("Cut_10Loc"))
	BeginPOI(2, 33, 3, true, true)
end


global function EndScene()
	local doctor = GetActor("doctor")

	HideLetterBox()

	FindNodeByName("Stairs_1_Trigger"):Sleep()
	FindNodeByName("EntranceToDrawingDoc"):Wake()
	
	--Find out what is happening (done)
	SetGlobalObjectiveState("Objective_2_1", 3)

	--Build a Tachyon Feedback Loop
	--Find something to keep track of time
	--Find something to focus and hold time in place
	AddGlobalObjective("Objective_2_2")

	StopPOIWait()
	ResetPlayerCamera()

	doctor:SetBehaviour("pc")
end
