-- ACT 2 Break Down

--	Objective 2.1 Journey to the generator
--		Use the lights to avoid the Vashta Nerada
--		* USE EMERGENCY LIGHTING GEOMETRY *
--		* ENABLE THE VASHTA NERADA THREAT IN TUNNELS *
--		* OPEN ALL DOORS *
--	Objective 2.2 Kill the divers
--		Divers follow the Doctor and Amy and are killed when caught in a cross-beam of spotlights
--	Objective 2.3 Rewire the generator
--		Rewiring minigame
--	Objective 2.4 Flush the vents
--		Amy to journey alone, using bait to distract the Vashta Nerada (unproven idea)
--	Objective 2.4a Periodically return the Doctor to fix the generator (again!)
--		Rewiring minigame
--		* USE FULLY LIT GEOMETRY *
--		* CLOSE ALL DOORS *
--		* DISABLE THE VASHTA NERADA THREAT IN TUNNELS *
--		* ENABLE THE SHARK  THREAT IN THE TUNNELS *
--	Objective 2.5 Discover the type of radiation
--		Return to the Assembly Room, attacked by the shark at 4 different locations
--	Objective 2.6 Search for the medicinal ingredients
--		Head back out into the tunnels, searching for the ingredients. Although certain paths are blocked, no attack from enemies at this point
--		* DISABLE THE SHARK  THREAT IN THE TUNNELS *
--	Objective 2.7 Create the cure (no gameplay?)
--		Return to the Assembly Room
--	Objective 2.8 Use the terminals in the Assembly Room to discover the source of the radiation
--		Sonic the 2 computer terminals

local LightControlScripts =
	{
		"LightControlScript_01",
		"LightControlScript_02",
		"LightControlScript_03",
		"LightControlScript_04",
		"LightControlScript_05",
		"LightControlScript_06",
		"LightControlScript_07",
		"LightControlScript_08",
		"DarkDeathScript_01",
		"DarkDeathScript_02",
		"DarkDeathScript_03",
		"DarkDeathScript_04",
		"DarkDeathScript_05",
		"DarkDeathScript_06",
	}

local DoorScripts =
	{
		"Door1Script_0",
		"Door1Script_1",
		"Door1Script_2",
		"Door1Script_3",
--		"Door1Script_4",
		"Door1Script_7",
		"Door1Script_8",
		"Door1Script_9",
		"Door1Script_10",
		"Door1Script_11",
		"Door1Script_12",
		"Door1Script_13",
		"Door1Script_14",
		"Door1Script_15",
		"Door1Script_16",
		"Door1Script_17",
		"Door2Script_0",
		"Door2Script_1",
--		"Door2Script_2",
--		"Door2Script_3",
		"Door2Script_4",
		"Door2Script_5",
--		"Door3Script_0",
--		"Door3Script_1",
--		"Door3Script_2",
--		"Door3Script_3"
	}

local SharkTriggers =
	{
		"SharkTrigger_0",
		"SharkTrigger_1",
		"SharkTrigger_2",
		"SharkTrigger_3"
	}
	
local IngredientPickupInteracts =
	{
		"BrineOilInteract_0",
		"BrineOilInteract_1",
		"BrineOilInteract_2",
		"BrineOilInteract_3",
		"MushroomInteract_0",
		"MushroomInteract_1",
		"MushroomInteract_2",
		"MushroomInteract_3",
		"SeaSproutInteract_0",
		"SeaSproutInteract_1",
		"SeaSproutInteract_2",
		"SeaSproutInteract_3"
	}
	
local IngredientExamineInteracts =
	{
		"BrineOilExamine_0",
		"BrineOilExamine_1",
		"BrineOilExamine_2",
		"BrineOilExamine_3",
		"MushroomExamine_0",
		"MushroomExamine_1",
		"MushroomExamine_2",
		"MushroomExamine_3",
		"SeaSproutExamine_0",
		"SeaSproutExamine_1",
		"SeaSproutExamine_2",
		"SeaSproutExamine_3"
	}

local LightTunnelsBurnFile = FindNodeByShortName("Act2_TEMP_Section_D")
local LightTopBurnFile = FindNodeByShortName("Act2_TEMP_Section_B")
local DarkTunnelsBurnFile = FindNodeByShortName("Act2_TEMP_Section_A")
local DarkTopBurnFile = FindNodeByShortName("Act2_TEMP_Section_E")

global script_node

