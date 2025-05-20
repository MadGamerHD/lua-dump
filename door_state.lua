local actors_in_range
actors_in_range = 0

local door_state
door_state = 0

global script_node

local position1=script_node:FindNodeByTag("DoorStopLoc1")
local position2=script_node:FindNodeByTag("DoorStopLoc2")
local DoorProp1=script_node:FindNodeByTag("DoorProp1")
local DoorProp2=script_node:FindNodeByTag("DoorProp2")
local audioOpenNode = script_node:FindNodeByTag("DoorSwishOpen")
local audioCloseNode = script_node:FindNodeByTag("DoorSwishClose")
local audioClickNode = script_node:FindNodeByTag("DoorSwishClick")

global function ForceOpenDoor()
	door_state = 1
	DoorProp1:Move(position1, 0.5, "acc")
	DoorProp2:Move(position2, 0.5, "acc")
	audioOpenNode:Trigger()
end

global function DoorOpen()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	
	if doctor:IsDetected() and actors_in_range == 0 then
		--VO
		--Doors are all locked if player is detected.
		doctor::SID_0874:The Dalek alarm system has temporarily locked down the door.
	elseif (door_state == 0) then
		DoorProp1:Move(position1, 0.5, "acc")
		DoorProp2:Move(position2, 0.5, "acc")
		audioOpenNode:Trigger()
				
		door_state = 1
	end
	
	actors_in_range = actors_in_range  + 1
end

global function ClickSound()
	audioClickNode:Trigger()
end

global function DoorOpenIfSensor()
	local sensor = FindNodeByName("DalekSensor")
	local doctor = GetActor("doctor")
	
	if doctor:IsInventoryItem(sensor) then
		if (door_state == 0) then
			DoorProp1:Move(position1, 0.5, "acc")
			DoorProp2:Move(position2, 0.5, "acc")
			audioOpenNode:Trigger()
		end
		
		door_state = 1
	end
	
	actors_in_range = actors_in_range  + 1
end

global function ForceDoorClose()
	DoorProp1:TeleportToOrigin()
	DoorProp2:TeleportToOrigin()
	door_state = 0
end

global function DoorClose()
	
	if (door_state == 1) then
		if (actors_in_range <= 1) then
			DoorProp1:SetCallback(script_node, "ClickSound")
			DoorProp1:MoveToOrigin(0.5, "lerp")
			DoorProp2:MoveToOrigin(0.5, "lerp")
			audioCloseNode:Trigger()
			
			door_state = 0
		end
	end
	
	actors_in_range = actors_in_range - 1
	
	-- there are savepoints within the door radius, so actors_in_range can go negative, which is bad
	if actors_in_range < 0 then
		actors_in_range = 0
	end
	
end