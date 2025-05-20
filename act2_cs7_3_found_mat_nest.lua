global nest_spotted

global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cam0 = FindNodeByName("CutSceneCamera_0")
	local cam1 = FindNodeByName("CutSceneCamera_1")	
	local cam2 = FindNodeByName("CutSceneCamera_2")
	local cam3 = FindNodeByName("CutSceneCamera_3")	
	local cam4 = FindNodeByName("CutSceneCamera_4")	
	
	
	local music = FindNodeByName("music_exposition_30s")
	PlayMusic(music)
	
	SayPrep("skip","")
	
	nest_spotted = true

	local doctor_point=FindNodeByName("loc_cs7_3_doc1")
	doctor:Teleport(doctor_point)
	local amy_point=FindNodeByName("loc_cs7_3_amy2")
	amy:Teleport(amy_point)
	
	--Find the cybermat nest
	SetGlobalObjectiveState("Cyber_2_4_1", 3) -- 2 is unlock, 3 is done

	--local loc=FindNodeByName("loc_csc_doctor1")
	--amy:SetTarget(loc)
	--amy:SetBehaviour("move")
	WaitFrame()
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1") --3.8s
	--hands behind back
	doctor:PlayAnim(anim, 1, 0)
	amy_point=FindNodeByName("loc_cs7_3_amy1")
	amy:SetTarget(amy_point)
	amy:SetMaxSpeed(1.0)
	amy:SetBehaviour("move")
	doctor_point=FindNodeByName("loc_cs7_3_focus_doc")
	doctor:SetFocus(doctor_point)
	
	
	
	--CUT SCENE 7.3
	--mini Cutscene - spotting the cybetmat nest
	doctor::SID_0218:Can you hear that? The Cybermats are in the air ducting system. It services the whole base - so they'll be everywhere.

	doctor:SetBehaviour("wait")
	doctor::SID_0219: Sneaky devils, aren't they?
	cam4:CutTo()
	amy:SetFocus(doctor_point)
	amy::SID_0220: Can we get to them through here?
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
	--right hand out, left hand out
	doctor:PlayAnim(anim, 1, 0)
	SayPrep("","async")
	doctor::SID_0221: Too dangerous. If I open this hatch, whoosh. Do you fancy getting covered in Cybermats? 
	Wait(2.6)
	
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking2") -- 4s
	--holding haead in hand
	doctor:PlayAnim(anim, 1, 0)
	Wait(4)
	SayPrep("skip","")
	cam0:CutTo()
	doctor:SetBehaviour("wait")
	doctor::SID_0222:Best to get them from above.
	
	amy:SetFocus(doctor)
	amy::SID_0223: You're going through the Vent system?
	doctor:ClearFocus()
	--doctor:SetTarget(amy)
	--doctor:Face(1, "sine")
	cam2:CutTo()
	
	doctor_point=FindNodeByName("loc_cs7_3_doc2")
	doctor:SetTarget(doctor_point)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	
--	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
	--right hand out, left hand out
--	doctor:PlayAnim(anim, 1, 0)
	
	doctor::SID_0224:Am I wearing a Bruce Willis vest? Besides I won't fit.
	doctor_point=FindNodeByName("loc_investigate_vent")
	doctor:SetTarget(doctor_point)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	cam0:CutTo()
	Wait(1)
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward") 
	doctor:PlayAnim(anim, 1, 0)

	doctor::SID_0225:There's another Vent Hatch up there. If I distract them from down here, you might be able to open it.
	doctor:SetBehaviour("wait")
	doctor:SetTarget(amy)
	doctor:Face(1, "sine")
	amy::SID_0226: Me?
	
	cam3:CutTo()
	--anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Defensive") --5s
		--crossing arms, shaking head slightly
	--	amy:PlayAnim(anim, 1, 0)
	
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk negative 1") -- 1.7s
	--arms out in helpless shrug, shaking head
	doctor:PlayAnim(anim, 1, 0.2)
	doctor:SetFocus(amy)
	SayPrep("","async")
	doctor::SID_0227:Sorry. I'm not really ventilation duct size. I can distract them for you with the Sonic Screwdriver.
	Wait(1.7)
	doctor:SetBehaviour("wait")
	Wait(5)
	cam1:CutTo()
	SayPrep("skip","")
	amy::SID_0228: Hmmm. It's a plan... I suppose.
	doctor:ClearFocus()
	amy:ClearFocus()
	
	
	
end
