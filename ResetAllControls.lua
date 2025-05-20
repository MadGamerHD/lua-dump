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

local mode2D = 0

global function TurnOffAllConsoles()
	Console1Interact:Sleep()
        Console2Interact:Sleep()
	Console3Interact:Sleep() 
        Console4Interact:Sleep()
        Console5Interact:Sleep() 
        Console6Interact:Sleep() 
 end
 
 global function DoHintCheck()
 	local hint = QueryObjective(0) 
 	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer())then
 		TurnOffAllConsoles()
		--voltemeter on to be powered up
 		if (hint == "hint_2_3_2")then
 			FindNodeByName("Object_6_3"):Wake()
 		end
 	end
	print("HintCheck","\n")
	if(hint == "hint_2_1_1" or hint == "hint_2_1_2") then
		TurnOffAllConsoles()
		--date bank on for inspection
		if (Console6Objects.script.Object7State == 0) then
			print("wake_7_1","\n")
			FindNodeByName("Object_7_1"):Wake()
		end
		--voltemeter on for inspection
		if (Console6Objects.script.Object3State == 0) then
			print("Waking 6_3","\n")
			FindNodeByName("Object_6_3"):Wake()		
		end
	end
end     
 
global function TurnOnAllConsoles()
--	Console1Interact:Wake()
--        Console2Interact:Wake()
--	Console3Interact:Wake() 
--        Console4Interact:Wake()
--        Console5Interact:Wake() 
--        Console6Interact:Wake() 
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
 
global function ResetAllControls()
	Console1Objects.script.ResetObjects()
	Console2Objects.script.ResetObjects()
	Console3Objects.script.ResetObjects()
	Console4Objects.script.ResetObjects()
	Console5Objects.script.ResetObjects()
	Console6Objects.script.ResetObjects()
	TurnOffAllControls()
	TurnOnAllConsoles()
end

global function InteractDone()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		if (mode2D == 1) then
			StopPOIWait()
			ResetPlayerCamera()
			Stop2dMode()
			mode2D = 0
			TurnOffAllControls()
			TurnOnAllConsoles()	
		end

		FindNodeByName("CombinationScriptControl").script.CheckCombination()
		
		doctor:SetBehaviour("pc")
	else
		StopPOIWait()
		ResetPlayerCamera()
		Stop2dMode()
		mode2D = 0
		TurnOffAllControls()
		TurnOnAllConsoles()
		
		FindNodeByName("CombinationScriptControl").script.CheckCombination()
		
		amy:SetBehaviour("pc")
	end
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

global function Init()
	WaitFrame()
	ResetAllControls()
end
