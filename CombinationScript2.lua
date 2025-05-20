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
local PuzzleState = 0
local failed = 0
local TractorHeight
TractorHeight = 0
local TractorPos
TractorPos = 0
local tractorGunProp = FindNodeByName("TractorProp")

global function ActivateCut_4b()
	local Cut_4b = FindNodeByName("Cut_4b")
	local CombScript2 = FindNodeByName("CombinationScript3")

	IsActiveScript = 0
	CombScript2.script.IsActiveScript = 1
	
	FindNodeByName("AllControlsScript").script.TurnOffControls()
	FindNodeByName("AllControlsScript").script.ResetAllControls()

	-- This activates the VO where the doctor says to open the drawing room door.
	Cut_4b:Trigger()
end

global function FailedTask()
	local amy = GetActor("amy")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	FindNodeByName("AllControlsScript").script.ResetAllControls()
	FindNodeByName("Object6_5Script").script.ResetControl()
	FindNodeByName("Object6_2Script").script.ResetControl()
	FindNodeByName("Object6_4Script").script.ResetControl()
	FindNodeByName("Object6_6Script").script.ResetControl()

	PuzzleState = 0
	failed = 0
	
	--VO 
	--Amy uses the wrong control
		amy::SID_1548:No! That's reset all the controls.
	
	Wait(2)
	FindNodeByName("AllControlsScript").script.TurnOnInterface()
end

global function NextPosComment()
	local amy = GetActor("amy")

	SayPrep("skip","async")

	if (PuzzleState == 0) then
		if (Console6Objects.script.Object2State == 1) then
			--VO 
			--Amy uses the first lever in the correct order
				amy::SID_1891:That seems like a good start.
		else	
			--VO 
			--Amy uses the first lever in the wrong order(dosent know yet)
				amy::SID_1129:Okay, that's a start.
		end
	elseif(PuzzleState == 1)then
		--VO 
		--Amy uses the second lever in correct order
			amy::SID_1549:Looking good.
	elseif(PuzzleState == 2)then
		--VO 
		--Amy uses the second lever in correct order
			amy::SID_1550:Woo! Winner. That should have fixed it I hope.
	elseif(PuzzleState == 3)then
	end
end

global function CheckCombination()
	local hint = QueryObjective(0)   
	local amy = GetActor("amy")
	
	print(Console6Objects.script.Object4State,"")
	print(Console6Objects.script.Object2State,"")
	print(Console6Objects.script.Object6State,"")
	print(Console6Objects.script.Object5State,"\n")
	
	if (Console6Objects.script.Object4State == 1 and Console6Objects.script.Object2State == 1 and Console6Objects.script.Object6State == 1 and Console6Objects.script.Object5State == 1) then
		ActivateCut_4b()
	end
end


