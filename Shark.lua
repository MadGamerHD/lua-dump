global script_node
global is_attacking

local Shark = FindNodeByName("SharkProp")
local current_green_door
local current_shark_attack_folder
local current_attack_location
local num_attacks
local instant_attack

-- initalise variables
num_attacks = 0
is_attacking = false
instant_attack = false

local tube_being_attacked  = -1

-- Teleport the shark to the attack pos instantly. This is called when the door minigame
-- is failed as a penalty
global function InstantAttack()
	if(is_attacking) then
		Shark:Charge(current_attack_location)
		Shark:SetChargeCallback(script_node, "SharkAttackCamera")
		Shark:SetCallback(script_node, "AttackTube")
		Shark:TeleportToStartAttackLocation();
		instant_attack = true
	end
end

global function DelayAttack()
	Shark:SetSpline(FindNodeByName("SharkSpline_Peaceful"))
end

global function StopAttacking()
	-- Shark swims off,  for now...
	Shark:SetSpline(FindNodeByName("SharkSpline_Peaceful"))
	is_attacking = false
	num_attacks = 0
	
	-- depending on which section of tunnel has been attacked, permanently seal it
	-- by disabling the door triggers. The code to do this is in the Act2Progression script
	FindNodeByName("Act2Progression").script.DestroyTube(tube_being_attacked)
end

-- This occurs just before the shark attack animation plays (1 second into cutscene)
global function AttackTube()
	num_attacks = num_attacks + 1

	Wait(0.3)
	if num_attacks < 3 then
		current_shark_attack_folder:FindNodeByTag("Impact_Audio_1"):Trigger()
		Wait(0.1)
		current_shark_attack_folder:FindNodeByTag("Crack"..num_attacks):Trigger()
	else
		Wait(0.1)
	end
	Wait(0.3)

	if(num_attacks == 3) then
		local WaterDeathLocator
		local WaterDeathCamera
		local timeline
		local doctor = FindNodeByName("TheDoctor_Actor_0")
		
		WaterDeathLocator = FindNodeByName("EM_LOCATOR_Water_Death")
		WaterDeathCamera = FindNodeByName("EM_CAMERA_Water_Death")
		timeline = FindNodeByName("SharkAttackTimeline0")
		
		WaterDeathLocator:Trigger()
		WaterDeathCamera:CutTo()
		timeline:StopTrigger()
		Wait(1)
		doctor:Die("")
	end

	-- Trigger an fx with depending on num_attacks

	if((num_attacks < 3) and (is_attacking == true)) then
		-- Its coming around again!
		DelayAttack()
	else
		-- Shark swims off,  for now...
		StopAttacking()
	end
end

global function SharkAttackCamera()
	local timeline = FindNodeByName("SharkAttackTimeline0")
	local camera_shake = FindNodeByName("SharkAttackCameraShake")

	if num_attacks == 2 then
		camera_shake:StopTrigger()
	end

	timeline:Trigger()
end

global function AttackCameraStart()
	-- camera cut only occurs on instant attack or on last attack

	if num_attacks == 2 or instant_attack then
		local camera = current_shark_attack_folder:FindNodeByTag("Camera")
		local doctor = GetActor("doctor")
		local amy = GetActor("amy")

		ShowLetterBox()
		camera:CutTo()
		doctor:SetBehaviour("wait")
		amy:SetBehaviour("wait")
		
		if num_attacks == 0 then
			local doc_locator = current_shark_attack_folder:FindNodeByTag("Trigger_DocLocator")
			local amy_locator = current_shark_attack_folder:FindNodeByTag("Trigger_AmyLocator")
			local doctor = GetActor("doctor")
			local amy = GetActor("amy")

			doctor:Teleport(doc_locator)
			amy:Teleport(amy_locator)
		end
	end
end

global function AttackCameraEnd()
	-- camera cut only occurs on instant attack or on last attack (num_attacks has increased in attack tube during time line)

	if num_attacks == 3 or instant_attack then
		local camera = FindNodeByName("EmDefaultCamera")
		local doctor = GetActor("doctor")
		local amy = GetActor("amy")

		HideLetterBox()
		camera:CutTo()
		doctor:SetBehaviour("pc")
		amy:SetBehaviour("follow")
	end
	
	Shark:Charge(current_attack_location)
	Shark:SetChargeCallback(script_node, "SharkAttackCamera")
	Shark:SetCallback(script_node, "AttackTube")
	instant_attack = false
end

local function DoSharkCharge()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	-- Disable green door trigger so it never opens again
	current_green_door:FindNodeByTag("Door_Trigger"):StopTrigger()
	current_green_door:FindNodeByTag("Door_Script").script.ForceDoorClose()

	--Disable shark trigger, so this only happens once
	current_shark_attack_folder:FindNodeByTag("Trigger"):StopTrigger()

	-- Wait doc and amy
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")

	current_attack_location = current_shark_attack_folder:FindNodeByTag("Shark_Locator")
	num_attacks = 0
	is_attacking = true
	InstantAttack()
	
	PlayMusic(FindNodeByName("SharkChase"))
end

global function Trigger_0()
	current_green_door = FindNodeByName("EM_ENTITY_Green_Door_TD")
	current_shark_attack_folder = FindNodeByName("SharkAttack_0")
	DoSharkCharge()
end

global function Trigger_1()
	current_green_door = FindNodeByName("EM_ENTITY_Green_Door_TF")
	current_shark_attack_folder = FindNodeByName("SharkAttack_1")
	DoSharkCharge()
end

global function Trigger_2()
	current_green_door = FindNodeByName("EM_ENTITY_Green_Door_C")
	current_shark_attack_folder = FindNodeByName("SharkAttack_2")
	DoSharkCharge()
end

global function Trigger_3()
	current_green_door = FindNodeByName("EM_ENTITY_Green_Door_D")
	current_shark_attack_folder = FindNodeByName("SharkAttack_3")
	DoSharkCharge()
end

global function Init()
	Shark:TeleportToOrigin()
	Shark:SetSpline(FindNodeByName("SharkSpline_Peaceful"))
end

global function Idle()
	Wait(1)

	if Shark:IsLit() == 0 then
		Shark:TeleportToOrigin()
	end
end
