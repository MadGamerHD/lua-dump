global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	ShowLetterBox()
	doctor:DisableStealth()
	amy:DisableStealth()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")


	HideFade()
	local music = FindNodeByName("CS7_music")
	PlayMusic(music)
	
	local door = FindNodeByName("prop_strorage_room_door2")
	local door_loc = FindNodeByName("loc_storage_room_door2")
	door:Move(door_loc, 1, "lerp")
	
	FindNodeByName("script_intercom").script.doc_ask_about_chisholm = true
	
	Wait(36)
	local arm = FindNodeByName("Cyberarm_cs7")
	arm:StopTrigger()
	
end


global function end_cutscene()
	CutToFade()
	local cyberslave = GetActor("cyberslave1")
	local loc = FindNodeByName("loc_csc_cyberslave")
	cyberslave:Teleport(loc)
	local meadows = GetActor("meadows")
	loc = FindNodeByName("loc_cs7_end_meadows")
	meadows:Teleport(loc)
	loc = FindNodeByName("loc_cs7_arm")
	--local arm = FindNodeByName("prop_cyber_arm")
	--arm:Move(loc, 0.1, "lerp")
	local arm = FindNodeByName("EM_ENTITY_Cyberman_Arm_FACT")
	arm:Trigger()
	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	loc = FindNodeByName("loc_cs7_end_doc")
	doctor:Teleport(loc)
	loc = FindNodeByName("loc_cs7_end_amy")
	amy:Teleport(loc)
	WaitFrame()
	HideFade()
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	local stealth_fiddler = FindNodeByName("Trigger_stealth")
	stealth_fiddler:StopTrigger()
	local stealth_fiddler = FindNodeByName("Trigger_stealth1")
	stealth_fiddler:StopTrigger()
	--doctor:EnableStealth()
	--amy:EnableStealth()
	


	--talk to meadows
	SetGlobalObjectiveState("Cyber_2_3_3", 3) -- 2 is unlock, 3 is done
	SetGlobalObjectiveState("Cyber_2_3_1", 3) -- 2 is unlock, 3 is done
	--Create a serum
	AddGlobalObjective("Cyber_2_4")
	--Find the cybermat nest
	SetGlobalObjectiveState("Cyber_2_4_1", 2) -- 2 is unlock, 3 is done
	--Find a weapon to use on the mats
	SetGlobalObjectiveState("Cyber_2_4_2", 2) -- 2 is unlock, 3 is done
	--Dispatch the cybermats
	SetGlobalObjectiveState("Cyber_2_4_3", 1) -- 2 is unlock, 3 is done
	--salvage a cybermat part
	SetGlobalObjectiveState("Cyber_2_4_4", 1) -- 2 is unlock, 3 is done
	
	local music = FindNodeByName("background_music")
	PlayMusic(music)
	
	Wait(1)
	loc = FindNodeByName("loc_cs7_end_meadows_table")
	meadows:SetTarget(loc)
	meadows:SetMoveTime(2)
	meadows:SetBehaviour("move")
	Wait(2)
	meadows:SetBehaviour("wait")
	local int_meadows = FindNodeByName("int_meadows")
	int_meadows:Trigger()
	SaveCheckpoint()
	local this_cutscene = FindNodeByName("Cutscene_7")
	this_cutscene:StopTrigger()
	
	
end