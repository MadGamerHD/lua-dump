print("Clearing Vars","\n")
global script_node

local actors_in_range
actors_in_range = 0

local door_state
door_state = 0

local doorTarget

global function DoorOpen()
	
	print("DoorOpen", actors_in_range,"\n")
	actors_in_range = actors_in_range  + 1

end

global function DoorTrigger()
	
	print("Open Door! ", "\n")
	
	if(door_state == 0)then
		local doorOpenAnim = FindNodeByTag("Blue_Door_Open")
		local doorProp = script_node:FindNodeByTag("Blue_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
		door_state = 1
		local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
		actorDoctor:SetBehaviour("wait")
		local actorAmy =  FindNodeByName("Amy_Actor_0")
		actorAmy:SetTarget(doorTarget)
		actorAmy:SetCallback(script_node,"AmyClear")
		actorAmy:SetMoveTime(4)		
		actorAmy:SetBehaviour("move")
	end
end


global function DoorClose()
	actors_in_range = actors_in_range - 1
	print("close Door!", actors_in_range,"\n")
	
	if (door_state == 1) then
		if(actors_in_range <= 1)then
			door_state = 0
			local doorCloseAnim = FindNodeByTag("Blue_Door_Close")
			local doorProp = script_node:FindNodeByTag("Blue_Door_Prop")
			doorProp:PlayAnim(doorCloseAnim, 1, 0.01)
			local InteractObj1 = script_node:FindNodeByTag("BlueDoorInteract1")
			InteractObj1:EnableNode()
			local InteractObj2 = script_node:FindNodeByTag("BlueDoorInteract2")
			InteractObj2:EnableNode()
			local actorAmy = FindNodeByName("Amy_Actor_0")
			local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
			actorAmy:SetTarget(actorDoctor:GetAncestorEntity())
			actorAmy:SetBehaviour("follow")
		end
	end	
end


global function Interact1()
	print("Interact1!", "\n")
	local InteractObj1 = script_node:FindNodeByTag("BlueDoorInteract1")
	InteractObj1:DisableNode()
	local InteractObj2 = script_node:FindNodeByTag("BlueDoorInteract2")
	InteractObj2:DisableNode()
	
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local OsciMinigame = MinigameManager:GetPanelMiniGame()

	MinigameManager:SetCallback(script_node, "DoorTrigger")
	MinigameManager:StartMiniGame(OsciMinigame)	
	doorTarget = script_node:FindNodeByTag("Blue_Door_Locator1")
end

global function Interact2()
	print("Interact2!", "\n")
	local InteractObj1 = script_node:FindNodeByTag("BlueDoorInteract1")
	InteractObj1:DisableNode()
	local InteractObj2 = script_node:FindNodeByTag("BlueDoorInteract2")
	InteractObj2:DisableNode()
	
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local OsciMinigame = MinigameManager:GetPanelMiniGame()

	MinigameManager:SetCallback(script_node, "DoorTrigger")
	MinigameManager:StartMiniGame(OsciMinigame)	
	doorTarget = script_node:FindNodeByTag("Blue_Door_Locator2")
end


global function Use()
	print("Using panel!", "\n")
end


global function AmyClear()

	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	actorDoctor:SetBehaviour("pc")
end