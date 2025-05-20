print("Clearing Vars","\n")
global script_node

local actors_in_range
actors_in_range = 0

local door_state
door_state = 0


global function DoorOpen()
	
	print("DoorOpen", "\n")
	actors_in_range = actors_in_range  + 1

end

global function DoorTrigger()
	
	print("Open Door! ", "\n")
	
	if(door_state == 0)then
		door_state = 1
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")
		local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
	end
end


global function DoorClose()
	print("close Door!", "\n")
	
	if (door_state == 1) then
		if (actors_in_range <= 1) then
			door_state = 0
			local doorCloseAnim = FindNodeByTag("Green_Door_Close")
			local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
			doorProp:PlayAnim(doorCloseAnim, 1, 0.01)
		end
	end
	
	actors_in_range = actors_in_range - 1
	
end



