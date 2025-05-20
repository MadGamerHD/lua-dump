global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	
	local main_cam = FindNodeByName("CutSceneCamera_0")
	local amy_cam = FindNodeByName("CutSceneCamera_1")	
	
	SayPrep("skip","")
	main_cam:CutTo()
	local loc_amy  = FindNodeByName("loc_cs7_1_amy2")
	amy:Teleport(loc_amy)
	local loc_amy  = FindNodeByName("loc_cs7_1_doc1")
	doctor:Teleport(loc_amy)
	local loc_doc  = FindNodeByTag("distress_beacon_small")

	doctor:SetFocus(loc_doc)
	
	local music = FindNodeByName("music_gentle_exposition_10s")
	PlayMusic(music)
	
	--CUT SCENE 7.1
	--The Doctor finding the beacon and getting instructions.
	doctor::SID_0246:There's a Handheld Distress Beacon here. That'll do nicely.
	

	
	local loc_amy = FindNodeByName("loc_cs7_1_amy1")
	amy:SetTarget(loc_amy)
	amy:SetMaxSpeed(1.0)
	amy:SetBehaviour("move")	
	amy_cam:CutTo()
		--rubbing hands together
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking3") --3.76s
		doctor:PlayAnim(anim, 1, 0)
	amy::SID_0247: I thought you were more into answering SOS calls. Not making them.
	SayPrep("","async")
	doctor::SID_0248:This is just what we need to deal with the Cybermats.
	Wait(3)
	main_cam:CutTo()
	SayPrep("skip","")
	doctor:SetFocus(amy)
	amy::SID_0249: Clarification request.
	doctor:SetTarget(amy)
	doctor:Face(0.5, "sine")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3") --4.8s
	--hands behind back, then left hand out
	doctor:PlayAnim(anim, 1, 0)
	doctor::SID_0250:If I can get it to emit the same frequency pulse as the Sonic Screwdriver, but stronger, it will work like an EMP device and disable them all.
	doctor:ClearFocus()
	local loc_doc  = FindNodeByTag("distress_beacon_small")
	doctor:SetTarget(loc_doc)
	doctor:Face(0.5, "sine")
	amy_cam:CutTo()
	
	--nod, hand on hip
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive02") --5s
	amy:PlayAnim(anim, 1, 0)
	amy::SID_0251:Sounds like a plan to me.
	
	--Find a weapon to use on the mats
	SetGlobalObjectiveState("Cyber_2_4_2", 3) -- 2 is unlock, 3 is done
	
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()

	local music = FindNodeByName("background_music")
	PlayMusic(music)
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
end