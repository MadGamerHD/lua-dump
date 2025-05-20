global script_node

global function run_cutscene()
	
	SayPrep("skip", "")
	local doctor =GetActor("doctor")
	local amy =GetActor("amy")
	local cyberslave = GetActor("cyberslave0")
	local anim_step_back = FindNodeByPartialName("TheDoctor_anim_DRW_StepBack")
	amy:SetBehaviour("wait")
	local loc_amy  = FindNodeByName("loc_cs6_1_amy1")
	amy:Teleport(loc_amy)
	local loc_cyberslave = FindNodeByName("loc_cs6_1_cyberslave1")
	cyberslave:Teleport(loc_cyberslave)

	local loc_doc = FindNodeByName("loc_cs6_1_doc2")
	doctor:SetTarget(loc_doc)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")	
	Wait(1)
	local anim_bang = FindNodeByPartialName("TheDoctor_anim_DRW_HammerDoor")
	doctor:PlayAnim(anim_bang, 1, 0.1)
	doctor:DisableAnimLoop()
	local audio_knock = FindNodeByName("audio_bang1")
	Wait(1)
	--audio_knock:Trigger()
	Wait(0.5)
	--audio_knock:Trigger()
	audio_knock = FindNodeByName("audio_bang2")
	Wait(0.8)
	audio_knock:Trigger()
	
	--CUT SCENE 6.1
	--EXT. Geographical Survey Outpost - DAY
	--The Doctor goes to bang on the main door to the GSO (it is deserted outside)
	doctor::SID_0864:Knock-knock.
	
	local left_door=FindNodeByName("gso_front_door_left") 
	local right_door=FindNodeByName("gso_front_door_right") 
	local loc_right_door=FindNodeByName("loc_gso_front_door_right")
	local loc_left_door=FindNodeByName("loc_gso_front_door_left")  		
	left_door:Move(loc_left_door, 2, "lerp")
	right_door:Move(loc_right_door, 2, "lerp")	
	local audio_door = FindNodeByName("audio_GSO_door_open")
	audio_door:Trigger()
	doctor:PlayAnim(anim_step_back, 1, 0.1)
	doctor:DisableAnimLoop()
	
	
	Wait(1)
	--doctor:SetTarget(cyberslave)
	--doctor:Face(1,"sine")
	local music = FindNodeByName("music_shock_10s")
	PlayMusic(music)
	Wait(1)

	--The door opens to reveal a cyberslave - the Doctor and Amy back up
	doctor::SID_0865:Oh hello. And who are you then?

	doctor:PlayAnim(anim_step_back, 1, 0.1)
	doctor:DisableAnimLoop()
	
	

	local dialogue_script = FindNodeByName("lua_cyberslave0_dialogue")
	dialogue_script.script.Die()

		

	
	
	
	Wait(0.5)
	local loc_doc = FindNodeByName("loc_cs6_1_doc1")
	doctor:SetTarget(loc_doc)
	doctor:SetBehaviour("move")
	local doctor_script = FindNodeByName("script_doctor")
	doctor_script.script.stop_chase = false
	doctor_script.script.Routing_Slave()
	
	--loc_cyberslave = FindNodeByName("loc_cs6_1_doc1")
	loc_cyberslave = FindNodeByName("loc_cs6_1_cyberslave3")
	cyberslave:SetTarget(loc_cyberslave)
	cyberslave:SetMaxSpeed(1)
	cyberslave:SetBehaviour("move")
	
	--The Cyberslave keeps on advancing
	doctor::SID_0403:Conversation not your strongpoint, is it?
	local music = FindNodeByName("music_chase_def")
	PlayMusic(music)

--	cyberslave:SetTarget(doctor)
--	cyberslave:SetBehaviour("follow")
	SayPrep("", "async")
	
	--The Doctor starts running, the slave following.
	--This is to set up the gameplay. The Doctor lures the Cyberslave around a circuit – player takes control of Amy. She will work out how to send a blast of steam at the Cyberslave to knock him out.
	doctor::SID_0404:Amy! I'll keep his attention while you think of a way to overpower him.
	Wait(3)
	SayPrep("skip", "")
	amy::SID_0405:Me? I thought that was your job.
	cyberslave:SetTarget(doctor)
	cyberslave:SetBehaviour("follow")
	cyberslave:DisableSensors()
	left_door:MoveToOrigin(2, "lerp")
	right_door:MoveToOrigin(2, "lerp")
	local audio_door = FindNodeByName("audio_GSO_door_open")
	audio_door:Trigger()
	doctor::SID_0406:I thought you like to be independent. Now if you could think of something. Fast.	

end

global function end_cutscene()
	local cyberslave = GetActor("cyberslave0")
	local amy = GetActor("amy")
	HideLetterBox()
	cyberslave:EnableSensors()
	amy:SetBehaviour("pc")
	
		--adds new objective
		--Dispatch the Cyberslave
		AddGlobalObjective("Cyber_2_2")

		--find a tool to use against cyberslave
		SetGlobalObjectiveState("Cyber_2_2_1", 2) -- 2 is unlock, 3 is done

	FindNodeByName("trigger_snowfall"):EnableNode()
	FindNodeByName("script_snowfall"):Trigger()
end



--TheDoctor_anim_DRW_StepBack