-- Variable the monitors if we have power of not (i.e. in darkness or not)
global is_power_out
is_power_out = true

-- Variable the monitors if we have power of not (i.e. in darkness or not)
global stage

-- First time in? Begin with the opening cutscene
--if not IsLoadingSavedGame() and stage == nil then
--	stage = "OpeningCutscene"
--end

-- Some keypad stuff to control the sequence counts on the doors
global keypad_difficulty
if not IsLoadingSavedGame() then
	keypad_difficulty = 0
end

global function GetKeypadSequenceLength()
	if(keypad_difficulty == 0) then
		return 4
	elseif(keypad_difficulty == 1) then
		return 4
	else
		return 5
	end
end

global function IncreaseKeypadDifficulty()
	keypad_difficulty = keypad_difficulty + 1
end

-- Common actor variables
local doctor = FindNodeByName("TheDoctor_Actor_0")
local amy = FindNodeByName("Amy_Actor_0")

global function DisableAllDoors()
	for index = 1, #DoorScripts do
		FindNodeByName(DoorScripts[index]).script.PowerOff()
	end
end

global function EnableAllDoors()
	for index = 1, #DoorScripts do
		FindNodeByName(DoorScripts[index]).script.PowerOn()
	end
end

global function DisableAllLightControls()
	for index = 1, #LightControlScripts do
		FindNodeByName(LightControlScripts[index]).script.Disable()
	end
end

global function EnableAllLightControls()
	for index = 1, #LightControlScripts do
		FindNodeByName(LightControlScripts[index]).script.Enable()
	end
end

local function SetIngredientsToExamine()
	-- disable the interact (pickup) interactors
	for index = 1, #IngredientPickupInteracts do
		FindNodeByName(IngredientPickupInteracts[index]):DisableNode()
	end

	-- enable the examine interactors
	for index = 1, #IngredientExamineInteracts do
		FindNodeByName(IngredientExamineInteracts[index]):EnableNode()
	end
end

local function SetIngredientsToPickup()
	-- disable the interact (pickup) interactors
	for index = 1, #IngredientPickupInteracts do
		FindNodeByName(IngredientPickupInteracts[index]):EnableNode()
	end

	-- enable the examine interactors
	for index = 1, #IngredientExamineInteracts do
		FindNodeByName(IngredientExamineInteracts[index]):DisableNode()
	end
end

global function EnableSharkAttack()
	for index = 1, #SharkTriggers do
		FindNodeByName(SharkTriggers[index]):Wake()
	end
end

global function DisableSharkAttack()
	for index = 1, #SharkTriggers do
		FindNodeByName(SharkTriggers[index]):Sleep()
	end
end

local function SwitchToTunnelsDarkBurn()
	FindNodeByTag("LightTunnelsBurn"):Hide()
	FindNodeByTag("DarkTunnelsBurn"):Show()

	LightTunnelsBurnFile:DisablePlsVolumes()
	DarkTunnelsBurnFile:EnablePlsVolumes()
end

local function SwitchToTunnelsLightBurn()
	FindNodeByTag("LightTunnelsBurn"):Show()
	FindNodeByTag("DarkTunnelsBurn"):Hide()

	LightTunnelsBurnFile:EnablePlsVolumes()
	DarkTunnelsBurnFile:DisablePlsVolumes()
end

global function PowerOff()
	DisableAllDoors()
	
	if not is_power_out then
		SwitchToTunnelsDarkBurn()
		is_power_out = true
	end
end

global function PowerOn()
	EnableAllDoors()
	DisableAllLightControls()

	if is_power_out then
		SwitchToTunnelsLightBurn()
		is_power_out = false
	end
end

global function Cutscene4Dark()
	FindNodeByTag("LightTopBurn"):Hide()
	FindNodeByTag("DarkTopBurn"):Show()
	FindNodeByName("Xmas"):Hide()

	LightTopBurnFile:DisablePlsVolumes()
	DarkTopBurnFile:EnablePlsVolumes()
	PowerOff()
end

global function Cutscene4Light()
	FindNodeByTag("LightTopBurn"):Show()
	FindNodeByTag("DarkTopBurn"):Hide()
	FindNodeByName("Xmas"):Show()

	LightTopBurnFile:EnablePlsVolumes()
	DarkTopBurnFile:DisablePlsVolumes()
end

global is_tube_destroyed

