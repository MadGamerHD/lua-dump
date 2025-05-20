
global script_node
global door_open

local actors_in_range = 0
local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
local doorTrigger = script_node:FindNodeByTag("Door_Trigger")

door_open = true -- act starts with power off

local function DoorOpenAnimAndAudio()
	if not door_open then
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")
		local open_wav = script_node:FindNodeByTag("open")

		doorProp:PlayAnim(doorOpenAnim, 1, 0.1)
		open_wav:Trigger()
		door_open = true
	end
end

local function DoorCloseAnimAndAudio()
	if door_open then
		local doorCloseAnim = FindNodeByTag("Green_Door_Close")
		local close_wav = script_node:FindNodeByTag("close")

		doorProp:PlayAnim(doorCloseAnim, 1, 0.1)
		close_wav:Trigger()
		door_open = false
	end
end

global function PowerOff()
	DoorOpenAnimAndAudio()

	--now disable it
	doorTrigger:DisableNode()
end

global function PowerOn()
	-- Must check no-one is inside the trigger; even though the trigger has been disabled
	-- there are special cases where DoorOpen is explicitly called when power on, i.e. cutscene 7
	if actors_in_range == 0 then
		DoorCloseAnimAndAudio()
	end

	--now enable it
	doorTrigger:EnableNode()
end

global function DoorOpen()
	actors_in_range = actors_in_range  + 1

	DoorOpenAnimAndAudio()
end

global function DoorClose()
	actors_in_range = actors_in_range - 1
	
	if actors_in_range == 0 then
		Wait(2.0)	-- Wait so that it works better if door open animation is playing
		DoorCloseAnimAndAudio()
	end
end

global function ForceDoorClose()
	DoorCloseAnimAndAudio()
end

global function Init()
	if door_open then
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")

		doorProp:PlayAnim(doorOpenAnim, 1000, 0)
	end
end
