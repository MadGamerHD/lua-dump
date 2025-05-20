global Obj1
Obj1 = FindNodeByName("Object6_1Script")
global Obj2 
Obj2 = FindNodeByName("Object6_2Script")
global Obj3
Obj3 = FindNodeByName("Object6_3Script")
global Obj4
Obj4 = FindNodeByName("Object6_4Script")
global Obj5
Obj5 = FindNodeByName("Object6_5Script")
global Obj6
Obj6 = FindNodeByName("Object6_6Script")

local ControlScript = FindNodeByName("AllControlsScript")

global Object1State
global Object2State
global Object3State
global Object4State
global Object5State
global Object6State
global Object7State		-- this is the date meter

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end

global function ResetObjects()
	Object1State = 0
	Object2State = 1
	Object3State = 0
	Object4State = 0
	Object5State = 1
	Object6State = 0
	
	Object7State = 0
	print("Reset 6","\n")

end

global function TurnOffConsole( )
end

global function SpeakConsoleName()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
	
	else
		local amy = GetActor("amy")
				--VO Console Name introduction
		amy::SID_1284:This is the "Mechanical" panel.
	end
end

global function TurnOn_1_1AllControls()
end

global function TurnOnAllControls()
	local hint = QueryObjective(1)   
	if(hint == "hint_1_2_2") then
	--	FindNodeByName("Object_6_1"):Wake()
		FindNodeByName("Object_6_2"):Wake()
	--	FindNodeByName("Object_6_3"):Wake()
		FindNodeByName("Object_6_4"):Wake()
		FindNodeByName("Object_6_5"):Wake()
		FindNodeByName("Object_6_6"):Wake()
	else
		FindNodeByName("Object_6_1"):Wake()
		FindNodeByName("Object_6_2"):Wake()
		FindNodeByName("Object_6_3"):Wake()
		FindNodeByName("Object_6_4"):Wake()
		FindNodeByName("Object_6_5"):Wake()
		FindNodeByName("Object_6_6"):Wake()
	end
end	                  

global function TurnOffAllControls()
	 FindNodeByName("Object_6_1"):Sleep()
	 FindNodeByName("Object_6_2"):Sleep()
	 FindNodeByName("Object_6_3"):Sleep()
	 FindNodeByName("Object_6_4"):Sleep()
	 FindNodeByName("Object_6_5"):Sleep()
	 FindNodeByName("Object_6_6"):Sleep()
end

global function Interact()
	local waypoint = FindNodeByName("LookAtConsole6")
	local console = FindNodeByTag("Con6")
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

	actor:SetTarget(FindNodeByName("Stand6"))
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
