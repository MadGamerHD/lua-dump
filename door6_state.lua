print("Clearing Vars","\n")
global script_node

local actors_in_range
actors_in_range = 0

local door_state
door_state = 0

local interact_state
interact_state = 0

global function DoorOpen()
	
	print("DoorOpen", "\n")
	actors_in_range = actors_in_range  + 1

end

global function DoorTrigger()
	
	print("Open Door! ", "\n")
	
	if(door_state == 0)then
		door_state = 1
		local doorOpenAnim = FindNodeByTag("End_Door_Open")
		local doorProp = script_node:FindNodeByTag("End_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
	end
end


global function DoorClose()
	print("close Door!", "\n")
	
	if (door_state == 1) then
		if (actors_in_range <= 1) then
			door_state = 0
			local doorCloseAnim = FindNodeByTag("End_Door_Close")
			local doorProp = script_node:FindNodeByTag("End_Door_Prop")
			doorProp:PlayAnim(doorCloseAnim, 1, 0.01)
			local doorInteract0 = FindNodeByName("Override_Interact_0")
			doorInteract0:EnableNode()
			local doorInteract1 = FindNodeByName("Override_Interact_1")
			doorInteract1:EnableNode()
			local doorInteract2 = FindNodeByName("Override_Interact_2")
			doorInteract2:EnableNode()
		end
	end
	
	actors_in_range = actors_in_range - 1
	
end


global function Interact_0()
	print("Interact_0","\n")
	if (door_state == 0) then
		interact_state = interact_state + 1
		local doorInteract = FindNodeByName("Override_Interact_0")
		doorInteract:DisableNode()
		if(interact_state == 3) then
			DoorTrigger()
		end
	end
end

global function Interact_1()
	print("Interact_1","\n")
	if (door_state == 0) then
		interact_state = interact_state + 1
		local doorInteract = FindNodeByName("Override_Interact_1")
		doorInteract:DisableNode()
		if(interact_state == 3) then
			DoorTrigger()
		end
	end
end

global function Interact_2()
	print("Interact_2","\n")
	if (door_state == 0) then
		interact_state = interact_state + 1
		local doorInteract = FindNodeByName("Override_Interact_2")
		doorInteract:DisableNode()
		if(interact_state == 3) then
			DoorTrigger()
		end
	end
end