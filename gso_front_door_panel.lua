global script_node

local common_scripts = FindNodeByName("common_scripts")
local doctor =GetActor("doctor")
local amy =GetActor("amy")
global first_time
local loc = FindNodeByName("loc_key_card_panel")
local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")


	
global function InteractMoveFinished()
	SayPrep("skip", "")
	local doctor = GetActor("doctor")
	
	--amy:SetCallback(script_node, "InteractAnimFinished")
--	doctor:PlayAnim(anim, 1, 0.1)
--	doctor:DisableAnimLoop()

	
	if(first_time == nil) then
		doctor:SetBehaviour("wait")
		ShowLetterBox()
		--VO
		--interact with panel
		doctor::SID_2021:Keycard lock. No Keycard. Maybe I should knock.
		local cyberslave = FindNodeByName("cyberslave_emerges_CS6_1")
		cyberslave:Trigger()
		first_time = 10
	else
		--VO
		--interact with panel
		doctor::SID_0163:The Panel operates the Door. All I need is the Keycard.
		doctor:SetBehaviour("pc")
	end
end

global function InteractMoveFinishedAmy()
	SayPrep("skip", "")
	local amy = GetActor("amy")
	--amy:SetCallback(script_node, "InteractAnimFinished")
--	amy:PlayAnim(anim_amy, 1, 0.1)
--	amy:DisableAnimLoop()
	--VO
	--interact with panel
	amy::SID_0164:A Keycard lock.
	amy:SetBehaviour("pc")
end

global function Interact()

	local doctor =GetActor("doctor")
	local amy =GetActor("amy")
	local doctor_player =common_scripts.script.DoctorIsPlayer()
	if(doctor_player) then	
		--doctor:SetTarget(loc)
		--doctor:SetCallback(script_node, "InteractMoveFinished")
		--doctor:SetMoveTime(1)
		--doctor:SetBehaviour("move")
		InteractMoveFinished()
	else
		InteractMoveFinishedAmy()
		--amy:SetTarget(loc)
		--amy:SetCallback(script_node, "InteractMoveFinishedAmy")
		--amy:SetBehaviour("move")
	end
end

global function Use()
	local keycard = FindNodeByName("key_card")
	local screwdriver = FindNodeByName("Screwdriver")
	local doctor = GetActor("doctor")
	if (doctor:IsUsingInventoryItem(keycard)) then
		doctor:SetTarget(loc)
		
		doctor:SetMoveTime(1)

		doctor:SetBehaviour("move")
		
		Wait(1)
		doctor:PlayAnim(anim, 1, 0.5)
		Wait(1)
		local audio_valve = FindNodeByName("audio_card_swipe") --s0.57
		audio_valve:Trigger()
		
		Wait(0.5)

		local left_door=FindNodeByName("gso_front_door_left") 
		local right_door=FindNodeByName("gso_front_door_right") 
		local loc_right_door=FindNodeByName("loc_gso_front_door_right")
		local loc_left_door=FindNodeByName("loc_gso_front_door_left")  
		--left_door:MoveByOverTime({-2.0,0.0,0.0},0.5) 
		--right_door:MoveByOverTime({2.0,0.0,0.0},0.5) 
		local audio_door = FindNodeByName("audio_GSO_door_open")
		audio_door:Trigger()		
		left_door:Move(loc_left_door, 2, "lerp")
		right_door:Move(loc_right_door, 2, "lerp")
		Wait(2)
		doctor:SetBehaviour("pc")

		--Use keycard on door - 
		SetGlobalObjectiveState("Cyber_2_1_2", 3) -- 2 is unlock, 3 is done
		
		--adds new objective
		--Look for survivors
		AddGlobalObjective("Cyber_2_3")
		
		--explore the base
		SetGlobalObjectiveState("Cyber_2_3_1", 2) -- 2 is unlock, 3 is done
			
		local me=FindNodeByName("int_key_card_panel") 
	--	local cyberslave0 = FindNodeByTag("cyberslave0")
		--cyberslave0:StopTrigger()
		local new_interact = FindNodeByName("int_key_card_panel_open")
		new_interact:Trigger()
		
		me:StopTrigger()
		FindNodeByName("snowfall_FX"):StopTrigger()
	elseif doctor:IsUsingInventoryItem(screwdriver) then
		SayPrep("skip","")
		--VO
		--generic response to dead-locked door
		doctor::SID_0260: This door is dead-locked. The Sonic is no good.
	else
		common_scripts.script.RandomRefusal()
	end

end
