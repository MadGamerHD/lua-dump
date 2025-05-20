global script_node

local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
local amy_idles = FindNodeByName("lua_amy_cutscene_idles")
local decision_manager = FindManagerByName("EmAdventureGame_DecisionManager")
local question_sumoid_set1 = {"DANA_CODES", "DANA_GENERATOR"}
local question_sumoid_set2 = {"DANA_INGREDIENTS", "DANA_TRUST"}
local question_function_set1 = {"AnswerCodes", "AnswerGenerator"}
local question_function_set2 = {"AnswerIngredients", "AnswerTrust"}
local qindex_1 = 1
local qindex_2 = 1

local function SetupOptions()
	if(question_sumoid_set1[qindex_1] ~= nil) then
		decision_manager:AddOption("", question_sumoid_set1[qindex_1], script_node, question_function_set1[qindex_1])
	end
	
	if (question_sumoid_set1[qindex_1] ~= question_sumoid_set2[qindex_2]) and (question_sumoid_set2[qindex_2] ~= nil) then
		decision_manager:AddOption("", question_sumoid_set2[qindex_2], script_node, question_function_set2[qindex_2])
	end
	decision_manager:Start()
end

local function AdvanceIndex(current_function)
	if question_function_set1[qindex_1] == current_function then
		qindex_1 = qindex_1 + 1
	end
	
	if question_function_set2[qindex_2] == current_function then
		qindex_2 = qindex_2 + 1
	end
end

local function CameraOnDana()
	FindNodeByName("labcam_dana"):CutTo()
end

local function CameraOnDoctorAmy(cam)
	if cam == 1 then
		FindNodeByName("labcam_doctoramy1"):CutTo()	
	else
		FindNodeByName("labcam_doctoramy2"):CutTo()	
	end
end

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dana = GetActor("dana")
	local intro_cam = FindNodeByName("labcam_intro")
	--local dturn = FindNodeByShortName("EM_ANIMATOR_Bond_Anim_TAN_TurnRight90")
	local doctalk1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1")
	
	local idles = FindNodeByName("script_dana_idle")
	idles.script.play_idles = false
	
	ShowLetterBox()

	SayPrep("skip", "")
	
	amy:Teleport(FindNodeByName("LabatoryLocator_AmyTalking_pre"))
	
	-- I want the characters quite huddled together, to do that
	-- i'm going to disable collision detection temporarily
	doctor:DisablePhysics()
	amy:DisablePhysics()
	
	-- Opening camera
	intro_cam:CutTo()

	-- Move the characters into position
	doctor:SetTarget(FindNodeByName("LabatoryLocator_DoctorTalking"))
	doctor:SetMoveTime(2.5)
	doctor:SetBehaviour("move")
	
	Wait(0.5)
	amy:SetTarget(FindNodeByName("LabatoryLocator_AmyTalking"))
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")

	--see below
	--dana:PlayAnimBlendOut(dturn,1,0.1,0.1)
 	dana:SetFocus(doctor)
 	
	Wait(2)
	doctor:SetFocus(amy)
	doctor:PlayAnimBlendOut(doctalk1,1,0.1,0.1)	
	--CUTSCENE 7.i
	--AFTER CUTSCENE 7A
	--INT. POSEIDON. LABORATORY - NIGHT
	--The Doctor, Amy speak to Dana. Dialogue for retrieving the access codes.
	--DIALOGUE TREE
	--Dialogue prompt
	doctor::SID_2085:I should ask Dana about those codes.
	
	FindNodeByName("labcam_all"):CutTo()

	doctor:ClearFocus()

	dana:SetTarget(FindNodeByName("LabatoryLocator_DanaTalking"))
	dana:SetMoveTime(1)
	dana:SetBehaviour("move")
	Wait(1)

	doc_idles:Wake()
	amy_idles:Wake()
	
	SetupOptions()
end

global function AnswerCodes()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dana = GetActor("dana")
	local dtalk1 = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Talk01")
	local doctalk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")
	local amyidle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle4")

	AdvanceIndex("AnswerCodes")

	doc_idles.script.End()
	amy_idles.script.End()
	
	--1) CODES?
		CameraOnDoctorAmy(1)
		amy:PlayAnimBlendOut(amyidle,1,0.1,0.1)
		doctor:PlayAnimBlendOut(doctalk2,1,0.1,0.1)	
		doctor::SID_2086:Oswald won't let us out. We need those access codes.
		
		CameraOnDana()
		dana:PlayAnimBlendOut(dtalk1,1,0.1,0.2)
		dana::SID_2087:I'm sorry, I can't give them to you.
		
	doc_idles:Wake()
	amy_idles:Wake()
		
	SetupOptions()