local function SetNoTubesDestroyed()
	 is_tube_destroyed = {}
	for i = 0, 3, 1 do
		is_tube_destroyed[i] = false
	end
end

if(not IsLoadingSavedGame()) then
	SetNoTubesDestroyed()
end

local function UpdateTubeTriggers()
	if(is_tube_destroyed[0]) then
		FindNodeByName("BlueDoorInteractable_25"):DisableNode()
		FindNodeByName("HorizontalDoorInteractable_6"):DisableNode()
	elseif(is_tube_destroyed[1]) then
		FindNodeByName("BlueDoorInteractable_26"):DisableNode()
		FindNodeByName("HorizontalDoorInteractable_11"):DisableNode()
	elseif(is_tube_destroyed[2]) then
		FindNodeByName("BlueDoorInteractable_17"):DisableNode()
		FindNodeByName("Door1Trigger_0"):DisableNode()
	elseif(is_tube_destroyed[3]) then
		FindNodeByName("BlueDoorInteractable_18"):DisableNode()
		FindNodeByName("Door1Trigger_1"):DisableNode()
	end
end

global function DestroyTube(tube)
	is_tube_destroyed[tube] = true
	UpdateTubeTriggers()
end

--temp code for wranglin' amy light puzzlor
--PowerOff()
--is_power_out = false --lie!

global function SetStage_OpeningCutscene()
	stage = "OpeningCutscene"
	
	-- And so it begins...
	local cutscene = FindNodeByName("ActiveCutScene_4")
	cutscene:Trigger()
end

global function SetStage_JourneyToGenerator()
	
	--Get to the Generator Room
	--Stay in the light
	--Enter the Generator Room
	AddGlobalObjective("POSEIDON_2_1")
	
	stage = "JourneyToGenerator"
	
	-- Power off is done midway through cutscene 4

	-- Emergency lighting is enabled
	EnableAllLightControls()
	
	--Moved to CS script...
	--if not IsLoadingSavedGame() then
	--	print("Teleporting characters!")
		-- teleport downstairs!
		--doctor:Teleport(FindNodeByName("JonesRoomLocator_Doctor"))
		--amy:Teleport(FindNodeByName("JonesRoomLocator_Amy"))
	--end
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	-- Disable the "lift"
	-- TODO replace with doctor vo about needing to finish tasks first
	--FindNodeByName("LiftUpTrigger"):EnableNode()
	FindNodeByName("AssemblyRoom").script.lift_state = "locked"
end

global function SetStage_DefeatTheDivers()
	
	--Get to the Generator Room (DONE)
	--Stay in the light (DONE)
	--Enter the Generator Room (DONE)
	SetGlobalObjectiveState("POSEIDON_2_1_1", 3)
	SetGlobalObjectiveState("POSEIDON_2_1_2", 3)
	
	--Start the Generator
	--Defeat the first Diver
	--Defeat the second Diver	
	--Rewire the Generator Console (LOCKED)
	AddGlobalObjective("POSEIDON_2_2")
	
	stage = "DefeatTheDivers"
end

global function SetStage_RewireTheGenerator()
	
	--Rewire the Generator Console (UNLOCKED)
	SetGlobalObjectiveState("POSEIDON_2_2_3", 2) 
	
	stage = "RewireTheGenerator"
end


global function SetStage_JounreyToProcessingRoom()

	--Flush the Generator Vents
	--Activate the Venting System
	--Stay in the light
	--Return to the Doctor in the Generator Room (LOCKED)
	AddGlobalObjective("POSEIDON_2_3")

	stage = "JounreyToProcessingRoom"
	
	--PowerOff()

	DisableAllLightControls()
	local light_script = FindNodeByName("IntermittentLightController")
	light_script.script.ActivateIntermittentLights()
	
	amy:SetBehaviour("pc")
	
	FindNodeByName("warn_about_flashing_lights"):EnableNode()
end

global function SetStage_ReturnToDoctor()

	--Activate the Venting System (DONE)
	SetGlobalObjectiveState("POSEIDON_2_3_1", 3) 	
	
	--Return to the Doctor in the Generator Room (UNLOCKED)
	SetGlobalObjectiveState("POSEIDON_2_3_3", 2) 

	stage = "ReturnToDoctor"
	
	-- Disable the diver activation trigger
	FindNodeByName("ActivateDiverTrigger_0"):DisableNode()
end

