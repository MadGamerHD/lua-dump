local locator_names =
	{
		"doctor_bait_route_0",
		"doctor_bait_route_1", 
		"doctor_bait_route_2",
		"doctor_bait_route_3",
		"doctor_bait_route_4",
		"doctor_bait_route_5",
		"doctor_bait_route_6",
		"doctor_bait_route_7",
		"doctor_bait_route_8",
		"doctor_bait_route_9",
		"doctor_bait_route_10",
		"doctor_bait_route_11"
	}


global model
global script_node
global first
global first_valve_hint
global stop_chase
stop_chase = true

global current_locator
current_locator = 0
first_valve_hint = 0 
first = 0

if not IsLoadingSavedGame() then
	local doctor = GetActor("doctor")
	local ScrewDriver = script_node:FindInventoryItem()
	doctor:AddInventoryItem(ScrewDriver )
end

global function valve_hint()
	local doctor = GetActor("doctor")
	if(first_valve_hint == 0) then
		first_valve_hint = 1
		--HINT
		--hint about steam vents
		--shouted as the The Doctor is staying in front of the cyberslave lumbering after him.
		doctor::SID_0879:The machinery over there might come in handy to dispatch this chap.

	elseif(first_valve_hint == 1) then
		first_valve_hint = 0
		--HINT
		doctor::SID_0880: I'll lure him past the Vents. Blast him with a burst of Steam!
		
	else
		--HINT about steam vents
		--shouted as the The Doctor is staying in front of the cyberslave lumbering after him.
		doctor::SID_0992:Look! Find something we can use against him! Preferably before he kills us!
		first_valve_hint = 1
	end
end

global function ChisholmTalk()
	local doctor = GetActor("doctor")
	--HINT
	doctor::SID_0443: Maybe Chisholm can help you.
end
			

global function Talk()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip", "")
	
	
	local key_card = FindNodeByName("key_card")
	if(doctor:IsInventoryItem(key_card)) then  -- then we're not in the first cyberslave chase - hint about radio part

		
		local capacitor = FindNodeByName("capacitor")
		if( not amy:IsInventoryItem(capacitor)) then
			if(first == 0) then
				amy:SetBehaviour("wait")
				ShowLetterBox()
				local cut_cam = FindNodeByName("asking_doc_for_help")
				cut_cam:Trigger()
				local waypoint_amy = FindNodeByName("loc_ask_for_help_amy")
				amy:SetTarget(waypoint_amy)
				amy:SetMoveTime(1)
				amy:SetBehaviour("move")
				Wait(1)
				doctor:SetFocus(amy)
				--HINT
				--small exchange: Amy talks to doctor when he's trying to create the cure
				doctor::SID_0437: Did you fix the Radio?
				--HINT
				amy::SID_0438: No, but...
				doctor:ClearFocus()
				local waypoint_doc = FindNodeByName("loc_ask_for_help_doc")
				doctor:DisablePhysics()
				doctor:SetTarget(waypoint_doc)
				doctor:SetMoveTime(1)
				doctor:SetBehaviour("move")
				
				--HINT
				doctor::SID_0439: Then you really need to let me concentrate on this.
				--HINT
				--doctor::SID_0440: I've got to reprogram this Synthesizer to reverse what's happening to Chisholm.
				local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_BendandLook")

				doctor:PlayAnim(anim, 1, 0.1)
				doctor:DisableAnimLoop()
				--HINT
				--small exchange: Amy talks to doctor when he's trying to create the cure
				amy::SID_0441: But I haven't got a clue where to find this Radio Part.
				ChisholmTalk()
				--HINT
				amy::SID_0444:Then I hope he's still human. I'll go and see. Maybe he can help.
				first = 1
				HideLetterBox()
				doctor:EnablePhysics()
				amy:SetBehaviour("pc")
			elseif(first == 1) then
				--HINT
				doctor::SID_0442: Hmm. A place like this must have spares in some sort of store room.
				first = 2
			else
				ChisholmTalk()
				first = 1
			end
		else
			--VO
			amy::SID_2020:I've got to fit the Capacitor in the Radio.
		end
	else		-- being chased by slave. steam hint.
		valve_hint()
	end
end



global function Routing_Slave()
	local next_locator = current_locator + 1
	print("next_locator ", next_locator)

	local doctor = GetActor("doctor")
	local locator_node = FindNodeByTag(locator_names[next_locator])
	
	doctor:SetTarget(locator_node)
	doctor:SetCallback(script_node, "ArrivedAtLocator")
	doctor:SetMaxSpeed(1.55)
	doctor:EnablePhysics()	-- this should turn the walls backs on after load
	doctor:SetBehaviour("move")
end

global function Init()
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	if(stop_chase == false) then
		Routing_Slave()
		Wait(2)
		first_valve_hint = Random(3)-1
		valve_hint()
	end
end

global function ArrivedAtLocator()
--	if(current_locator == 2 or current_locator == 4 or current_locator == 7 or current_locator == 12) then
--		local doctor = GetActor("doctor")
--		local anim = FindNodeByTag("TheDoctor_Anim_LookOverShoulder_L")
--		doctor:PlayAnim(anim, 1, 0.1)
--		doctor:DisableAnimLoop()
--		Wait(0.8)
--	end
	print("ArrivedAtLocator")

	current_locator = current_locator + 1
	if current_locator == 12 then
		current_locator = 0
	end
	if(stop_chase == false) then
		Routing_Slave()
		
	end
end

global function Trigger()
	--Routing_Slave()
	

	
	
	
end

global function EndWithAmyStealth()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()

	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	doctor:EnableStealth()
	amy:EnableStealth()
	doctor:SetBehaviour("pc")
	Wait(2)
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
	--OverlayManager:ShowHint("TITLE_STEALTH","HINT_STEALTH_01 HINT_STEALTH_02 HINT_STEALTH_03", "hint_stealth_01.tga hint_stealth_02.tga hint_blank.tga", 0, 0, 15)	
	OverlayManager:ShowTutorial("STEALTH")
	Wait(1)
	OverlayManager:TutorialsOff()
end
