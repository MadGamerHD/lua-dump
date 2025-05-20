--Opening the door to the drawing room.

local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

global script_node

global IsActiveScript
IsActiveScript = 0

global function ActivateCutScene8()

-- Opend the door, now we need the long direction instructions from the doctor to find the next room.
	local Cut_8 = FindNodeByName("Cut_8")
	IsActiveScript = 0
	Cut_8:Trigger()

end

global function CheckCombination()

	local hint = QueryObjective(0)   
	
	--	if (Console3Objects.script.Object1State == 1 and 
--	Console3Objects.script.Object2State == 1 and 
--	Console6Objects.scripts.Object1State == 1 and
--	hint == "hint_1_5_2")  then
--		ActivateCutScene8()
--	end

	-- temp
	if (Console5Objects.script.Object4State == 1 and 
	hint == "hint_1_5_2")  then
		ActivateCutScene8()
	end
	
	if (Console5Objects.script.Object1State == 1 and hint == "hint_1_5_1")then
		SetGlobalObjectiveState("Objective_1_5_1", 3)
		SetGlobalObjectiveState("Objective_1_5_2", 2)
		
	end



	

end

