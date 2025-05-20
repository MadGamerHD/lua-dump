global function run_cutscene()

	
	ShowLetterBox()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	HideFade()
	local door = FindNodeByName("int_radio_door")
	door:StopTrigger()	
	
	local music = FindNodeByName("CS8_music")
	PlayMusic(music)
	local cyberslave = GetActor("cyberslave1")
	
	local loc = FindNodeByName("loc_csc_cyberslave")
	--local loc = FindNodeByName("loc_csc_cyberslave_hide")
	cyberslave:Teleport(loc)

	--kill all cybermats
	local critter = FindNodeByName("Outside_Cybermats")
	critter:StopTrigger()	
	critter = FindNodeByName("Cybermats")
	critter:StopTrigger()	





	



end

global function end_cutscene()
	local amy = GetActor("amy")
	local doctor=GetActor("doctor")
	local cyberslave = GetActor("cyberslave1")
	local amy_point=FindNodeByName("loc_csc_amy1")
	amy:Teleport(amy_point)
	local doc_point=FindNodeByName("loc_cutscene8_doc_end")
	doctor:Teleport(doc_point)
	
	--local loc = FindNodeByName("loc_csc_cyberslave")
	--cyberslave:Teleport(loc)
	
	
	local audio_muffled_doctor = FindNodeByName("audio_doctor_behind_door")
	audio_muffled_doctor:Trigger()
	
	--Dispatch the cybermats
	SetGlobalObjectiveState("Cyber_2_4_3", 3) -- 2 is unlock, 3 is done

	HideLetterBox()
	amy:SetBehaviour("pc")
	
	--dispatch second slave
	AddGlobalObjective("Cyber_2_7")
	--Keep moving to avoid getting caught
	SetGlobalObjectiveState("Cyber_2_7_1", 2) -- 2 is unlock, 3 is done
	--Set up a trap
	SetGlobalObjectiveState("Cyber_2_7_2", 2) -- 2 is unlock, 3 is done
	
	cyberslave:SetBehaviour("patrol")
	cyberslave:EnableSensors()
	amy:EnablePhysics()
	
		cyberslave = GetActor("cyberslave0")
		cyberslave:SetBehaviour("wait")
		local anim = FindNodeByPartialName("Anim_CYS_Death")
		cyberslave:PlayAnim(anim, 1000, 0)
	
	local music = FindNodeByName("music_chase_def")
	PlayMusic(music)
	--VO
	amy::SID_2027: He's going to catch me, I've got to run!

end

