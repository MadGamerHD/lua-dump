local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

local Console1Interact = FindNodeByName("Console1Interactable")
local Console2Interact = FindNodeByName("Console2Interactable")
local Console3Interact = FindNodeByName("Console3Interactable")
local Console4Interact = FindNodeByName("Console4Interactable")
local Console5Interact = FindNodeByName("Console5Interactable")
local Console6Interact = FindNodeByName("Console6Interactable")
global script_node
local mode2D = 0

global function DoHintCheck()
	local hint = QueryObjective(0)   
	local hint1 = QueryObjective(1)  

	--wake red levers
	if(hint == "hint_1_1") then
		if (Console3Objects.script.Object3State == 0) then
			Console3Interact:Wake()
		end
		
		if (Console5Objects.script.Object5State == 0) then
			Console5Interact:Wake()
		end
	end

	--wake levers up
	if(hint1 == "hint_1_2_2") then
		Console6Interact:Wake() 
	end
	
	--laser socket open
	if(hint1 == "hint_1_4_1" )then
		FindNodeByName("Object_5_1"):Wake()
	end
	
	--ready to fire
	if(hint1 == "hint_1_4_2") then
		Console5Interact:Wake() 
	end
end

global function FlashLevers()
	StartHighlight()
	Wait(0.4)
	StopHighlight()
	Wait(0.2)
	StartHighlight()
	Wait(0.4)
	StopHighlight()
	Wait(0.2)
	StartHighlight()
	Wait(0.4)
	StopHighlight()
end

global function TurnOffAllConsoles()
	Console1Interact:Sleep()
        Console2Interact:Sleep()
	Console3Interact:Sleep() 
        Console4Interact:Sleep()
        Console5Interact:Sleep() 
        Console6Interact:Sleep() 
end
       
global function TurnOnAllConsoles()
	Console1Interact:Sleep()
        Console2Interact:Sleep()
	Console3Interact:Sleep() 
        Console4Interact:Sleep()
        Console5Interact:Sleep()
        Console6Interact:Sleep() 
        DoHintCheck()
end
 
global function TurnOffAllControls()
	Console1Objects.script.TurnOffAllControls()
	Console2Objects.script.TurnOffAllControls()
	Console3Objects.script.TurnOffAllControls()
	Console4Objects.script.TurnOffAllControls()
	Console5Objects.script.TurnOffAllControls()
	Console6Objects.script.TurnOffAllControls()
end

global function ResetConsoles()
	TurnOffAllControls()
	TurnOnAllConsoles()
end

global function ResetAllControls()
	Console1Objects.script.ResetObjects()
	Console2Objects.script.ResetObjects()
	Console3Objects.script.ResetObjects()
	Console4Objects.script.ResetObjects()
	Console5Objects.script.ResetObjects()
	Console6Objects.script.ResetObjects()
end

global function TurnOffInterface()
	StopHighlight()
	Stop2dMode()
	mode2D = 0
end

global function TurnOnInterface()
	Start2dMode()
	mode2D = 1
end

global function TurnOffControls()
	local amy = GetActor("amy")

	Stop2dMode()	
	
	Wait(0.1)
	StopHighlight()
	StopPOIWait()
	ResetPlayerCamera()
	mode2D = 0
	TurnOffAllControls()
	TurnOnAllConsoles()
	
	amy:SetBehaviour("pc")
end

global function InteractDone()
	FindNodeByName("CombinationScriptControl").script.CheckCombination()
end

global function InteractStart()
	EnableActorCameraCollision()
	
	if (mode2D == 1) then
		InteractDone()
		InteractStart()
	else
		mode2D = 1
	end
end

global function MoveLeft()
end

global function MoveAway()
	TurnOffControls()
end

global function MoveRight()
end

global function Init()
	WaitFrame()
	ResetAllControls()	
	ResetConsoles()
end