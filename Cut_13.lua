global function StartScene()
	ShowLetterBox()

	FindNodeByTag("amy"):Show()

	PlayMusic(FindNodeByName("Cut_13MusicDef"))
end


global function EndScene()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local dispense_int = FindNodeByName("dispense_int")

	HideLetterBox()
	
	doctor:SetBehaviour("wait")
	doctor:GetTransform():StopTrigger()
	amy:SetBehaviour("pc")

	--Send the Tachyon Feedback Loop to Amy (done)
	SetGlobalObjectiveState("Objective_2_3", 3)
	--Use the Tachyon Feedback Loop with the Console (done)
	SetGlobalObjectiveState("Objective_2_3_3", 3)
	
	--Repair the time lesion and reunite with the Doctor
	AddGlobalObjective("Objective_2_4")

	FindNodeByName("AllControlsScript").script.TurnOffAllConsoles()
	FindNodeByName("MonitorInteract"):Wake()
	FindNodeByName("CreakDirector"):Wake()
	FindNodeByName("Object_6_3"):Sleep()
	dispense_int:StopTrigger()

	PlayMusic(FindNodeByName("AmyMusicDef"))

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
	
	--VO
	--explain illness and yellow
		amy::SID_2686:I've got to pull myself together and work out how to meet back up with the Doctor.
end
