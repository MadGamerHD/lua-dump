-- Make the earpiece.

local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

global IsActiveScript
IsActiveScript = 0

-- Got the earpiece, now we need to find the lasso speech
global function ActivateCut_3()
	local Cut_3 = FindNodeByName("Cut_3")
	local CombScript2 = FindNodeByName("CombinationScript2")

	print("Do Cut 3","\n")
	
	IsActiveScript = 0
	CombScript2.script.IsActiveScript = 1
	FindNodeByName("AllControlsScript").script.TurnOffControls()
	FindNodeByName("AllControlsScript").script.ResetAllControls()
	
	Cut_3:Trigger()
end

global function CheckCombination()
	print("Check comb 3","\n")

	if (Console3Objects.script.Object3State == 1 and Console5Objects.script.Object5State == 1) then
		ActivateCut_3()
	else 
		FindNodeByName("AllControlsScript").script.TurnOffControls()
	end
end

