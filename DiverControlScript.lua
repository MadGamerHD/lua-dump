global script_node

local is_diver_gameplay_active = false

global divers_on_light_path

if not IsLoadingSavedGame() then
	divers_on_light_path = false
end

local light_active = false

--used to be local...
global num_divers_dead 
num_divers_dead= 0

-- Diver stuff. I've used arrays so we can loop round the number of divers
-- in various places. I could have used a table, but lua tables make my head hurt
local diver_actor = {}
diver_actor[0] = FindNodeByTag("Diver_0")
diver_actor[1] = FindNodeByTag("Diver_1")
local diver_alive = {}
diver_alive[0] = true
diver_alive[1] = true
local diver_target_spline = {}
diver_target_spline[0] = 0
diver_target_spline[1] = 1

-- Actors that are constantly needed nere
local doctor = GetActor("doctor")
local amy = GetActor("amy")

--------------------------------------------------------------------
-- Diver functions
--------------------------------------------------------------------

local function SetDiversToPath(splines)
	for i=0, 1, 1 do
		diver_actor[i]:SetSpline(splines[i])
	end
end

global function SetDiversToPatrol()
	for i=0, 1, 1 do
		if(diver_alive[i] == true) then
			diver_actor[i]:SetBehaviour("patrol")
		end
	end
end

global function ActivateTheDivers()

	FindNodeByName("Act2Progression").script.SetStage_DefeatTheDivers()

	-- guard against activating multiple times
	if(is_diver_gameplay_active == false) then
		--Place the doctor and amy above on the catwalk
		doctor:Teleport(FindNodeByName("LadderLocatorTop_Doctor_1"))
		amy:Teleport(FindNodeByName("LadderLocatorTop_Amy_1"))
		
		FindNodeByName("LadderInteractableUp_0"):DisableNode()
		FindNodeByName("LadderInteractableDown_0"):EnableNode()
		FindNodeByName("LadderInteractableUp_1"):DisableNode()
		FindNodeByName("LadderInteractableDown_1"):EnableNode()
		
		local splines = {}
		splines[0] = FindNodeByName("DiverSpline_AvoidLight_0")
		splines[1] = FindNodeByName("DiverSpline_AvoidLight_1")
		SetDiversToPath(splines)
		SetDiversToPatrol()
		
		is_diver_gameplay_active = true
		
		-- Disable the diver activation trigger
		FindNodeByName("ActivateDiverTrigger_0"):DisableNode()
	end
end

local function PutDiversOnPathIntoLight()
	local spline = {}
	spline[0] = FindNodeByName("DiverSpline_IntoLight_0")
	spline[1] = FindNodeByName("DiverSpline_IntoLight_1")
	
	-- Find out which diver this is
	diver_actor[0]:SetSpline(spline[diver_target_spline[0]])
	diver_actor[0]:SetBehaviour("patrol")
	diver_actor[1]:SetSpline(spline[diver_target_spline[1]])
	diver_actor[1]:SetBehaviour("patrol")
	
	divers_on_light_path = true
end

-- A couple of functions that control which spline a diver should change to
-- depending on its location in the room
global function ChangeToSpline0()
	local diver_entity = GetTriggerNode()
	if(diver_entity == FindNodeByTag("DiverTransform_0")) then
		diver_target_spline[0] = 0
	elseif(diver_entity == FindNodeByTag("DiverTransform_1")) then
		diver_target_spline[1] = 0
	end
end

global function ChangeToSpline1()
	local diver_entity = GetTriggerNode()
	if(diver_entity == FindNodeByTag("DiverTransform_0")) then
		diver_target_spline[0] = 1
	elseif(diver_entity == FindNodeByTag("DiverTransform_1")) then
		diver_target_spline[1] = 1
	end
end

local function MakeRoomSafe()

	StopMusic()
	FindNodeByName("Doctor_Success_Audio"):Trigger()

	-- Wait for a bit to let the enormity of what's been accomplished sink in :)
	Wait(4)

	local rewire_interactable = FindNodeByName("RewireInteractable")
	rewire_interactable:EnableNode()
	
	doctor:DisableStealth()
	amy:DisableStealth()
	
	ShowFade()
	Wait(2)
	HideFade()
	
	FindNodeByName("ActiveCutScene_6"):Trigger()
	--FindNodeByName("Cutscene_6").script.PerformCutscene6()
	--FindNodeByName("Act2Progression").script.SetStage_RewireTheGenerator()
end

