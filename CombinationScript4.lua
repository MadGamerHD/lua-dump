-- Make the earpiece.

local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

global IsActiveScript
IsActiveScript = 0
global script_node

-- Got the earpiece, now we need to find the lasso speech
global function ActivateVoiceOver_10()
	local doctor = GetActor("doctor")
	local VO_10 = FindNodeByName("VO_10")
	local CombScript2 = FindNodeByName("CombinationScript5")
	
	print("Start VO 10","\n")

	IsActiveScript = 0
	CombScript2.script.IsActiveScript = 1

	FindNodeByName("AllControlsScript").script.ResetAllControls()

	VO_10:Trigger()
end

global function CheckCombination()
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0) 

	if (Console6Objects.script.Object7State == 1)then
		SetGlobalObjectiveState("Objective_2_1_1", 3)
		print("ob7 set","\n")
	end

	if (Console6Objects.script.Object3State == 1)then
		SetGlobalObjectiveState("Objective_2_1_2", 3)
		print("ob6 set","\n")
	end
	
	if (Console6Objects.script.Object7State == 1 and Console6Objects.script.Object3State == 1) then
		print("play CS","\n")
		ActivateVoiceOver_10()
	else
		print("Return Bechaiovr","\n")
		doctor:SetBehaviour("pc")
		HideLetterBox()
	end
end

--REDUNDANT?
global function MinigameComplete()
end
