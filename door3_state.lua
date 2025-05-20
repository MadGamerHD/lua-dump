global script_node

local actors_in_range = 0
local actors_on_side = 0
local awaiting_floor_switch = false
local door_is_open = false

global function DoorOpen()
	actors_in_range = actors_in_range  + 1
end

global function DoorTrigger()
	print("Try open the door")
	
	if not door_is_open then
		door_is_open = true
		local doorOpenAnim = FindNodeByTag("Horizontal_Door_Open")
		local doorProp = script_node:FindNodeByTag("Horizontal_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
	end
end

local function TryDoorClose()
	print("Try close the door")
	print("actors_in_range = "..actors_in_range.."actors_on_side = "..actors_on_side)
	
	if (actors_in_range <= 0 and ((actors_on_side % 2) == 0)) then
		if door_is_open then
			door_is_open = false
			
			local doorCloseAnim = FindNodeByTag("Horizontal_Door_Close")
			local doorProp = script_node:FindNodeByTag("Horizontal_Door_Prop")

			doorProp:PlayAnim(doorCloseAnim, 1, 0.01)

			local InteractObj1 = script_node:FindNodeByTag("HorizDoorInteract1")
			InteractObj1:EnableNode()

			local InteractObj2 = script_node:FindNodeByTag("HorizDoorInteract2")
			InteractObj2:EnableNode()
			
			script_node:FindNodeByTag("FloorSwitchTrigger1"):EnableNode()
			script_node:FindNodeByTag("FloorSwitchTrigger2"):EnableNode()
		end
	end
end

global function DoorClose()
	actors_in_range = actors_in_range - 1
	TryDoorClose()
end

local function Interact(floor_switch_index)
	local doctor = GetActor("doctor")
	local amy =  GetActor("amy")

	doctor:SetBehaviour("wait")

	-- Swap players
	-- This first time we do this explain what needs to be done
	local door_globals = FindNodeByName("DoorGlobals")
	
	if door_globals.script.do_floor_switch_vo then
		print("doc walk and talk")

		ShowLetterBox()
		
		door_globals.script.do_floor_switch_vo = false
		
		SayPrep("", "async")
		
		--add locator to def and ref in...
		--move to point
		--play interact high
		
		--HINT
		--*NEW
		doctor::SID_2607:It's not opening. While I hold this, try standing on that floor switch Amy.
		
		Wait(1)
		local camera_look_at = script_node:FindNodeByTag("FloorSwitch_"..floor_switch_index) -- TODO determine which one to look at...

		SetPOILookAtNode(camera_look_at)
		SetPOIPositionNode(FindNodeByName("EmDefaultCamera"))
		BeginPOI(1.0, 3.0, 0.1, true, true)

		Wait(3)
		ShowFade()

		Wait(1)
		HideLetterBox()
	else
		ShowFade()
		Wait(1)
	end
		
	local InteractObj1 = script_node:FindNodeByTag("HorizDoorInteract1")
	InteractObj1:DisableNode()
	
	local InteractObj2 = script_node:FindNodeByTag("HorizDoorInteract2")
	InteractObj2:DisableNode()
	
	Wait(0.1)
	amy:SetBehaviour("pc")
	
	awaiting_floor_switch = true
	
	HideFade()
end

global function Interact1()
	Interact(2)
end

global function Interact2()
	Interact(1)
end

global function Use()	
end

local function HandBackControlToDoctor()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
			
	amy:SetBehaviour("wait")
	
	ShowLetterBox()
			
	SayPrep("", "")
	--When amy stands on the floorswitch
	--*NEW
	--HINT
	amy::SID_2608:It's opening now.
	
	ShowFade()
	
	Wait(1)
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	awaiting_floor_switch = false
	
	HideFade()
end

global function DoorSwitch1Pressed()
	if awaiting_floor_switch then

		DoorTrigger()
		
		--local pressSwitchAnim = FindNodeByTag("Floor_Switch_Press")
		--local switchProp = script_node:FindNodeByTag("Floor_Switch_Prop1")
		--switchProp:PlayAnim(pressSwitchAnim, 1, 0.01)
		
		script_node:FindNodeByTag("FloorSwitchTrigger1"):DisableNode()

		HandBackControlToDoctor()
	end
end

global function DoorSwitch1Released()
	print("Floor switch released")
	
	--local releaseSwitchAnim = script_node:FindNodeByTag("Floor_Switch_Release")
	--local switchProp = script_node:FindNodeByTag("Floor_Switch_Prop1")
	--switchProp:PlayAnim(releaseSwitchAnim, 1, 0.01)
end

global function DoorSwitch2Pressed()
	if awaiting_floor_switch then
	
		DoorTrigger()
		
		--local pressSwitchAnim = FindNodeByTag("Floor_Switch_Press")
		--local switchProp = script_node:FindNodeByTag("Floor_Switch_Prop2")
		--switchProp:PlayAnim(pressSwitchAnim, 1, 0.01)
		
		script_node:FindNodeByTag("FloorSwitchTrigger2"):DisableNode()
		
		HandBackControlToDoctor()
	end
end

global function DoorSwitch2Released()
	print("Floor switch released")
		
	--local releaseSwitchAnim = script_node:FindNodeByTag("Floor_Switch_Release")
	--local switchProp = script_node:FindNodeByTag("Floor_Switch_Prop2")
	--switchProp:PlayAnim(releaseSwitchAnim, 1, 0.01)
end

global function DoorPlanePassedForward()
	print("doorway passed forward!", "\n")
	actors_on_side = actors_on_side + 1
	TryDoorClose()
end

global function DoorPlanePassedReverse()
	print("doorway passed in reverse!", "\n")
	actors_on_side = actors_on_side - 1
	TryDoorClose()
end
