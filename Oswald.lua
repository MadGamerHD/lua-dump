global script_node

local hint_count

hint_count = 0

global current_topic_index
current_topic_index = 1 --Change this to start asking a different topic first 

local topic_ids = {"TOPIC_SHARK", "TOPIC_FLASH", "TOPIC_RADIATION"}

local num_topics = #topic_ids

local num_topics_done = 0

local decision_manager = FindManagerByName("EmAdventureGame_DecisionManager")



local function SetupHUD()
	local idles = FindNodeByName("script_oswald_idle")
	idles.script.play_idles = false
	Wait(0.1)
	SayPrep("skip", "")
	
--	-- Add the hint
--	decision_manager:AddOption("", "TOPIC_HINT", script_node, "DoHint")
	-- Add the topic 
--	if(num_topics_done < num_topics) then
		decision_manager:AddOption("", topic_ids[current_topic_index], script_node, "DoTopic"..current_topic_index)
--	end
	-- Add the exit option
	decision_manager:AddOption("", "TOPIC_EXIT", script_node, "DoExit")

	decision_manager:Start()
end

global function DoExit()
	HideLetterBox()
	local oswald = GetActor("oswald")
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	
	local oswald_turn = FindNodeByName("loc_oswald_look_back")
	
	oswald:SetTarget(oswald_turn)
	WaitFrame()
	oswald:Face(1, "sine")
	Wait(0.5)
	local idles = FindNodeByName("script_oswald_idle")
	idles.script.play_idles = false
--	FindNodeByName("EmDefaultCamera"):CutTo()
end

local function NextTopic()
	current_topic_index = current_topic_index + 1;
	if current_topic_index > num_topics then
		current_topic_index = 1
	end
	
	num_topics_done = num_topics_done + 1;
	if(num_topics_done < num_topics) then
		SetupHUD()
	else
		DoExit()
	end
end

-- TOPIC_SHARK
global function DoTopic1()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")
	
	--HINT
	--*NEW
	--Alien shark:
	doctor::SID_2337:How much damage has that Giant Shark done?
	--HINT
	--*NEW
	oswald::SID_2338:Too much. I tried to save O'Connell... but he didn't stand a chance. I'm not letting anyone else die today.
	
	NextTopic()
end

-- TOPIC_FLASH
global function DoTopic2()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")
	
	--Great flash:
	--HINT
	--*NEW
	--Great flash:
	doctor::SID_2339:Did you see this Great Flash as well?
	--HINT
	--*NEW
	oswald::SID_2340:Of course I did. It was like daylight for a few seconds. Couldn't really miss that.
	
	NextTopic()
end

-- TOPIC_RADIATION
global function DoTopic3()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")
	
	--HINT
	--*NEW
	--Vortron radiation:
	doctor::SID_2341:Vortron radiation shouldn't exist on this planet. It could cause all sorts of problems I haven't even thought of yet.
	--HINT
	--*NEW
	oswald::SID_2342:I don't care. If we get out of the base, we'll leave it behind. Maybe it'll kill a few fish.
	
	NextTopic()
end

-- Generic dismissive hint from Oswald
global function DoHint()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")

	--HINT
	--*NEW
	--doctor::I could really use your help about now.

	SayPrep("skip", "")	
	
	if hint_count == 0 then
		hint_count = 1
		--HINT
		--*NEW
		oswald::SID_2705:Get away from me, I'm busy.
	elseif hint_count == 1 then
		hint_count = 2
		--HINT
		--*NEW
		oswald::SID_2706:I haven't got time to listen to your silly ideas again.
	elseif hint_count == 2 then
		hint_count = 0
		--HINT
		--*NEW
		oswald::SID_2707:Just leave me alone, I'm not interested.
	end
	
	--SetupHUD()
end



global function Interact()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")

	--num_topics_done = 0
	if(num_topics_done>2) then
		DoHint()
	else
	
		ShowLetterBox()
		doctor:SetBehaviour("wait")
		doctor:SetTarget(oswald)
		doctor:Face(1, "sine")

		Wait(0.2)
		oswald:SetTarget(doctor)
		oswald:Face(0.9, "sine")
		
		SetupHUD()
	end
end

global function EXTRAS()
	local oswald = GetActor("oswald")
	local dana = GetActor("dana")
	local doctor = GetActor("doctor")
		
	--NEW
	--HINT
	oswald::SID_2713:Do I look like a chef? Some of the others reckon they've seen mushrooms growing around the base, but I haven't seen any.

	--NEW
	--XMAS
	--oswald::SID_2708:We thought you'd been killed. Merry Christmas, for what it’s worth.	

	--NEW
	--XMAS
	--doctor::SID_2709:But there isn't any hospital ship.  You don't need a hospital ship - you've got me! You couldn't wish for a better Christmas present!
	
	--NEW
	--XMAS
	--oswald::SID_2710:Whoever you are, wherever you come from, we owe you everything.  We've just had our harvest, and I'd be honoured if the two of you would join us for Christmas dinner.
end
