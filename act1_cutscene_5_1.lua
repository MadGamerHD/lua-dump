--5.1 (PASSIVE)
--Played after portal over london.
--Ends and daleks appear...

local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
local survive_done
local others_done
local maincam = FindNodeByName("CutSceneCamera_0")
local doccam = FindNodeByName("CutSceneCamera_1")
local amycam = FindNodeByName("CutSceneCamera_2")
local sylcam = FindNodeByName("CutSceneCamera_3")

global script_node

global function Start()
	local doctor = GetActor("doctor")
	local cutscene_5_1 = FindNodeByName("cutscene_5_1")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles:Wake()
	amy_idles:Wake()

	SayPrep("skip", "")

	cutscene_5_1:PauseAt(2.99)

	--NEW
	--VO
	--Dialogue tree prompt
		doctor::SID_1290:I should ask a question...

	Wait(0.5)
	--dialogue tree (3x options)
	DecisionManager:AddOption("", "DIALOGUE_SURVIVE", script_node, "AnswerSurvive")
	DecisionManager:AddOption("", "DIALOGUE_OTHERS", script_node, "AnswerOthers")
	DecisionManager:Start()
end

--1)
global function AnswerSurvive()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_concern2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2")
	local amy_happy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_EXP_Happy")
--	local doc_idle2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02")
	local amy_idle2 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle2")
	local syl_talk2 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Talk02")
--	local syl_idle3 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Idle03")	
	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles:Sleep()
	amy_idles:Sleep()
	
	survive_done = true

--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_concern2,1,1,1)
	--CUT SCENE 5.1
	--INT. UNDERGROUND TUNNEL  DAY
	--Sylvia with pipe dropped, she (leans) against the wall, physically and mentally exhausted.
	--The Doctor and Amy stand around her.
	--DIALOGUE TREE (question 1)
	--The Doctor is thinking hard, grim
		doctor::SID_0525:How did you survive?
	sylcam:CutTo()	
	sylvia:PlayAnimBlendOut(syl_talk2,1,1,1)
--	doctor:PlayAnimBlendOut(doc_idle2,1,1,1)
		sylvia::SID_0526:The Daleks defeated the army straight away, but the ordinary people fought for a while...
	amy:PlayAnimBlendOut(amy_idle2,1,1,1)	
--	sylvia:PlayAnimBlendOut(syl_idle3,1,1,1)
		sylvia::SID_0527:You learn fast when you have to.
	amycam:CutTo()
	amy:PlayAnimFacial(amy_happy,1,1,1)
		amy::SID_0528:You've done pretty well on your own. One-woman army.

	maincam:CutTo()
	doc_idles:Wake()
	amy_idles:Wake()
	sylvia:ClearFocus()
	
	if not others_done then
		DecisionManager:AddOption("", "DIALOGUE_OTHERS", script_node, "AnswerOthers")
	end
	DecisionManager:AddOption("", "DIALOGUE_IMPOSSIBLE", script_node, "AnswerImpossible")
	DecisionManager:Start()
end

--2
global function AnswerOthers()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_talk1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1")
	local doc_idle3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03")
	local doc_idle5 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle05")	
	local amy_shocked = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_EXP_Shocked")
	local syl_idle2 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Idle02")
	local syl_talk1 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Talk01")	
	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles:Sleep()
	amy_idles:Sleep()
		
	others_done = true

--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk1,1,1,1)
	--DIALOGUE TREE (question 2)
		doctor::SID_0529:And there are no other survivors?
	sylcam:CutTo()
	sylvia:PlayAnimBlendOut(syl_talk1,1,1,1)
	doctor:PlayAnimBlendOut(doc_idle3,1,1,1)
		sylvia::SID_0530:Us against the Daleks? They destroyed everything. Everyone. There's just me left.
	amycam:CutTo()
	amy:PlayAnimFacial(amy_shocked,1,1,1)
	--Wait(0.5)	

	--Amy looks in horror at the Doctor...
		amy::SID_0531:The last human being. That's what the Dalek said.
	sylcam:CutTo()
	sylvia:SetFocus(amy_ent)
	sylvia:PlayAnimBlendOut(syl_idle2,1,1,1)
	doctor:PlayAnimBlendOut(doc_idle5,1,1,1)
	--Sylvia manages a weak smile.
		sylvia::SID_0532:Well, it was wrong about that, wasn't it? There's you two.
	
	maincam:CutTo()
	doc_idles:Wake()
	amy_idles:Wake()
	sylvia:ClearFocus()
	
	if not survive_done then
		DecisionManager:AddOption("", "DIALOGUE_SURVIVE", script_node, "AnswerSurvive")
	end
	DecisionManager:AddOption("", "DIALOGUE_IMPOSSIBLE", script_node, "AnswerImpossible")
	DecisionManager:Start()
end

--3)
global function AnswerImpossible()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_negative = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_talk negative 1")	
	local doc_talk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")	
	local doc_talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")
--	local doc_idle2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02")
	local amy_idle3 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle3")
	local syl_talk1 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Talk01")
	local syl_talk2 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Talk02")
--	local syl_idle3 = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_Idle03")					
	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	local cutscene_5_1 = FindNodeByName("cutscene_5_1")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles.script.End()
	amy_idles.script.End()	
	
--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk2,1,1,1)
	--DIALOGUE TREE (question 3)
	--But the Doctor is agitated.
		doctor::SID_0533:The Daleks can't do this. They never had the power to change time like this before. 
	sylcam:CutTo()	
	sylvia:PlayAnimBlendOut(syl_talk2,1,1,1)
--	doctor:PlayAnimBlendOut(doc_idle2,1,1,1)
		sylvia::SID_0534:Change time? What are you talking about? Look, I'm barely hanging on to my sanity as it is.
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_negative,1,1,1)
		doctor::SID_0811:Listen to me, Sylvia. This was not supposed to have happened. 
	doctor:PlayAnimBlendOut(doc_talk3,1,1,1)
		doctor::SID_0812:1963 was followed by 1964 and a whole lot more years after that. 
	doctor:PlayAnimBlendOut(doc_talk2,1,1,1)
		doctor::SID_0535:I have to stop whatever the Daleks have done to make this happen.
	sylcam:CutTo()	
	sylvia:PlayAnimBlendOut(syl_talk1,1,1,1)
	amy:PlayAnimBlendOut(amy_idle3,1,1,1)
		sylvia::SID_0538:Look, it isn't safe to stay here. If you want to stay alive now, you have to keep on the move.
--	sylvia:PlayAnimBlendOut(syl_idle3,1,1,1)
		sylvia::SID_0954:Let me check ahead. These tunnels are dangerous.
	
--	doctor:ClearFocus()
--	amy:ClearFocus()
	sylvia:ClearFocus()

	cutscene_5_1:ClearPause()
end

global function End()
	local cutscene_5_2 = FindNodeByName("cutscene_5_2")

	cutscene_5_2:Trigger()
end
