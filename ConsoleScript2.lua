global Obj1 
global Obj2 
global Obj3 

local ControlScript = FindNodeByName("AllControlsScript")

Obj1 = FindNodeByName("Object2_1Script")
Obj2 = FindNodeByName("Object2_2Script")
Obj3 = FindNodeByName("Object2_3Script")

global Object1State
global Object2State
global Object3State


global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end

global function ResetObjects()

	Object1State = 0
	Object2State = 0
	Object3State = 0

end

global function SpeakConsoleName()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
	
	else
		local amy = GetActor("amy")
				--VO Console Name introduction
		amy::SID_1280:This is the "Navigation" panel.
	end

end

global function TurnOn_1_1AllControls()
end

global function TurnOnAllControls()
	 FindNodeByName("Object_2_1"):Wake()
	 FindNodeByName("Object_2_2"):Wake()
end	                  

global function TurnOffAllControls()
	 FindNodeByName("Object_2_1"):Sleep()
	 FindNodeByName("Object_2_2"):Sleep()
end



global function Interact()
	local waypoint = FindNodeByName("LookAtConsole2")
	local console = FindNodeByTag("Con2")
	local actor
	
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		actor = GetActor("doctor")
	else
		actor = GetActor("amy")
	end
	actor:SetBehaviour("wait")
	SayPrep("skip","async")
	SetPOIPosAndLookZ(waypoint)

	
	FindNodeByName("AllControlsScript").script.InteractStart()
	actor:SetTarget(FindNodeByName("Stand2"))
	actor:SetMoveTime(1)
	actor:SetBehaviour("move")
	
	BeginPOI(2, 400, 3, true, true)
	ControlScript.script.TurnOffAllConsoles()	
	
	Wait(2)
	
	local hint = QueryObjective(0)   
	-- This wait is here because the move to did not always return to wait, sometimes it ended up in PC
	actor:SetBehaviour("wait")
	
	if(hint == "hint_1_1") then
		TurnOn_1_1AllControls()
	else
		TurnOnAllControls()
		SpeakConsoleName()
	end
	FindNodeByName("AllControlsScript").script.FlashLevers()
	local overlays = FindManagerByName("EmAdventureGame_OverlayManager")

	SayPrep("","")

--	overlays:SetHudCallback(4,ControlScript.script.script_node,"MoveLeft")
	overlays:SetHudCallback(5,ControlScript.script.script_node,"MoveAway")
--	overlays:SetHudCallback(6,ControlScript.script.script_node,"MoveRight")
	Start2dMode()
end
