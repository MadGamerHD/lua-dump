global script_node
local players_in_dark_area = 0
local last_player_entity_in_dark_area
local amy_at_dest = false
local progression_script = FindNodeByName("Act2Progression")

global function Disable()
	local control_panel = script_node:FindNodeByTag("LightControlInteract")
	local trigger0 = script_node:FindNodeByTag("VashtaKillTrigger0")
	local trigger1 = script_node:FindNodeByTag("VashtaKillTrigger1")

	control_panel:DisableNode()
	trigger0:Sleep()
	trigger1:Sleep()
end

global function Enable()
	local control_panel = script_node:FindNodeByTag("LightControlInteract")
	local trigger0 = script_node:FindNodeByTag("VashtaKillTrigger0")
	local trigger1 = script_node:FindNodeByTag("VashtaKillTrigger1")

	control_panel:EnableNode()
	trigger0:Wake()
	trigger1:Wake()
end

global function TurnLightOn()
	local new_light_0 = script_node:FindNodeByTag("controlled_light_0")
	local new_light_1 = script_node:FindNodeByTag("controlled_light_1")
	local light_globals = FindNodeByName("LightGlobals")
	local amy = GetActor("amy")
	local amy_dest = script_node:FindNodeByTag("amy_dest_loc")

	light_globals.script.SetNewActiveLight(new_light_0, new_light_1)
	
	if not amy_at_dest then
		amy:SetTarget(amy_dest)
		amy:SetMaxSpeed(6)
		amy:SetBehaviour("move")
		amy_at_dest = true
	end
end

global function LightsShortOut()
	local doctor = FindNodeByName("TheDoctor_Actor_0")
	local SkullDeath = FindNodeByName("LuaSkullDeath")

	doctor:Die("vashta")
	doctor:SetCallback(SkullDeath, "Play")
end

global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip","")
	--VO
	--*NEW
	doctor::SID_2613:Think I'm going to need something with power to charge this light panel.
end

local function DoUseLight()
	local light_globals = FindNodeByName("LightGlobals")
	local minigame_manager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local lights_game = minigame_manager:GetLightsMiniGame()

	minigame_manager:SetMiniGameID("MINI_LIGHTS01")
	
	if light_globals.script.show_instructions == true then
		light_globals.script.show_instructions = false
	else
		minigame_manager:HideStartHelp()
	end
	
	if light_globals.script.light_game_difficulty == 0 then
		lights_game:SetSpeed(21)
		lights_game:SetSafeSize(6)
		lights_game:SetWinSize(4)
	elseif light_globals.script.light_game_difficulty == 1 then
		lights_game:SetSpeed(25)
		lights_game:SetSafeSize(6)
		lights_game:SetWinSize(4)
	elseif light_globals.script.light_game_difficulty == 2 then
		lights_game:SetSpeed(30)
		lights_game:SetSafeSize(6)
		lights_game:SetWinSize(2)
	else
		lights_game:SetSpeed(35)
		lights_game:SetSafeSize(6)
		lights_game:SetWinSize(2)
	end
	
	-- Increase the difficulty the next time the player has to do the puzzle
	light_globals.script.light_game_difficulty = light_globals.script.light_game_difficulty + 1

	minigame_manager:SetCallback(script_node, "TurnLightOn")
	minigame_manager:SetFailCallback(script_node, "LightsShortOut")
	minigame_manager:StartMiniGame(lights_game)
end

global function Use()
	local screwdriver = FindNodeByName("screwdriver")
 	local doctor = GetActor("doctor")
 	
	SayPrep("skip","") 	
 	
	if (doctor:IsUsingInventoryItem(screwdriver)) then
		local location = script_node:FindNodeByTag("use_light_loc")
		local amy = GetActor("amy")
		local amy_source = script_node:FindNodeByTag("amy_source_loc")
		local interact = script_node:FindNodeByTag("LightControlInteract")
		
		print("int off")
		interact:StopTrigger()

		if not amy_at_dest then
			amy:SetTarget(amy_source)
			amy:SetMoveTime(5)
			amy:SetBehaviour("move")
		end

		FindNodeByName("lua_common_doctor_actions").script.UseSonicOnce(location)
		DoUseLight()
	else
		FindNodeByName("common").script.RandomRefusal()
	end
end

global function PlayerInDarkArea()
	if(progression_script.script.is_power_out == true) then
		local actor = last_player_entity_in_dark_area:FindActor()
		local SkullDeath = FindNodeByName("LuaSkullDeath")

		actor:Die("vashta")
		actor:SetCallback(SkullDeath, "Play")
	end
end

-- The "killzone" is two trigger planes encompassing the darkness
global function PlayerEntersKillZone()
	players_in_dark_area = players_in_dark_area + 1
	last_player_entity_in_dark_area = GetTriggerNode()

	local light = script_node:FindNodeByTag("controlled_light_0")
	
	if(light:IsEnabled() == 0) then
		PlayerInDarkArea()
	end
end

global function PlayerLeavesKillZone()
	players_in_dark_area = players_in_dark_area - 1
end

global function LightsOut()
	if players_in_dark_area > 0 then
		PlayerInDarkArea()
	end
end

global function PlayerSafe()
	local amy = GetActor("amy")
	local safe_trigger = script_node:FindNodeByTag("safe_trigger")

	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	safe_trigger:StopTrigger()
	SaveCheckpoint()
end