local function KillDiver(diver)
	diver_actor[diver]:SetBehaviour("wait")
	--local anim = FindNodeByPartialName("Anim_CYS_Death")
	--diver_actor[diver]:PlayAnim(anim, 1, 0)
	diver_actor[diver]:Die("Explosion")
	diver_actor[diver]:DisableSensors()
	diver_alive[diver] = false
	
	num_divers_dead = num_divers_dead + 1
	
	if(num_divers_dead == 2) then
		--Defeat the second Diver (DONE)
		SetGlobalObjectiveState("POSEIDON_2_2_2", 3)

		MakeRoomSafe()
	else
		--Defeat the first Diver (DONE)
		SetGlobalObjectiveState("POSEIDON_2_2_1", 3)
	end
end

global function ActivateLight()
	light_active = true
end

global function DeactivateLight()
	light_active = false
end

local lights = {}
lights[0] = FindNodeByName("DiverKillLight_0")

global function RandomLightFlickering()
	if not light_active then
		--local random_light = Random(2)
		local random_intensity = Random(3)
		--if(random_light == 1) then
			lights[0]:Trigger()
			lights[0]:SetAttr("IntensityMultiplier", random_intensity)
			lights[1]:StopTrigger()
		--else
		--	lights[1]:Trigger()
		--	lights[1]:SetAttr("IntensityMultiplier", random_intensity)
		--	lights[0]:StopTrigger()
		--end
	end
end

global function Idle()
	if light_active then
		-- See if the divers are within the trigger volume
		-- Rather than use trigger events, we do a distance check so that the test is continuous
		local trigger_pos = FindNodeByName("KillDiverTrigger_0")
		local diver_pos = {}
		diver_pos[0] = FindNodeByTag("DiverTransform_0")
		diver_pos[1] = FindNodeByTag("DiverTransform_1")
		
		for i = 0, 1, 1 do
			if(diver_alive[i] == true) then
				-- If it's within the 2 meter radius, the diver is hit by enough light and should be killed
				local distance = GetDistanceBetweenTransforms(trigger_pos, diver_pos[i])
				if(distance < 2) then
					KillDiver(i)
				end
			end
		end
	end
	
	--RandomLightFlickering()
end


--------------------------------------------------------------------
-- Crate functions
--------------------------------------------------------------------

global function MoveCrate()
	local cratePullStart = FindNodeByName("DoctorsCrateMoveStartLocation")
	
	doctor:SetTarget(cratePullStart)
	doctor:SetCallback(script_node, "MoveCrate_Start")
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	
	-- stop the diver attacking during the crate push?
	-- TODO
end

global function MoveCrate_Start()
	local anim = FindNodeByPartialName("Anim_DRW_Into_Push")
	local start_wav = FindNodeByName("crate_start")

	start_wav:Trigger()
	doctor:SetCallback(script_node, "MoveCrate_Moving")
	doctor:DisablePhysics()
	doctor:PlayAnim(anim, 1, 0)
end

local numberOfPushes = 3

global function MoveCrate_Moving()
	local crate = FindNodeByTag("MoveCrate")
	local toLocation = FindNodeByName("CrateMoveToLocation")
	local anim = FindNodeByPartialName("Anim_DRW_Push")
	local loop_wav = FindNodeByName("crate_loop")

	loop_wav:Trigger()
	crate:Move(toLocation, 6, "lerp")
	doctor:SetCallback(script_node, "MoveCrate_KeepMoving")
	doctor:PlayAnim(anim, 0.95, 0)
	
	numberOfPushes = numberOfPushes - 1
end

global function MoveCrate_KeepMoving()

	if(numberOfPushes > 1) then
		local anim = FindNodeByPartialName("Anim_DRW_Push")

		doctor:SetCallback(script_node, "MoveCrate_KeepMoving")
		doctor:PlayAnim(anim, 1, 0)
	else
		local anim = FindNodeByPartialName("Anim_DRW_OutOf_Push")
		local loop_wav = FindNodeByName("crate_loop")
		local stop_wav = FindNodeByName("crate_stop")

		loop_wav:StopTrigger()
		stop_wav:Trigger()

		doctor:SetCallback(script_node, "MoveCrate_ReturnPlayerControl")
		doctor:PlayAnim(anim, 1, 0.5)
	end
	
	numberOfPushes = numberOfPushes - 1
end

global function MoveCrate_ReturnPlayerControl()
	-- Disable the crate interactable
	local crateInteractable = FindNodeByName("CrateMoveInteractable_0")

	crateInteractable:DisableNode()
		
	-- Enable player control
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
	
	-- switch the diver patrol routes to help them avoid the crates
	PutDiversOnPathIntoLight()
end
