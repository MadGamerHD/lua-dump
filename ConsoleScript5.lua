global Obj1
global Obj2
global Obj3
global Obj4
global Obj5

Obj1= FindNodeByName("Object5_1Script")
Obj2= FindNodeByName("Object5_2Script")
Obj3= FindNodeByName("Object5_3Script")
Obj4= FindNodeByName("Object5_4Script")             
Obj5= FindNodeByName("Object5_5Script")             
global ControlScript
ControlScript = FindNodeByName("AllControlsScript")

global Object1State
global Object2State
global Object3State
global Object4State
global Object5State

global function SpeakConsoleName()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
	
	else
		local amy = GetActor("amy")

		--VO Console Name introduction
			amy::SID_1283:This is the "Fabrication" panel.
	end
end

global function TurnOn_1_1AllControls()
	print("Turn on 1_1 controls","\n")
	FindNodeByName("Object_5_5"):Wake()
end

global function TurnOnAllControls()
	print("Turn on all controls","\n")
	local hint = QueryObjective(1)   
	local amy = GetActor("amy")

	--n/a
	if(hint == "hint_1_3_2") then
		FindNodeByName("Object_5_1"):Wake()
		FindNodeByName("Object_5_2"):Wake()
		FindNodeByName("Object_5_3"):Wake()
		FindNodeByName("Object_5_4"):Wake()
	--insert screw
	elseif (hint == "hint_1_4_1") then
		FindNodeByName("Object_5_1"):Wake()
	--aim and fire
	elseif (hint == "hint_1_4_2") then
		--VO 
		--Controls for the tractor beam direction
			amy::SID_1565:The button here should start it up, it looks like those other levers move it around.

		FindNodeByName("Object_5_1"):Sleep()
		FindNodeByName("Object_5_2"):Wake()
		FindNodeByName("Object_5_3"):Wake()
		FindNodeByName("Object_5_4"):Wake()
	--n/a
	else
		FindNodeByName("Object_5_1"):Wake()
		FindNodeByName("Object_5_2"):Wake()
		FindNodeByName("Object_5_3"):Wake()
		FindNodeByName("Object_5_4"):Wake()
		FindNodeByName("Object_5_5"):Wake()
	end
end	                  

global function TurnOffAllControls()
	print("Turn off all controls","\n")
	 FindNodeByName("Object_5_1"):Sleep()
	 FindNodeByName("Object_5_2"):Sleep()
	 FindNodeByName("Object_5_3"):Sleep()
	 FindNodeByName("Object_5_4"):Sleep()
	 FindNodeByName("Object_5_5"):Sleep()
end

global function Interact()
	local waypoint = FindNodeByName("LookAtConsole5")
	local console = FindNodeByTag("Con5")
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

	actor:SetTarget(FindNodeByName("Stand5"))
	actor:SetMoveTime(1)
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
end

global function Exit()
	--Deactivate 2d mode Return
	ControlScript.script.TurnOnAllConsoles()
	TurnOffAllControls()
end
