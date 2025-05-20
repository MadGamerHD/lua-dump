global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	SayPrep("skip","async")
	
	amy:SetBehaviour("wait")
	local amy_point=FindNodeByName("loc_cs8_3_amy1")
	amy:Teleport(amy_point)
	local doc_point=FindNodeByName("loc_microscope")
	doctor:Teleport(doc_point)
	
	--CUT SCENE 8.3
	--INT. LAB - DAY. 
	--The Doctor is just finishing off creating the cure as Amy walks in
	doctor::SID_0428:Ah Amy! Look. One synthesized Nano-serum. Who's a clever boy, then?
	Wait(1)
	doctor:SetTarget(amy)
	doctor:Face(0.5, "sine")
	--Wait(1)
	
	amy_point=FindNodeByName("loc_cs8_3_amy2")
	amy:SetTarget(amy_point)
	amy:SetMaxSpeed(1.1)
	amy:SetBehaviour("move")
	
	Wait(5)
	SayPrep("skip","")
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive02") --5s
	amy:PlayAnim(anim, 1, 0)
	
	--slightly disappointed
	amy::SID_0429:Yeah? Well I fixed the Radio and warned Fort Cecil. You're not the only brainbox around here.
	amy:SetBehaviour("wait")
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
	--right hand out, left hand out
	doctor:PlayAnim(anim, 1, 0)
	doctor::SID_0430:You managed it? Brilliant.
	doctor::SID_0431:We can't allow anyone to get near this base. 
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3") --4.8s
	--hands behind back, then left hand out
	doctor:PlayAnim(anim, 1, 0)
	--split up previous line into two
	doctor::SID_1025:Cybermats are bad enough - but those Cybermen under the ice are something else entirely.
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking1") -- 4.9s
	--head in hand again
	doctor:PlayAnim(anim, 1, 0)
	SayPrep("skip","async")
	doctor::SID_0432:We need to find out how close the Cyberslaves are to releasing the Cybermen. 
	

	anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnLeft90") --1.63
	amy:PlayAnimAndWait(anim, 1, 0)
		Wait(2)
	anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnRight90") --1.76
	amy:PlayAnim(anim, 1, 0)

	doctor:SetBehaviour("wait")
	SayPrep("skip","")
	--split up previous line into two
	doctor::SID_1026: And hope there is still time to stop them.

	
	--amy:SetTarget(doctor)
--	amy:Face(0.5, "sine")
	amy_point=FindNodeByName("loc_cs8_3_amy_focus")
	amy:SetBehaviour("wait")
	amy:SetFocus(amy_point)
	--amy:Face(0.5, "sine")
	amy::SID_0433: Alright. Where's Meadows?
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1") --3.8s
	-- back head scratching
	doctor:PlayAnim(anim, 1, 0)
	amy:SetFocus(doctor)
	doctor::SID_0434: I don't know. When I got back she had gone. I don't like that at all.
	doctor:SetBehaviour("wait")
	Wait(0.75)
	--amy:SetTarget(doctor)
	--amy:Face(1.0, "sine")
	amy:ClearFocus()
	anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Negative01") --3s
	--shake head
	amy:PlayAnim(anim, 1, 0)
	amy::SID_0435: We should get this Serum to Chisholm. 
	amy:SetBehaviour("wait")
	doctor::SID_0436: You're right. First things first.
	



end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	local stop_block = FindNodeByName("trigger_dont_leave_lab")
	stop_block:StopTrigger()
		
	--analyse part
	SetGlobalObjectiveState("Cyber_2_4_6", 3) -- 2 is unlock, 3 is done
	--Take cure to Chisholm
	AddGlobalObjective("Cyber_2_6")
end
