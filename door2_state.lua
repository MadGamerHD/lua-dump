global script_node
global door_open

local SharkScript = FindNodeByName("SharkScript_0")
local doorProp = script_node:FindNodeByTag("Blue_Door_Prop")

door_open = true -- act starts with power off

local function DoorOpen()
	if not door_open then
		local doorOpenAnim = FindNodeByTag("Blue_Door_Open")
		local open_wav = script_node:FindNodeByTag("open")

		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
		open_wav:Trigger()
		door_open = true
	end
end

local function DoorClose()
	if door_open then
		local doorCloseAnim = FindNodeByTag("Blue_Door_Close")
		local close_wav = script_node:FindNodeByTag("close")

		doorProp:PlayAnim(doorCloseAnim, 1, 0.1)
		close_wav:Trigger()
		door_open = false
	end
end

global function PowerOff()
	--TODO
	--if shark hasn't attacked
	
	-- open the door
	DoorOpen()
	
	--end
end

global function PowerOn()
	-- close the door
	DoorClose()
end

global function DoorTrigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_source_loc = script_node:FindNodeByTag("doc_source_loc")
	local amy_source_loc= script_node:FindNodeByTag("amy_source_loc")
	local doc_dest_loc = script_node:FindNodeByTag("doc_dest_loc")
	local amy_dest_loc= script_node:FindNodeByTag("amy_dest_loc")

	if SharkScript.script.is_attacking then
		-- Increase the difficulty of the keypad for next time round
		FindNodeByTag("progression").script.IncreaseKeypadDifficulty()

		SharkScript.script.StopAttacking()

		-- Passive cut-scene of them running through door
		ShowLetterBox()
		LockActorCamera()
		DoorOpen()

		doctor:SetTarget(doc_dest_loc)
		doctor:SetMoveTime(2.0)
		doctor:SetBehaviour("move")

		Wait(0.1)

		amy:SetTarget(amy_dest_loc)
		amy:SetMoveTime(2.0)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node, "MovedThroughDoor")

		Wait(1.0)
		DoorClose()
		PlayMusic(FindNodeByName("act2_amb_def"))
	else
		-- Passive cut-scene of them walking through door
		ShowLetterBox()
		LockActorCamera()
		DoorOpen()

		doctor:SetTarget(doc_dest_loc)
		doctor:SetMoveTime(4.0)
		doctor:SetBehaviour("move")

		Wait(0.2)

		amy:SetTarget(amy_dest_loc)
		amy:SetMoveTime(4.0)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node, "MovedThroughDoor")
		
		Wait(3.5)
		DoorClose()
	end
end

global function MinigameFail()
	-- Set the shark to attack!
	SharkScript.script.InstantAttack()
end

local function DoUseDoor()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local panelMinigame = MinigameManager:GetPanelMiniGame()
	
	local door_globals = FindNodeByName("DoorGlobals")

	MinigameManager:SetMiniGameID("MINI_PANEL01")
	
	if door_globals.script.show_instructions == true then
		door_globals.script.show_instructions = false
	else
		MinigameManager:HideStartHelp()
	end
	
	local sequence_length = FindNodeByTag("progression").script.GetKeypadSequenceLength()
	panelMinigame:SetSequenceLength(sequence_length)

	MinigameManager:SetCallback(script_node, "DoorTrigger")
	MinigameManager:SetFailCallback(script_node, "MinigameFail")
	MinigameManager:StartMiniGame(panelMinigame)
end

global function Use1()
	local screwdriver = FindNodeByName("screwdriver")
 	local doctor = GetActor("doctor")

	SayPrep("skip","")

 	if not SharkScript.script.is_attacking then
		FindNodeByName("DoorGlobals").script.DoDoorAlreadyOpenRefusal()
	elseif (doctor:IsUsingInventoryItem(screwdriver)) then
		local sonic_loc = script_node:FindNodeByTag("sonic_loc_1")
		
		SharkScript.script.DelayAttack()
		FindNodeByName("lua_common_doctor_actions").script.UseSonic(sonic_loc)
		DoUseDoor()
	else
		FindNodeByName("common").script.RandomRefusal()
	end
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	if FindPlayer():GetName() == amy:GetName() then
		--VO
		amy::SID_2716:I'm not messing with that, I don't want to get trapped.
	elseif not SharkScript.script.is_attacking then
		FindNodeByName("DoorGlobals").script.DoDoorAlreadyOpenRefusal()
 	else	
		--VO
		doctor::SID_2676:That's not going to work, no matter how many buttons I press.
	end
end

global function MovedThroughDoor()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	doctor:SetBehaviour("pc")
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	FreeActorCamera()
	HideLetterBox()
	
	SaveCheckpoint()
end

global function Init()
	if door_open then
		local doorOpenAnim = FindNodeByTag("Blue_Door_Open")

		doorProp:PlayAnim(doorOpenAnim, 1000, 0)
	end
end
