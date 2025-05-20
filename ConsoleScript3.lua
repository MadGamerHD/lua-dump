global Obj1 
global Obj2 
global Obj3 
global Obj4 
global Obj5 
global Obj6 

local ControlScript = FindNodeByName("AllControlsScript")

Obj1 = FindNodeByName("Object3_1Script")
Obj2 = FindNodeByName("Object3_2Script")
Obj3 = FindNodeByName("Object3_3Script")
Obj4 = FindNodeByName("Object3_4Script")
Obj5 = FindNodeByName("Object3_5Script")
Obj6 = FindNodeByName("Object3_6Script")

global Object1State
global Object2State
global Object3State
global Object4State
global Object5State
global Object6State


global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end

global function ResetObjects()

	Object1State = 0
	Object2State = 0
	Object3State = 0
	Object4State = 0
	Object5State = 0
	Object6State = 0

end

global function SpeakConsoleName()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
	
	else
		local amy = GetActor("amy")
				--VO Console Name introduction
		amy::SID_1281:This is the "Diagnostic" panel.
	end

end

global function TurnOn_1_1AllControls()
	print("Turn on 1_1","\n")
	FindNodeByName("Object_3_3"):Wake()
end

global function TurnOnAllControls()
	print("Turn on all","\n")
	 FindNodeByName("Object_3_1"):Wake()
	 FindNodeByName("Object_3_2"):Wake()
	 FindNodeByName("Object_3_3"):Wake()
	 FindNodeByName("Object_3_4"):Wake()
	 FindNodeByName("Object_3_5"):Wake()
	 FindNodeByName("Object_3_6"):Wake()
end	                  

global function TurnOffAllControls()
	print("Turn off all","\n")
	 FindNodeByName("Object_3_1"):Sleep()
	 FindNodeByName("Object_3_2"):Sleep()
	 FindNodeByName("Object_3_3"):Sleep()
	 FindNodeByName("Object_3_4"):Sleep()
	 FindNodeByName("Object_3_5"):Sleep()
	 FindNodeByName("Object_3_6"):Sleep()
end

global function Interact()

	local waypoint = FindNodeByName("LookAtConsole3")
	local console = FindNodeByTag("Con3")
	local actor
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		actor = GetActor("doctor")
	else
		actor = GetActor("amy")
	end
	
	actor:SetBehaviour("wait")
	
	SayPrep("skip","async")
	FindNodeByName("AllControlsScript").script.InteractStart()
	SetPOIPosAndLookZ(waypoint)
	BeginPOI(2, -1, 3, true, true)
	ControlScript.script.TurnOffAllConsoles()	

	actor:SetMoveTime(1)
	actor:SetTarget(FindNodeByName("Stand3"))
	actor:SetBehaviour("move")

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