global function SetStage_ReturnToAssemblyHall()

	--Rewire the Generator Console (DONE)
	SetGlobalObjectiveState("POSEIDON_2_4_1", 3) 	
	
	--Return to Poseidon 8
	--Show ESC to Jones
	--Talk to Dana and Oswald (LOCKED)
	AddGlobalObjective("POSEIDON_2_5")

	stage = "ReturnToAssemblyHall"
	
	local light_script = FindNodeByName("IntermittentLightController")
	light_script.script.DeactivateIntermittentLights()
	
	PowerOn()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	EnableSharkAttack()
end

global function SetStage_NegotiateAccessToTunnels()

	--Talk to Dana and Oswald (DONE)
	SetGlobalObjectiveState("POSEIDON_2_5_2", 3)

	--Find Ingredients for a cure
	--Get clearance to the tunnels
	--Find some Brine Oil (LOCKED)
	--Find some Sea Sprouts (LOCKED)
	--Find some Sticky Mushrooms (LOCKED)
	AddGlobalObjective("POSEIDON_2_6")

	stage = "NegotiateAccessToTunnels"
	
	-- Position dana in her lab ready for the cure
	--GetActor("dana"):Teleport(FindNodeByName("LabatoryLocator_Dana"))
	--...done in cut scene now
end

global function SetStage_GatherIngredients()

	print("SetStage_GatherIngredients")
	
	--Get clearance to the tunnels (DONE)	
	SetGlobalObjectiveState("POSEIDON_2_6_1", 3)
	
	--Find some Brine Oil (UNLOCKED)
	--Find some Sea Sprouts (UNLOCKED)
	--Find some Sticky Mushrooms (UNLOCKED)
	SetGlobalObjectiveState("POSEIDON_2_6_2", 2)
	SetGlobalObjectiveState("POSEIDON_2_6_3", 2)
	SetGlobalObjectiveState("POSEIDON_2_6_4", 2)
	
	stage = "GatherIngredients"
	
	SetIngredientsToPickup()
	
	--open doors turn off their triggers
	DisableAllDoors()
	DisableSharkAttack()
	
	--TODO close doors from any shark attacks!!!
	
	-- Enable the lift on the way down
	--FindNodeByName("LiftDownTrigger"):EnableNode()
	--FindNodeByName("LiftUpTrigger"):DisableNode()
	FindNodeByName("AssemblyRoom").script.lift_state = "unlocked"
end

global function SetStage_ReturnToLab()
	stage = "ReturnToLab"
	
	--Create a cure for the Time Radiation
	--Return to Dana's Lab with Ingredients
	--Use Lab equipment to create a cure (LOCKED)
	AddGlobalObjective("POSEIDON_2_7")
	
	--FindNodeByName("LiftUpTrigger"):EnableNode()
	FindNodeByName("AssemblyRoom").script.lift_state = "unlocked"
	
	print("Unlocking lift...")
end

global function SetStage_FormulateCure()

	stage = "FormulateCure"
	
	-- Make sure this cutscene triggers are setup
	FindNodeByName("TriggerCutscene8"):EnableNode()
	
	-- Position dana in her lab ready for the cure
	GetActor("dana"):Teleport(FindNodeByName("LabatoryLocator_Dana"))
end

global function SetStage_TriangulateSensors()

	--Return to Dana's Lab with Ingredients (DONE)
	--Use Lab equipment to create a cure (DONE)
	SetGlobalObjectiveState("POSEIDON_2_7_1", 3)
	SetGlobalObjectiveState("POSEIDON_2_7_2", 3)	

	--Find the source of the Time Radiation
	--Activate the Left Triangulating Sensor
	--Activate the Right Triangulating Sensor
	--Return to Dana's Lab to view the results (LOCKED)
	AddGlobalObjective("POSEIDON_2_8")
	
	stage = "TriangulateSensors"
	
	FindNodeByName("TriggerCutscene8"):DisableNode()
end

-- We have the talk functions here because the responses depend at what stage you're at 
-- with the act
global function TalkToDana()
	local dana_hints = FindNodeByName("dana_hints")
	
	if(stage == "NegotiateAccessToTunnels") then
		FindNodeByName("Cutscene_DanaConversation").script.Start()
	else
		dana_hints.script.Interact()
	end
end

global function TalkToOswald()
end

global function Init()
	print("Current stage is ", stage)
	
	Cutscene4Light()

	if is_power_out then
		SwitchToTunnelsDarkBurn()
	else
		SwitchToTunnelsLightBurn()
	end
end
