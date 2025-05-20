global function ActorText()
end

global function StartScene()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)

	CutToLetterBox()

	PlayMusic(FindNodeByName("Cut_2MusicDef"))
end

global function EndScene()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local startup = FindNodeByName("StartupScript")
	
	PlayMusic(FindNodeByName("UrgentMusicDef"))
	
	HideLetterBox()

	doctor:DisablePhysics()
	startup.script.SetFloating()
	--doctor:Sleep()
	
	amy:SetBehaviour("pc")
	amy:SetMaxSpeed(4)

	--Restore power to the TARDIS
	--Pull the first Red Lever
	--Pull the second Red Lever
	AddGlobalObjective("Objective_1_1")

	FindNodeByName("AllControlsScript").script.ResetAllControls()	
	FindNodeByName("AllControlsScript").script.ResetConsoles()
	FindNodeByName("TutorialsScript").script.Idle()
	FindNodeByName("TutorialsScript").script.after_intro_hints = true
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
end