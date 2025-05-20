global script_node

local first = true
local ControlScript = FindNodeByName("Laser_puzzle_scripts")

global function MoveAway()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local int_amy = FindNodeByName("int_amy")

	int_amy:Trigger()
	
	Stop2dMode()
	StopPOIWait()
	ResetPlayerCamera()
	ControlScript.script.TurnOffAllControls()

	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")	
	amy:EnablePhysics()
end

global function ZoomIn()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local waypoint_doc = FindNodeByName("loc_button_console_doc")
	local waypoint_amy = FindNodeByName("loc_button_console_amy")
	local camera_view = FindNodeByName("loc_lookat_console")
	local overlays = FindManagerByName("EmAdventureGame_OverlayManager")
	local int_amy = FindNodeByName("int_amy")

	int_amy:StopTrigger()

	doctor:SetTarget(waypoint_doc)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")

	amy:SetTarget(waypoint_amy)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	
	SetPOIPosAndLookZ(camera_view)
	BeginPOI(2, 400, 2, true, true)
	
	ControlScript.script.TurnOnAllControls()	
	
	Wait(2)
	doctor:SetBehaviour("wait")
	
	overlays:SetHudCallback(5,script_node,"MoveAway")
	Start2dMode()
end

global function Trigger()
	StopPOIWait()
	ResetPlayerCamera()
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local manacle=FindNodeByName("script_manacle1")
	
	if manacle.script.amy_freed==1 then
		if(first == true) then
			first = false
			SayPrep("skip", "async")
			--VO
			--First use of conversion controls
				doctor::SID_1820:This looks like the Conversion Controls.
			ZoomIn()
		else
			ZoomIn()
		end
	else
		--HINT.
		--Trying to press laser button with Amy still tied
			amy::SID_0902:Please get me out of here before you press any buttons.
	end
end

global function Examine_Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
	--VO
		doctor::SID_1833:The laser blasted straight through the wall.
end
