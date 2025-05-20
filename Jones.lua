global script_node

global current_topic_index
current_topic_index = 1

global done_hint_for_JourneyToGenerator 
global done_hint_for_ReturnToAssemblyHall 
global done_hint_for_NegotiateAccessToTunnels 
global done_hint_for_GatherIngredients 
global done_hint_for_ReturnToLabFormulateCure 
global done_hint_for_TriangulateSensors

done_hint_for_JourneyToGenerator = false
done_hint_for_ReturnToAssemblyHall = false
done_hint_for_NegotiateAccessToTunnels = false
done_hint_for_GatherIngredients = false
done_hint_for_ReturnToLabFormulateCure = false
done_hint_for_TriangulateSensors = false

local num_topics = 2

local topic_ids = {"TOPIC_SHARK", "TOPIC_FLASH"}

local decision_manager = FindManagerByName("EmAdventureGame_DecisionManager")

local function DoneHintInTree()
	local stage = FindNodeByName("Act2Progression").script.stage

	if(stage == "JourneyToGenerator") then
		return done_hint_for_JourneyToGenerator
	elseif(stage == "ReturnToAssemblyHall") then
		return done_hint_for_ReturnToAssemblyHall			
	elseif(stage == "NegotiateAccessToTunnels") then
		return done_hint_for_NegotiateAccessToTunnels			
	elseif(stage == "GatherIngredients") then
		return done_hint_for_GatherIngredients	
	elseif(stage == "ReturnToLab" or stage == "FormulateCure") then
		return done_hint_for_ReturnToLabFormulateCure
	elseif(stage == "TriangulateSensors") then
		return done_hint_for_TriangulateSensors
	end

	return true
end

global function DoExit()
	local doctor = GetActor("doctor")
	
	HideLetterBox()
--	FindNodeByName("EM_ENTITY_Interact_Disc_Flanagan"):EnableNode()
	
	doctor:SetBehaviour("pc")
end

local function SetupHUD()
	Wait(0.1)
	SayPrep("skip", "")
	
	if( not DoneHintInTree()) then	
		-- Add the hint
		decision_manager:AddOption("", "TOPIC_HINT", script_node, "DoHint")
	end

--	-- Add the topic 
--		decision_manager:AddOption("", topic_ids[current_topic_index], script_node, "DoTopic"..current_topic_index)

	if(current_topic_index == 1) then
		decision_manager:AddOption("", "TOPIC_SHARK", script_node, "DoShark")
	elseif(current_topic_index == 2) then
		decision_manager:AddOption("", "TOPIC_FLASH", script_node, "DoFlash")
	end

	-- Add the exit option
	decision_manager:AddOption("", "TOPIC_EXIT", script_node, "DoExit")

	decision_manager:Start()
end

-- TOPIC_SHARK
global function DoShark()
	local doctor = GetActor("doctor")
	local jones = GetActor("jones")
	
	--Alien shark:
	--HINT
	--*NEW
	doctor::SID_2325:When did the Giant Shark first appear?
	--HINT
	--*NEW
	jones::SID_2326:All recent, unusual phenomena, coincided with the burst of light two days ago.
	
	current_topic_index = 2
	SetupHUD()
end

-- TOPIC_FLASH
global function DoFlash()
	local doctor = GetActor("doctor")
	local jones = GetActor("jones")
	
	--Great flash:
	--HINT
	--*NEW
	doctor::SID_2321:Did you see this Great Flash the others were talking about?
	--HINT
	--*NEW
	jones::SID_2322:My sensors recorded several teraquads of information relating to the event. I have some fascinating seismographs, but nothing that is useful to the current situation, unfortunately.

	current_topic_index = 0
	if(DoneHintInTree()) then
		DoExit()
	else
		SetupHUD()
	end
end

