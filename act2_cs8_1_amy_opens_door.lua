global function run_part_2()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	SayPrep("skip","")
	
	local audio_muffled_doctor = FindNodeByName("audio_doctor_behind_door")
	audio_muffled_doctor:StopTrigger()
	
		local doctor_point=FindNodeByName("loc_cs8_1_doc1")
	
	doctor:Teleport(doctor_point)
	
	--Keep moving to avoid getting caught
	SetGlobalObjectiveState("Cyber_2_7_1", 3) -- 2 is unlock, 3 is done
	--Set up a trap
	SetGlobalObjectiveState("Cyber_2_7_2", 3) -- 2 is unlock, 3 is done
	

	--salvage a cybermat part
	SetGlobalObjectiveState("Cyber_2_4_4", 2) -- 2 is unlock, 3 is done

	--CUT TO
	--INT. CORRIDOR -- DAY
	--AMY
--	amy::SID_0291:Doctor!  Help!


				local cyberslave = GetActor("cyberslave1")
				cyberslave:Die("wait")
				cyberslave:DisableSensors()
				local sleeping_giant = FindNodeByName("script_cyberslave1")
				sleeping_giant.script.died_already = true
				
				local button = FindNodeByName("int_power_button")
				button:StopTrigger()
				button = FindNodeByName("int_live_straigt_wire")
				button:StopTrigger()
				button = FindNodeByName("trigger_live_wire_amy")
				button:StopTrigger()

			

	--CUT SCENE 8.1
	--The Doctor pulls out the sonic and zaps the door - nothing!
	--CUT TO
	--EXT. RADIO ROOM -- DAY
	--And we see the door is barricaded from inside, so that the door can't be opened.
	--And the CYBERSLAVE goes for AMY!
	--CUT TO
	--INT. CORRIDOR/RADIO ROOM -- DAY
	--Frantic, and frustrated, the DOCTOR hammers on the door.
	Wait(2)
	button = FindNodeByName("trigger_live_wire_slave")
	button:StopTrigger()

	SayPrep("skip","async")
	doctor::SID_0292:AMY! Amy are you all right?
	Wait(1)
	local music = FindNodeByName("background_music")
	PlayMusic(music)
	local anim_bang = FindNodeByPartialName("TheDoctor_anim_DRW_HammerDoor")
	doctor:PlayAnim(anim_bang, 1, 0.1)
	Wait(2)
	local door=FindNodeByName("prop_radio_door")
	local door_loc=FindNodeByName("loc_radio_door")
	door:Move(door_loc, 2, "lerp")
	local audio_door = FindNodeByName("audio_GSO_door_open")
	audio_door:Trigger()
	


	local amy_point=FindNodeByName("loc_csc_amy2")

	amy:Teleport(amy_point)
	Wait(1)
	--local anim = FindNodeByPartialName("TheDoctor_anim_DRW_StepBack")
	--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_StepBack ") -- 1.8s
	--doctor:PlayAnim(anim, 1, 0)
	--doctor:DisableAnimLoop()

	--And then the door opens.
	--The Doctor backs up - and there's AMY, casually dusting dirt off her hands.
	--She's pleased with herself.
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Negative01") --3s
	--shake head
	amy:PlayAnim(anim, 1, 0)
	
	amy::SID_0293:Hah, men!  Never around when you want a job doing.  Changing a plug, sorting out a Cyberslave.
	Wait(1.8)
	doctor:SetBehaviour("wait")
		Wait(1.2)
	--	doctor:SetBehaviour("wait")
anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive01") -- 3s
		--nod
		amy:PlayAnim(anim, 1, 0)
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1") --3.8s
	-- back head scratching
	doctor:PlayAnim(anim, 1, 0)	
	Wait(4)
	local anim_step_back = FindNodeByPartialName("Amy_anim_AMY_StepBack")
	amy:PlayAnim(anim_step_back, 1, 0.1)
	



	
anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk negative 1") -- 1.7s
		--arms out in helpless shrug, shaking head
		doctor:PlayAnim(anim, 1, 0)
	SayPrep("skip","")
	
	--And as the Doctor steps into the radio room he sees the Cyberslave on the floor. 
	--THE DOCTOR looks from triumphant AMY to the incapacitated CYBERSLAVE.
	doctor::SID_0295:I don't know why I was ever worried about you.
	doctor:SetBehaviour("wait")
	local amy_point=FindNodeByName("loc_cs8_1_amy1")
	amy:SetMaxSpeed(1.0)
	amy:SetTarget(amy_point)
	amy:SetBehaviour("Move")
	
	--doctor::SID_0294:What did you do?
	--Flash back to amy face to face with the cyberslave.
	--ShowFade()
	--Wait(1)
	--amy_point=FindNodeByName("loc_csc_amy3")
	--amy:Teleport(amy_point)
	
	--door:MoveToOrigin(0.2, "lerp")
	--Wait(0.2)
	--HideFade()
	
	
	
	local cyber_fact = FindNodeByName("int_FACT_cyber_biology")
	cyber_fact:Trigger()
	
	local radio = FindNodeByName("int_radio_console")
	radio:Trigger()
	local part = FindNodeByName("int_cybermat_part")
	part:Trigger()
	--local part = FindNodeByName("int_beacon_console")
	--part:Trigger()
	
	
	
	
end