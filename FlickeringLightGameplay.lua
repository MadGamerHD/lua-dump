global script_node
global amy_run_first
global amy_run_second

amy_run_first = true
amy_run_second = true

--global current_light_1
--global current_light_2

local light_pause_time = 1.5
local light_intensity = 7.5

local light_pattern_1 = {0, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9}
local current_light_1 = #light_pattern_1 -- number of elements in the array
local time_light_on_1 = 0.0

local light_pattern_2 = {1, 3, 5, 7, 9, 0, 2, 4, 6, 8, 10}
local current_light_2 = #light_pattern_2 -- number of elements in the array
local time_light_on_2 = light_pause_time / 2

global player_in_darkness 
player_in_darkness = false
local player_time_in_darkness = 0.0

global area 
area = 0

global function PlayerEntersDarkness1()
	player_in_darkness = true
	area = 1
--	if(amy_run_first) then
--		amy_run_first = false
--		local amy_script = FindNodeByName("lua_amy_running_in_light")
--		amy_script:Trigger()
--		amy_script.script.currently_waiting_for_light = true
		
--		local amy = GetActor("amy")
--		amy: SetTarget(FindNodeByName("loc_amy_through_area1"))
--		amy: SetMoveTime(12)
--		amy:EnableMoveWalls()
--		amy: SetBehaviour("move")
		
--	end
end

global function PlayerLeavesDarkness1()
	player_in_darkness = false
	area = 0
end

global function PlayerEntersDarkness2()
	player_in_darkness = true
	area = 2
--	if(amy_run_second) then
--
--		amy_run_second = false
--		local amy = GetActor("amy")
--		amy: SetTarget(FindNodeByName("loc_amy_through_area2"))
--		amy: SetMoveTime(7)
--		amy:EnableMoveWalls()
--		amy: SetBehaviour("move")
--		amy:SetCallback(script_node, "amy_follow")
--	end
end

global function PlayerLeavesDarkness2()
	player_in_darkness = false
	area = 0
end

global function amy_follow()
	local amy = GetActor("amy")
	amy:SetBehaviour("follow")
end

local function ActivateNextLight1()
	-- deactivate current
	local light_index = light_pattern_1[current_light_1]
	local node_name = "Light_"..light_index
	FindNodeByName(node_name):DisableNode()

	-- go to the next light in sequence
	current_light_1 = current_light_1 + 1
	
	-- wrap
	if(current_light_1 > #light_pattern_1) then
		current_light_1 = 1
	end
	
	-- activate new light
	local light_index = light_pattern_1[current_light_1]
	local node_name = "Light_"..light_index
	FindNodeByName(node_name):EnableNode()
	
	time_light_on_1 = time_light_on_1 + light_pause_time
end

local function ActivateNextLight2()
	-- deactivate current
	local light_index = light_pattern_2[current_light_2]
	local node_name = "Light_"..light_index
	FindNodeByName(node_name):DisableNode()

	-- go to the next light in sequence
	current_light_2 = current_light_2 + 1
	
	-- wrap
	if(current_light_2 > #light_pattern_2) then
		current_light_2 = 1
	end
	
	-- activate new light
	local light_index = light_pattern_2[current_light_2]
	local node_name = "Light_"..light_index
	FindNodeByName(node_name):EnableNode()
	
	time_light_on_2 = time_light_on_2 + light_pause_time
end

local function SetIntensityLight(light_index, time_light_on)
	local node_name = "Light_"..light_index
	local light_node = FindNodeByName(node_name)
	local intensity

	if time_light_on > light_pause_time then

		intensity = 0

	elseif time_light_on < 0.1 then

		intensity = time_light_on * 10 * light_intensity

	elseif time_light_on > light_pause_time - 0.1 then

		intensity = (light_pause_time - time_light_on) * 10 * light_intensity
		
	else

		intensity = light_intensity

	end

	light_node:SetAttr("IntensityMultiplier", intensity)
end

local function UpdateTimers(dt)
	time_light_on_1 = time_light_on_1 - dt
	time_light_on_2 = time_light_on_2 - dt
end

local function KillPlayer()
	local doctor = GetActor("doctor")
	local skull_death = FindNodeByName("LuaSkullDeath")

	doctor:Die("Vashta")
	doctor:SetCallback(skull_death, "Play")
end

global function Idle()
	print(current_light_1)
--	print(current_light_2)

	local dt = GetTimeStep()
	
	UpdateTimers(dt)
	
	if time_light_on_1 <= 0 then
		ActivateNextLight1()
	end
	if time_light_on_2 <= 0 then
		ActivateNextLight2()
	end
	
	SetIntensityLight(light_pattern_1[current_light_1], time_light_on_1)
	SetIntensityLight(light_pattern_2[current_light_2], time_light_on_2)
	
	if player_in_darkness then
	
		local distance1 = 100
		local distance2 = 100

		-- Is the player in the first temporary light?
		local light_index = light_pattern_1[current_light_1]
		local node_name = "LightPosition_"..light_index
		distance1 = GetDistanceBetweenTransforms(FindNodeByTag("doctor"), FindNodeByName(node_name))

		-- Is the player in second temporary light?
		light_index = light_pattern_2[current_light_2]
		node_name = "LightPosition_"..light_index
		distance2 = GetDistanceBetweenTransforms(FindNodeByTag("doctor"), FindNodeByName(node_name))

		if distance1 < 4.0 and distance2 < 4.0 then
			player_time_in_darkness = 0.0
		else
			player_time_in_darkness = player_time_in_darkness + dt -- not in the light
		end
		
		-- If the player has been standing in an unlit area for too long, then kill them :)
		if player_time_in_darkness > 1.0 then
			local area = 0
			player_in_darkness = false
			KillPlayer()
		end
		
	end
end

global function no_go_back()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local return_spot = FindNodeByName("loc_stay_in_light")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	local turn_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnRight180")

	local whodunnit = GetTriggerNode():FindActor()
	if FindPlayer():IsEqual(whodunnit) then
		ShowLetterBox()	
		LockActorCamera()

	




		SayPrep("skip", "async")
		
		local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
		if(doctor_player) then	
			doctor:PlayAnimAndWait(turn,1,0.1)

			

			
			--NEW
			--VO
			--stopping player from returning to the dark corridor
			doctor::SID_2696:I'm not going back before I find the Accellerator.

			doctor:SetTarget(return_spot)
			doctor:SetMoveTime(1.5)
			doctor:SetBehaviour("move")
			--Wait(1.5)
			doctor:SetCallback(script_node, "doc_released")
			
		
		else
			amy:PlayAnimAndWait(turn_amy,1,0.1)
			--amy:SetBehaviour("wait")
			
			--NEW
			--VO
			--Stop Amy going back through dark corridor
			amy::SID_2697:I'm not going back through the darkness.
			amy:SetTarget(return_spot)
			amy:SetMoveTime(2)
			amy:SetBehaviour("move")
			amy:SetCallback(script_node, "amy_released")

		end

	end
end

global function doc_released()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	FreeActorCamera()	
	HideLetterBox()		
end

global function amy_released()
	local amy = GetActor("amy")
	amy:SetBehaviour("pc")
	FreeActorCamera()	
	HideLetterBox()		
end

global function Light_at_start()

	if (current_light_1 == 1 or current_light_2 == 1) then

		return true
	elseif (current_light_1 == 6 or current_light_2 == 6) then
		Wait(0.5)
		return true
	else
		return false
	end
end



