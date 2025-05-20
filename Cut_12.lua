global script_node

global function StartScene()
	local doctor = GetActor("doctor")
	local Osc = FindNodeByName("Oscillator")

	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
end

global function EndScene()
	local doctor = GetActor("doctor")
	local watch = FindNodeByName("FobWatch")
	local crystal = FindNodeByName("KontronCrystal")
	local TimeBandage = FindNodeByName("TimeBandage")
	local dispensor = FindNodeByName("dispense_int")
	
	doctor:RemoveInventoryItem(watch)
	doctor:RemoveInventoryItem(crystal)
	doctor:AddInventoryItem(TimeBandage)

	dispensor:Trigger()
	
	HideLetterBox()

	--Build a Tachyon Feedback Loop (done)
	SetGlobalObjectiveState("Objective_2_2", 3)
	--Assemble Tachyon Feedback Loop (done)
	SetGlobalObjectiveState("Objective_2_2_3", 3)
	
	--Send the Tachyon Feedback Loop to Amy
	--Use the Tachyon Feedback Loop with the Console
	AddGlobalObjective("Objective_2_3")

	doctor:SetBehaviour("pc")

	FindNodeByName("AllControlsScript").script.ResetAllControls()
end


global function TimeBandadgeComplete()
	ShowLetterBox()
	FindNodeByName("Cut_12"):Wake()
end

global function RunMinigame()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local Minigame = MinigameManager:GetAssembleMiniGame()

	FindNodeByName("Cut_12"):Sleep()
	HideLetterBox()

	SayPrep("skip","async")

	MinigameManager:SetMiniGameID("MINI_ASSEMBLE02")
	Minigame:SetCurrentMaze(4)
	MinigameManager:StartMiniGame(Minigame)
	MinigameManager:SetCallback(script_node, "TimeBandadgeComplete")
end