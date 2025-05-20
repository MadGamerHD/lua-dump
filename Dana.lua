global script_node

global current_topic_index
current_topic_index = 1

global done_hint_for_GatherIngredients
global done_hint_for_TriangulateSensors
done_hint_for_GatherIngredients = false
done_hint_for_TriangulateSensors = false

local num_topics = 2

local topic_ids = {"TOPIC_SHARK", "TOPIC_FLASH", "TOPIC_RADIATION"}

local decision_manager = FindManagerByName("EmAdventureGame_DecisionManager")

local function DoneHintInTree()
	local stage = FindNodeByName("Act2Progression").script.stage

	if stage == "GatherIngredients" then
		return done_hint_for_GatherIngredients
	elseif stage == "TriangulateSensors" then
		return done_hint_for_TriangulateSensors
	end

	return true
end

global function DanaMoveLoc4()
	local dana = GetActor("dana")
	local loc4 = FindNodeByName("LabatoryLocator_Dana")
	dana:SetTarget(loc4)
	dana:SetMoveTime(2)	
	dana:SetBehaviour("move")
	dana:EnableMoveWalls()
	Wait(2)
	local idles = FindNodeByName("script_dana_idle")
	idles.script.play_idles = true
	
end

global function DoExit()
	HideLetterBox()
	
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	DanaMoveLoc4()
	
--	FindNodeByName("EmDefaultCamera"):CutTo()
end

local function SetupHUD()
	Wait(0.1)
	SayPrep("skip", "")
	
	if( not DoneHintInTree()) then
		-- Add the hint
		decision_manager:AddOption("", "TOPIC_HINT", script_node, "DoHint")
	end
	
--	-- Add the topic 
--	decision_manager:AddOption("", topic_ids[current_topic_index], script_node, "DoTopic"..current_topic_index)

	if(current_topic_index == 1) then
		decision_manager:AddOption("", "TOPIC_SHARK", script_node, "DoShark")
	elseif(current_topic_index == 2) then
		decision_manager:AddOption("", "TOPIC_FLASH", script_node, "DoFlash")
	elseif(current_topic_index == 3) then
		decision_manager:AddOption("", "TOPIC_RADIATION", script_node, "DoRadiation")
	end
	
	-- Add the exit option
	decision_manager:AddOption("", "TOPIC_EXIT", script_node, "DoExit")

	decision_manager:Start()
end

-- TOPIC_SHARK
global function DoShark()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")
	
	--HINT
	--*NEW
	--Alien shark:
	doctor::SID_2347:How much more damage has that Giant Shark done?
	--HINT
	--*NEW
	dana::SID_2348:Not sure. We know it took out the comms, and several glass tubes. We're still getting damage reports, it's weakened the structural integrity of the entire base.
	
	current_topic_index = 2
	SetupHUD()
end

-- TOPIC_FLASH
global function DoFlash()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")
	
	--Great flash:
	--HINT
	--*NEW
	--Great flash:
	doctor::SID_2349:What did the Great Flash look like, exactly?
	--HINT
	--*NEW
	dana::SID_2350:A bit like a camera flash, but lots of them at the same time. Lasted about thirty seconds.

	current_topic_index = 3
	SetupHUD()
end

-- TOPIC_RADIATION
global function DoRadiation()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")
	
	--HINT
	--*NEW
	--Vortron radiation:
	doctor::SID_2351:You did really well trying to deal with the Vortron radiation.
	--HINT
	--*NEW
	dana::SID_2352:Not well enough. I've never seen anything even remotely like it.
	
	current_topic_index = 0
	if(DoneHintInTree()) then
		DoExit()
	else
		SetupHUD()
	end
end


global function DoHint()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")
	local stage = FindNodeByName("Act2Progression").script.stage

	SayPrep("skip", "")
	
	-- I believe the only times you can get hints from Dana are during the following "stages". It might be worth checking
	-- this though :)
	if stage == "GatherIngredients" then
		done_hint_for_GatherIngredients = true
		--HINT
		--*NEW
		--Ingredient locations (hint):
		doctor::SID_2353:If I can find some Sticky Mushrooms, I can make a cure for the radiation sickness.
		--HINT
		--*NEW
		dana::SID_2354:There were some in the tubes, but we got rid of them. It's nice and dark in the store rooms though, there might be some in there.
	elseif stage == "TriangulateSensors" then
		done_hint_for_TriangulateSensors = true
		--HINT
		--*NEW
		--Triangulator location (hint):
		doctor::SID_2355:Where would be a good place to triangulate the source of the radiation?
		--HINT
		--*NEW
		dana::SID_2356:You could use the scanners up on the Bridge.
	end
	
	if(current_topic_index == 0) then
		DoExit()
	else
		SetupHUD()
	end
end

global function Interact()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")

	ShowLetterBox()
	doctor:SetBehaviour("wait")
	doctor:SetTarget(dana)
	doctor:Face(1, "sine")

	Wait(0.2)
	dana:SetTarget(doctor)
	dana:Face(0.9, "sine")
	
	if(current_topic_index == 0 ) then
		DoHint()
	else
		local idles = FindNodeByName("script_dana_idle")
		idles.script.play_idles = false
		SetupHUD()
	end
end



global function Use()

end