global script_node
global vents_flushed

local lights_area1 = {}
lights_area1[0] = FindNodeByName("IntermittentLightDef_0")
lights_area1[1] = FindNodeByName("IntermittentLightDef_1")
lights_area1[2] = FindNodeByName("IntermittentLightDef_2")
local illum_locator_area1 = {}
illum_locator_area1[0] = FindNodeByName("IlluminationLocatorDef_0")
illum_locator_area1[1] = FindNodeByName("IlluminationLocatorDef_1")
illum_locator_area1[2] = FindNodeByName("IlluminationLocatorDef_2")

local current_light_area1 = 0
local time_current_light_on_area1 = 0
local num_lights_area1 = 4 -- num elements in pattern
local time_light_on_area1 = 1.0
local light_pattern_area1 = {}
light_pattern_area1[0] = 0
light_pattern_area1[1] = 1
light_pattern_area1[2] = 2
light_pattern_area1[3] = 1

local lights_area2 = {}
lights_area2[0] = FindNodeByName("IntermittentLightDef_3")
lights_area2[1] = FindNodeByName("IntermittentLightDef_4")
lights_area2[2] = FindNodeByName("IntermittentLightDef_5")
lights_area2[3] = FindNodeByName("IntermittentLightDef_6")
lights_area2[4] = FindNodeByName("IntermittentLightDef_7")
local illum_locator_area2 = {}
illum_locator_area2[0] = FindNodeByName("IlluminationLocatorDef_3")
illum_locator_area2[1] = FindNodeByName("IlluminationLocatorDef_4")
illum_locator_area2[2] = FindNodeByName("IlluminationLocatorDef_5")
illum_locator_area2[3] = FindNodeByName("IlluminationLocatorDef_6")
illum_locator_area2[4] = FindNodeByName("IlluminationLocatorDef_7")

local current_light_area2 = 0
local time_current_light_on_area2 = 0
local num_lights_area2 = 8 -- num elements in pattern
local time_light_on_area2 = 0.75
local light_pattern_area2 = {}
light_pattern_area2[0] = 0
light_pattern_area2[1] = 1
light_pattern_area2[2] = 2
light_pattern_area2[3] = 3
light_pattern_area2[4] = 4
light_pattern_area2[5] = 3
light_pattern_area2[6] = 2
light_pattern_area2[7] = 1

local ProcessingRoom = FindNodeByName("ProcessingRoom")
local VentDarkDeaths = FindNodeByName("VentDarkDeaths")
local amy_transform = FindNodeByPartialName("EM_ENTITY_Amy_0")
local amy_in_dark_timer = 0
local area = 0


-- the following is global so it will be saved
global are_lights_active
global is_area_1_disabled
global fans_on

are_lights_active = false
is_area_1_disabled = false
fans_on = false


global function ActivateIntermittentLights()
	are_lights_active = true
	
	current_light_area1 = 0
	lights_area1[light_pattern_area1[current_light_area1]]:EnableNode()
	
	current_light_area2 = 0
	lights_area2[light_pattern_area1[current_light_area2]]:EnableNode()
	
	amy_in_dark_timer = 0
	
	is_area_1_disabled = false
	
	VentDarkDeaths:Wake()
	ProcessingRoom:Trigger()
end

global function DeactivateIntermittentLights()
	are_lights_active = false
	lights_area1[light_pattern_area1[current_light_area1]]:DisableNode()
	lights_area2[light_pattern_area2[current_light_area2]]:DisableNode()
	VentDarkDeaths:Sleep()
	ProcessingRoom:StopTrigger()
end

-- When the player reaches the processing room, we don't need area 1 to be active anymore.
-- So, we can disable this area and repurpose its dynamic light to illuminate the processing room.
global function DeactivateArea1()
	is_area_1_disabled = true
	for i = 0, 2, 1 do
		lights_area1[i]:DisableNode()
	end
end

global function IsAmyWithinTrigger(trigger_node)
	local distance = GetDistanceBetweenTransforms(amy_transform, trigger_node)
	if(distance < 1) then
		return true
	else
		return false
	end
end

local function KillAmy()
	local amy = FindNodeByName("Amy_Actor_0")
	amy:Die("Vashta")