end

global function AnswerIngredients()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dana = GetActor("dana")
	local dtalk2 = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Talk02")
	local doctalkp = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward")
	
	AdvanceIndex("AnswerIngredients")
	
	doc_idles.script.End()
	amy_idles.script.End()
	
	--2) INGREDIENTS?
		CameraOnDoctorAmy(2)
		doctor:PlayAnimBlendOut(doctalkp,1,0.1,0.1)	
		doctor::SID_2088:I'm sure I'll find the ingredients in the store rooms out there.
		
		CameraOnDana()
		dana:PlayAnimBlendOut(dtalk2,1,0.1,0.2)
		dana::SID_2089:But you're not certain. It's too risky.
		
	doc_idles:Wake()
	amy_idles:Wake()
		
	SetupOptions()
		
end

global function AnswerGenerator()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dana = GetActor("dana")
	local dtalk1 = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Talk01")
	local doctalk1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1")
	local amyplead = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Pleading")
	
	AdvanceIndex("AnswerGenerator")

	doc_idles.script.End()
	amy_idles.script.End()
	
	--3) GENERATOR?
		CameraOnDoctorAmy(2)
		doctor:PlayAnimBlendOut(doctalk1,1,0.1,0.1)	
		doctor::SID_2090:We fixed the generator, it must be safer out there now.
		
		amy:PlayAnimBlendOut(amyplead,1,0.1,0.1)
		amy::SID_2091:We'd be taking all the risks, not you.
		
		CameraOnDana()
		dana:PlayAnimBlendOut(dtalk1,1,0.1,0.2)
		dana::SID_2092:And I'm responsible for your safety. I can't let you go.
		
	doc_idles:Wake()
	amy_idles:Wake()
		
	SetupOptions()
end

global function AnswerTrust()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dana = GetActor("dana")
	local jones = GetActor("jones")
	local Act2Progression = FindNodeByName("Act2Progression")
	local dtalk2 = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Talk02")
	local dturn180 = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_TurnLeft180")	
	local doctalkc1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1")
	local doctalkc2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2")
	local amytalk = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Generic1")
	local loc = FindNodeByName("Talk_To_Jones")
	
	doc_idles.script.End()
	amy_idles.script.End()
	
	--4) TRUST?
		CameraOnDoctorAmy(1)
		doctor:PlayAnimBlendOut(doctalkc1,1,0.1,0.1)	
		doctor::SID_2093:You're not putting Oswald in danger, or breaking his trust. This will help all of us.
		
		CameraOnDana()
		dana:PlayAnimBlendOut(dtalk2,1,0.1,0.1)
		dana::SID_2094:Fine. But be careful... and try to get back before Oswald notices.

		CameraOnDoctorAmy(2)
		doctor:PlayAnimBlendOut(doctalkc2,1,0.1,0.1)	
		doctor::SID_2095:Thank you, Dana. I'm always careful. And when we come back with the cure, he'll be glad we went.

		CameraOnDana()
		--NEW
		dana::SID_2718:I'll enter the codes now.
		dana:ClearFocus()
		dana:SetBehaviour("wait")
		Wait(1)
		dana:SetTarget(loc)
		dana:SetMoveTime(2)
		dana:SetBehaviour("move")
		
		Wait(2)
		--Dana then moves to a terminal and interacts with Jones.
		jones::SID_2096:Access codes accepted. Security override released.

		dana:PlayAnimBlendOut(dturn180,1,0.1,0.1)
		amy:PlayAnimBlendOut(amytalk,1,0.1,0.1)
		amy::SID_2097:Shush! We're trying to do this on the quiet, you numpty! 
		
	-- TODO WIN (proper)
	FindNodeByName("Act2Progression").script.SetStage_GatherIngredients()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	doctor:EnablePhysics()
	amy:EnablePhysics()
		
	HideLetterBox()
	
	-- Return to game camera
	FindNodeByName("EmDefaultCamera"):CutTo()
	
	FindNodeByName("dana_hints").script.DanaMoveLoc4()
	
end
             



