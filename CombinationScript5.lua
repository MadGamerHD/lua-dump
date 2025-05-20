-- Find the first part of the lasso.

local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

global script_node
global IsActiveScript
IsActiveScript = 0


global function ActivateCut_12()

-- This activates the VO where the doctor says to open the drawing room door.
	local Cut_12 = FindNodeByName("Cut_12")
	local CombScript2 = FindNodeByName("CombinationScript6")
	IsActiveScript = 0
	CombScript2.script.IsActiveScript = 1
	FindNodeByName("AllControlsScript").script.ResetAllControls()
	Cut_12:Trigger()

end

global function CheckCombination()
	local hint = QueryObjective(0)   
	
	if (Console3Objects.script.Object1State == 1 )  then
	
		--Start Minigame.
		--MinigameManager:SetCallback(script_node, "ActivateCut_12")
	
	end
	
end