end

local function UpdateTimers()
	local dt = GetTimeStep()
	time_current_light_on_area1 = time_current_light_on_area1 + dt
	time_current_light_on_area2 = time_current_light_on_area2 + dt
end

global function PlayerEntersArea1()
	area = 1
	amy_in_dark_timer = 0
end

global function PlayerEntersArea2()
	area = 2
	amy_in_dark_timer = 0
	
	-- Small hack
	-- Ensure the lights are active in area 1 when we enter area 2
	-- in case they're disabled from visiting the processing room
	-- where there's a trigger to disable them
	local processing_light = FindNodeByName("ProcessingRoomLight")
	processing_light:DisableNode()
	is_area_1_disabled = false
end

global function PlayerLeavesArea()
	area = 0
end

global function PlayerEntersProcessingArea()
	DeactivateArea1()
	local processing_light = FindNodeByName("ProcessingRoomLight")
	processing_light:EnableNode()
end

local function ActivateNextLightArea1()
	if(not is_area_1_disabled) then
		current_light_area1 = current_light_area1 + 1
		if(current_light_area1 >= num_lights_area1) then
			current_light_area1 = 0
		end
		lights_area1[light_pattern_area1[current_light_area1]]:EnableNode()
		lights_area1[light_pattern_area1[current_light_area1]]:FindNodeByTag("spark_sound"):Trigger()
		time_current_light_on_area1 = 0
	end
end

local function ActivateNextLightArea2()
	current_light_area2 = current_light_area2 + 1
	if(current_light_area2 >= num_lights_area2) then
		current_light_area2 = 0
	end
	lights_area2[light_pattern_area2[current_light_area2]]:EnableNode()
	lights_area2[light_pattern_area2[current_light_area2]]:FindNodeByTag("spark_sound"):Trigger()
	time_current_light_on_area2 = 0
end


global function Idle()
	if(are_lights_active) then
	
		UpdateTimers()
		
		if(time_current_light_on_area1 > time_light_on_area1) then
			lights_area1[light_pattern_area1[current_light_area1]]:DisableNode()
			ActivateNextLightArea1()
		end
		
		if(time_current_light_on_area2 > time_light_on_area2) then
			lights_area2[light_pattern_area2[current_light_area2]]:DisableNode()
			ActivateNextLightArea2()
		end
		
		local illum_center;
		if(area == 1) then
			illum_center = illum_locator_area1[light_pattern_area1[current_light_area1]]
		elseif(area == 2) then
			illum_center = illum_locator_area2[light_pattern_area2[current_light_area2]]
		end
		
		if(area ~= 0) then
			amy_in_dark_timer = amy_in_dark_timer + GetTimeStep()
			
			local distance = GetDistanceBetweenTransforms(amy_transform, illum_center)
			if(distance < 3.25) then
				amy_in_dark_timer = 0
			end
			
			if(amy_in_dark_timer > 1) then
				KillAmy()
			end
		end
		
	end
end

