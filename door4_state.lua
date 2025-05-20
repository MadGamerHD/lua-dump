print("Clearing Vars","\n")
global script_node

local actors_in_range
actors_in_range = 0

local door_state
door_state = 0

local door_is_open
door_is_open = 0

global function PowerOff()
	--open the door
	local doorOpenAnim = FindNodeByTag("Heavy_Door_Open")
	local doorProp = script_node:FindNodeByTag("Heavy_Door_Prop")
	doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
	--disable the controls
	local InteractObj1 = script_node:FindNodeByTag("HeavyDoorInteract1")
	InteractObj1:DisableNode()
end

global function PowerOn()
	--open the door
	local doorCloseAnim = FindNodeByTag("Heavy_Door_Close")
	local doorProp = script_node:FindNodeByTag("Heavy_Door_Prop")
	doorProp:PlayAnim(doorCloseAnim, 1, 0.01)
	--enable the controls
	local InteractObj1 = script_node:FindNodeByTag("HeavyDoorInteract1")
	InteractObj1:EnableNode()

end

global function DoorOpen()
	
	print("DoorOpen", "\n")
	actors_in_range = actors_in_range  + 1

end

global function DoorTrigger()
	
	print("Open Door! ", "\n")
	
	if(door_state == 1)then
		if(door_is_open == 0)then
			door_is_open = 1
			local doorOpenAnim = FindNodeByTag("Heavy_Door_Open")
			local doorProp = script_node:FindNodeByTag("Heavy_Door_Prop")
			local open_wav = script_node:FindNodeByTag("open")	
			
			doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
			open_wav:Trigger()
		end
	end
end


global function DoorClose()
	print("close Door!", "\n")
	
	actors_in_range = actors_in_range - 1	
	
end

global function DoorForceClose()
	print("close DoorForceClose!", "\n")
	
	if (door_state == 2) then
		if(door_is_open == 1)then
			door_is_open = 0
			local doorCloseAnim = FindNodeByTag("Heavy_Door_Close")
			local doorProp = script_node:FindNodeByTag("Heavy_Door_Prop")
			local close_wav = script_node:FindNodeByTag("close")		
			
			doorProp:PlayAnim(doorCloseAnim, 1, 0.01)
			close_wav:Trigger()
		end
	end
end

global function Interact()

	if(door_state == 0)then
		door_state = 1
		DoorTrigger()
		local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
		actorDoctor:SetBehaviour("wait")
		local actorAmy =  FindNodeByName("Amy_Actor_0")
		actorAmy:SetBehaviour("pc")
		local Crate= script_node:FindNodeByTag("Crate")
		local InteractObj1 = Crate:FindNodeByTag("PushBoxInteract")
		InteractObj1:EnableNode()
	end
end

global function Use()
end

global function DoorCrateTrigger()
	print("DoorCrateTrigger!", door_state, "\n")
	if(door_state == 1)then
		door_state = 2
		print("closing door!", door_state, "\n")
		local InteractObj1 = script_node:FindNodeByTag("HeavyDoorInteract1")
		InteractObj1:DisableNode()
		DoorForceClose()
	end
end

