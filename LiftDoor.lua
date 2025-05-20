global script_node
global door_open
global actors_in_range 

-- This reuses the green door prop since I started by instancing a green door def folder.
-- That's why we have a green door prop on a horizontal door. Madness.
local doorProp = script_node:FindNodeByTag("Green_Door_Prop")

door_open = false
actors_in_range = 0

global function DoorOpen()
	actors_in_range = actors_in_range  + 1

	if not door_open then
		local doorOpenAnim = FindNodeByTag("Lift_Doors_Open")
		local openwav = script_node:FindNodeByTag("open")
		
		openwav:Trigger()
		doorProp:PlayAnim(doorOpenAnim, 1, 0.1)
		door_open = true
		print("open_lift")
	end
end

global function DoorClose()
	actors_in_range = actors_in_range - 1

	Wait(2.0)	-- Wait so that it works better if door open animation is playing

	if door_open and actors_in_range == 0 then
		local doorCloseAnim = FindNodeByTag("Lift_Doors_Closed")
		local closewav = script_node:FindNodeByTag("close")
		
		closewav:Trigger()
		doorProp:PlayAnim(doorCloseAnim, 1, 0.1)
		door_open = false
		print("close_lift")
	end
end

global function Reset()
	local doorCloseAnim = FindNodeByTag("Lift_Doors_Closed")

	door_open = false
	actors_in_range = 0
	doorProp:PlayAnim(doorCloseAnim, 1000, 0)
end

global function Init()
	if door_open then
		local doorOpenAnim = FindNodeByTag("Lift_Doors_Open")

		doorProp:PlayAnim(doorOpenAnim, 1000, 0)
	end
end