--6.iii
global function ClearVents()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local progress = FindNodeByName("Act2Progression")
	local vent_use = FindNodeByName("VentInteractable")
	local vent_examine = FindNodeByName("VentExamine")
	local loc = FindNodeByName("amy_use_vents")
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractPanelWallCode") --2.16667
	local fan_cam = FindNodeByName("fan_cam")
	local vent_cam = FindNodeByName("vent_cam")
	local game_cam = FindNodeByName("EmDefaultCamera")
	local handle_prop = FindNodeByName("handle_prop")
	local handle_anim = FindNodeByShortName("EM_ANIMATOR_Handle_Anim_Fans_Handle") --0.633333
	local fan_prop = FindNodeByName("fan_prop")
	local fan_start = FindNodeByShortName("EM_ANIMATOR_Fans_Anim_Fans_StartUp") --4.96667
	local fan_loop = FindNodeByShortName("EM_ANIMATOR_Fans_Anim_Fans_Continuous")
	local turn180 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnLeft180")	
	local weeds = FindNodeByName("Weed_Clear")
	local player = FindPlayer()
	local fan_wav = FindNodeByName("amb_fans")
	
	SayPrep("skip","")

	if vents_flushed then
		if player:IsEqual(doctor) then	
			--*NEW
			--VO
			doctor::SID_2701:The vents are cleared and the Generator is running smoothly... for now. 
		else
			--*NEW
			--VO
			amy::SID_2690:The vents are cleared. I should get back to the Doctor.
		end
	--cut scene 6.iii not played
	else
		--interact with doctor to trigger mini game then cut scene 7... see below
		vents_flushed = true
		
		ShowLetterBox()
		fan_cam:CutTo()
		
		amy:SetBehaviour("wait")
		amy:SetTarget(loc)
		amy:SetMoveTime(1.5)
		amy:SetBehaviour("move")
	
		Wait(1.5)
		amy:PlayAnimBlendOut(anim,1,0.1,0.1)
	
		Wait(0.5) --bit early
		handle_prop:PlayAnim(handle_anim,1,0.5)
		
		FindNodeByName("Fan_Power_On_Wav"):Trigger()
		
		Wait(0.633333) 
		fan_wav:Trigger()
		fan_prop:PlayAnim(fan_start,1,0)
		
		Wait(1)
		amy:PlayAnimBlendOut(turn180,1,0.1,0.1)
		
		Wait(3.96667)
		fan_prop:PlayAnim(fan_loop,1,0.1)
		fans_on = true

		vent_cam:CutTo()
		weeds:Trigger()
		
		SayPrep("","async")

		--HINT
		amy::SID_2413:That sounds better. Hopefully that generator will spring to life now. Hopefully...
	
		Wait(5.5)
		HideLetterBox()
		game_cam:CutTo()
		amy:SetBehaviour("pc")
	
		--changed to incidental response
		vent_use:StopTrigger()
		vent_examine:Trigger()

		--disables diver node???
		progress.script.SetStage_ReturnToDoctor()
		
		local catch_her_when_she_returns = FindNodeByName("ReuniteWithDoctorTrigger")
		catch_her_when_she_returns:Trigger()
	
		SaveCheckpoint()
	end
end

global function GeneratorFixed()
	--NEW
	CutToFade()
	local ActiveCutScene_7 = FindNodeByName("ActiveCutScene_7")
	ActiveCutScene_7:Trigger()
end

global function MeetBackWithDoctor()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("reunite_doc")
	local loc2 = FindNodeByName("reunite_amy")
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local rewiringGame = MinigameManager:GetCircuitMiniGame()
	local hole =  FindNodeByName("Amy_NavMeshHole")
	local rewire_script = FindNodeByName("RewireScript")

		local catch_her_when_she_returns = FindNodeByName("ReuniteWithDoctorTrigger")
		catch_her_when_she_returns:StopTrigger()

	rewire_script.script.EndDocIdle()

	--Stay in the light (DONE)
	--Return to the Doctor in the Generator Room(DONE)
	SetGlobalObjectiveState("POSEDION_2_3_2", 3)
	SetGlobalObjectiveState("POSEDION_2_3_3", 3)
	
	--Start the Generator
	--Rewire the Generator Console
	AddGlobalObjective("POSEDION_2_4")
	
	SayPrep("skip","")
	
	hole:Trigger()
	
	--move ready for mini game
	
	amy:SetTarget(loc2)
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")
		
	
	doctor:SetTarget(loc1)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2)
	
--	amy:SetBehaviour("wait")
--	doctor:SetTarget(amy)
--	doctor:Face(0.8, "sine")
--	amy:SetTarget(doctor)
--	amy:Face(0.5, "sine")

	hole:StopTrigger()
	
	--HINT
	--*NEW
	doctor::SID_2414:That may have done the trick Amy, one more poke around with those wires and we should be sorted!
	
	MinigameManager:SetMiniGameID("MINI_WIRE02")
	rewiringGame:SetBoard(1)
	MinigameManager:StartMiniGame(rewiringGame)	
	MinigameManager:SetCallback(script_node, "GeneratorFixed")
end

global function Init()
	if fans_on then
		local fan_prop = FindNodeByName("fan_prop")
		local fan_loop = FindNodeByShortName("EM_ANIMATOR_Fans_Anim_Fans_Continuous")

		fan_prop:PlayAnim(fan_loop,1,0)
	end
end