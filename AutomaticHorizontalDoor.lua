
global script_node
global door_open

local actors_in_range = 0
-- This reuses the green door prop since I started by instancing a green door def folder.
-- That's why we have a green door prop on a horizontal door. Madness.
local doorProp = script_node:FindNodeByTag("Green_Door_Prop")

--NOTE:horizontal doors are open/closed they don't use triggers (see reset below)
door_open = true

global function DoorOpen()
	actors_in_range = actors_in_range  + 1

	if not door_open then
		local doorOpenAnim = FindNodeByTag("Horizontal_Door_Open")

		doorProp:PlayAnim(doorOpenAnim, 1, 0.1)
		door_open = true
	end
end

global function DoorClose()
	actors_in_range = actors_in_range - 1

	Wait(2.0)	-- Wait so that it works better if door open animation is playing

	if door_open and actors_in_range == 0 then
		local doorCloseAnim = FindNodeByTag("Horizontal_Door_Close")

		doorProp:PlayAnim(doorCloseAnim, 1, 0.1)
		door_open = false
	end
end

global function Reset()
--	if door_open then
--		local doorCloseAnim = FindNodeByTag("Horizontal_Door_Close")

		-- There's some teleporting in and around the door trigger, so this reset is here to fix it
--		actors_in_range = 0
--		doorProp:PlayAnim(doorCloseAnim, 1, 0.1)
--		door_open = false
--	end
end

global function Init()
	if door_open then
		local doorOpenAnim = FindNodeByTag("Horizontal_Door_Open")

		doorProp:PlayAnim(doorOpenAnim, 1000, 0)
	end
end