-- Thee hint that Jones can give you depends on the current gameplay "stage"
global function DoHint()
	local doctor = GetActor("doctor")
	local jones = GetActor("jones")
	local stage = FindNodeByName("Act2Progression").script.stage

	SayPrep("skip","")
	
	if(stage == "JourneyToGenerator") then
		done_hint_for_JourneyToGenerator = true
		--Restarting generator (hint):
		--HINT
		--*NEW
		doctor::SID_2319:What's the best route to the Generator?
		--HINT
		--*NEW
		jones::SID_2320:The generator is located approximately 120 meters from this location. Either set of tunnels will lead you there.
		--jones::I will open the airlock to allow you access.
		
	elseif(stage == "ReturnToAssemblyHall") then
		done_hint_for_ReturnToAssemblyHall = true
		--Vortron radiation:
		--HINT
		--*NEW
		--doctor::SID_2323:Have you detected any unusual radiation with your sensors?
		doctor::SID_2611:Alien radiation, I knew it!
		--HINT
		--*NEW
		--jones::SID_2324:Yes, but it does not fit any normal radiation frequencies. Conclusion: either this is a sensor malfunction, or the radiation does not originate from Earth.
		jones::SID_2612:Perhaps you should inform the other personnel of your findings.
			
	elseif(stage == "NegotiateAccessToTunnels") then
		done_hint_for_NegotiateAccessToTunnels = true
		--Access codes (hint - dismissive):
		--HINT
		--*NEW
		doctor::SID_2327:Can you give me the access codes for the agricultural sectors?
		--HINT
		--*NEW
		jones::SID_2328:I cannot disobey a direct order. Oswald told me not to tell you, under any circumstances.
			
	elseif(stage == "GatherIngredients") then
		done_hint_for_GatherIngredients = true
		--Ingredient locations:
		--HINT
		--*NEW
		doctor::SID_2329:Where can I find Sea Sprouts, Brine Oil, and Sticky Mushrooms?
		--HINT
		--*NEW
		jones::SID_2330:Any plants would be processed before use. And Brine Oil is used to service the machinery in the store rooms.
		
	elseif(stage == "ReturnToLab" or stage == "FormulateCure") then
		done_hint_for_ReturnToLabFormulateCure = true
		--Make the cure:
		--HINT
		--*NEW
		doctor::SID_2331:Do you have any equipment I can use to combine these ingredients?
		--HINT
		--*NEW
		jones::SID_2332:I wasn't given a full inventory of everything in the base, although I asked for it several times. Dana kept adding things at the last minute. It's a very inefficient way of working.
		
	elseif(stage == "TriangulateSensors") then
		done_hint_for_TriangulateSensors = true
		--Triangulator location (hint):
		--HINT
		--*NEW
		doctor::SID_2333:How can we locate the source of the Vortron energy?
		--HINT
		--*NEW
		jones::SID_2334:Perhaps you can triangulate it by using the scanners on the Bridge.
	
	end
	
	if(current_topic_index == 0) then
		DoExit()
	else
		SetupHUD()
	end
end

global have_performed_passive_cutscene

local function PassiveCutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local jones = GetActor("jones")
	local oswald = GetActor("oswald")
	local dana = GetActor("dana")
	local int_low = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow")
	local idle = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02")
	local talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")
	local turn90 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft90")
	local os_loc = FindNodeByName("After_7_1_Oswald")
	local da_loc = FindNodeByName("After_7_1_Dana")
	local jones_cam = FindNodeByName("jones_cam")
	local game_cam = FindNodeByName("EmDefaultCamera")

	ShowLetterBox()
	jones_cam:CutTo()
		
	SayPrep("skip","")
		
	doctor:SetBehaviour("wait")
	doctor:SetTarget(FindNodeByName("doc_by_jones"))
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	
	amy:SetTarget(FindNodeByName("amy_by_jones"))
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	
	-- CUTSCENE 7.1
	-- AFTER CUTSCENE 7
	--INT. POSEIDON. JONES COMPUTER ROOM -- NIGHT
	doctor::SID_2071:Hello Jones me old mucker, can you have a butchers at this for me?
	
	doctor:PlayAnimBlendOut(int_low,1,0.2,0.2)
	--The doctor inserts the chip into Jones' interface
	jones::SID_2072:Certainly Doctor. It's a standard Environment Status Chip, issued to all Poseidon personnel.

	doctor:PlayAnimBlendOut(idle,1,0.2,0.2)
	jones::SID_2073:That's strange. I'm picking up some unknown radiation. I'm supposed to be able to identify every possible type of radiation. My sensors must be damaged.

	doctor:PlayAnimBlendOut(talk3,1,0.2,0.2)
	doctor::SID_2074:No, your sensors are working perfectly, Jones - you can't identify it because it's alien. And I'm fairly sure I can fix it, too.
	
	doctor:PlayAnimBlendOut(turn90,1,0.2,0.2)
	doctor::SID_2703:I need to tell the others.
	
	doctor:RemoveInventoryItem(FindNodeByName("chip"))
	
	HideLetterBox()
	game_cam:CutTo()
	
	have_performed_passive_cutscene = 1
	
	-- Allow the Doctor to head up stairs now
	FindNodeByName("AssemblyRoom").script.lift_state = "unlocked"
	
	--move this?
	dana:Teleport(da_loc)
	oswald:Teleport(os_loc)
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	--Show ESC to Jones (DONE)
	SetGlobalObjectiveState("POSEIDON_2_5_1", 3)

	--Talk to Dana and Oswald (UNLOCKED)
	SetGlobalObjectiveState("POSEIDON_2_5_2", 2)

	SaveCheckpoint()
end

global function Interact()
	local doctor = GetActor("doctor")
	local jones = GetActor("jones")
	
	-- If we're returning to the assembly hall with the chip, run a small passive cutscene of
	-- the Doctor talking to Jones about the ESC. Otherwise, run the dialogue options
	local stage = FindNodeByName("Act2Progression").script.stage
	
	if(stage == "ReturnToAssemblyHall" and have_performed_passive_cutscene == nil) then
		PassiveCutscene()
	else
		doctor:SetTarget(script_node:FindNodeByTag("eye"))
		doctor:SetBehaviour("wait")
		doctor:Face(1, "sine")
		ShowLetterBox()
		
		if(current_topic_index == 0 ) then
			DoHint()
		else
			SetupHUD()
		end
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local chip = FindNodeByName("chip")

	if doctor:IsUsingInventoryItem(chip) then
		PassiveCutscene()
	else
		FindNodeByName("common").script.RandomRefusal()	
	end
end
