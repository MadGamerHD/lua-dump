--see 'Use' grilldoor

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
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")
	local doc_wall = FindNodeByName("doctor_wall_locator")
	local amy_wall = FindNodeByName("amy_wall_locator")
	local syl_wall = FindNodeByName("sylvia_wall_locator")
	local doc_corridor = FindNodeByName("doctor_corridor_locator")
	local amy_corridor = FindNodeByName("amy_corridor_locator")
	local doc_platform = FindNodeByName("doctor_platform_locator")
	local amy_platform = FindNodeByName("amy_platform_locator")	
	local syl_platform = FindNodeByName("sylvia_platform_locator")
--	local grilldoor_open = FindNodeByName("grilldoor_open_script")
	local grilldoor = FindNodeByShortName("EM_ENTITY_grilldoor:0")
	local sylvia_timeline = FindNodeByName("sylvia_timeline")
	local subwayArea = FindNodeByName("EmArea_Uid_EM_AREA_Station:0")
--	local doc_180 = FindNodeByShortName("EM_ANIMATOR_Anim_DRW_TurnLeft180")
	local doc_concern1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1")
	local doc_concern2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2")
	local doc_positive = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPositive1")
--	local amy_180 = FindNodeByShortName("EM_ANIMATOR_Anim_AMY_TurnRight180")
	local amy_idle2 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle2")
	local amy_idle3 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle3")
	local syl_threat = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_ThreatWithPipeIdle")
	local syl_droppipe = FindNodeByShortName("EM_ANIMATOR_Sylvia_Anim_SYL_ThreatWithPipeToIdle")
--	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
--	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
--	local common_callbacks = FindNodeByName("common_callbacks_script")
	
	SayPrep("skip", "")
	CutToLetterBox()

------ACTIVE

	--until end of dialogue
	sylvia_timeline:PauseAt(72.49)

	sylvia:GetTransform():Trigger()
	sylvia:DisablePhysics()	
	
	sylvia:SetBehaviour("wait")	
--	sylvia:GetTransform():SetNodeParent( subwayArea )
	sylvia:Teleport(syl_platform)
	sylvia:EnablePhysics()
	
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(doc_corridor)
	doctor:EnablePhysics()
	amy:DisablePhysics()
	amy:Teleport(amy_corridor)
	amy:EnablePhysics()

	--camera cuts to platform	
	--doctor uses sonic screwdriver anim, sound and fx
	Wait(2)
	grilldoor:StopTrigger()
--	grilldoor_open.script.Open()
--	doctor:SetFocus(amy_ent)

	--CUT SCENE 4
	--INT. UNDERGROUND TUNNEL -- DAY
	--The Doctor uses the Sonic on a grill door and it opens.	
	--	doctor::SID_0507:Be careful down here. You never know what you're going to find on the Underground. Rats, dinosaurs, yetis...
--	amy:SetFocus(doc_ent)
		
	--REDUNDANT (see below)
		--amy::SID_0508:Has anyone ever said you can be hard to please?

--	doctor:ClearFocus()
--	amy:ClearFocus()
	
	doctor:SetTarget(doc_platform)
	doctor:SetMoveTime(4.5)
	doctor:SetBehaviour("move")
	Wait(0.2)
	amy:SetTarget(amy_platform)
	amy:SetMoveTime(4.5)
	amy:SetBehaviour("move")
	--They proceed onto the platform.
	--	doctor::SID_0509:The woman we saw must be around here somewhere...

--	sylvia:SetFocus(doc_ent)

	Wait(1)
	doctor:SetTarget(sylvia)
	doctor:Face(1, "sine")
	amy:SetTarget(sylvia)
	amy:Face(1, "sine")
		
	--Camera cuts to Sylvia view.
	--Sylvia brandishes a pipe.
	--	sylvia::SID_0510:Don't move!
	--The Doctor and Amy turn to see Sylvia, as defiant as the moment she blew up the Dalek.
	--	doctor::SID_0511:Ah - there you are. Hello.

	SetGlobalObjectiveState("Dalek_1_1_3", 3)
	AddGlobalObjective("Dalek_1_2")
	
	doctor:PlayAnimBlendOut(doc_concern1,1,1,1)
--	common_callbacks.script.BlendOutAnim(doctor, 1)

------PASSIVE
	
	--CUT SCENE 5
	--INT. UNDERGROUND TUNNEL -- DAY
	--Camera cuts to platform view
--		doctor::SID_0512:Calm down. We're here to help you.
	sylcam:CutTo()
	sylvia:PlayAnimBlendOut(syl_threat,1,1,1)	
--		sylvia::SID_0513:How can I trust you?
	amycam:CutTo()
	amy:PlayAnimBlendOut(amy_idle2,1,1,1)
--		amy::SID_0514:Do we look like Daleks? Us humans have to stick together.
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_positive,1,1,1)
--		doctor::SID_0515:I'm The Doctor by the way.
	amycam:CutTo()
--	ADD ANIM amy positive

--		amy::SID_0516:And I'm Amy.
	sylcam:CutTo()
--	sylvia:SetFocus(amy_ent)
	sylvia:PlayAnimBlendOut(syl_droppipe,1,1,1)
	--Sylvia lowers the pipe 
--		sylvia::SID_0517:Sylvia.
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_concern2,1,1,1)
--		doctor::SID_0518:Tell me what happened. When did the Daleks get here?
	sylcam:CutTo()
--	sylvia:SetFocus(doc_ent)
	--	ADD ANIM sylvia confused

--		sylvia::SID_0519:What do you mean? How can't you know? They over ran the Earth. The whole planet.
	amycam:CutTo()
	amy:PlayAnimBlendOut(amy_idle3,1,1,1)
--		amy::SID_0520:We've sort of been away.
	maincam:CutTo()
	doctor:PlayAnimBlendOut(doc_concern1,1,1,1)
--	ADD ANIM sylvia reminising

	--Sylvia looks at her like she's hearing things.
--		doctor::SID_0521:I promise you Sylvia. We can help you. Just tell us please.
--		sylvia::SID_0522:They came out of the sky. Like they tore a hole in it.

	Wait(0.5)
	doctor:Teleport(doc_wall)
	amy:Teleport(amy_wall)
	sylvia:Teleport(syl_wall)

------ACTIVE
	
	--CUT TO:
	--EXT. LONDON SKY (MATTE) -- DAY
	--A portal opens in the sky. It's like a tear in the fabric of reality.
	--	sylvia::SID_0523:Legions of Daleks flying out of it. So many they turned the sky dark.
	--Legions of DALEKS flying out of the portal, across the sky...
	--	sylvia::SID_0524:Thousands of them. Thousands and thousands.
	--A CLOSE-UP of one of the hovering  Daleks - coming right into camera.
	--It fires. A flash of blinding, deadly light.
	--	dalek::SID_0856:Exterminate!	

------PASSIVE
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
--	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	
	survive_done = true

--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
--	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_concern2,1,1,1)
	--CUT SCENE 5.1
	--INT. UNDERGROUND TUNNEL  DAY
	--Sylvia with pipe dropped, she (leans) against the wall, physically and mentally exhausted.
	--The Doctor and Amy stand around her.
	--DIALOGUE TREE (question 1)
	--The Doctor is thinking hard, grim
--		doctor::SID_0525:How did you survive?
	sylcam:CutTo()	
--	ADD ANIM sylvia explaining

--		sylvia::SID_0526:The Daleks defeated the army straight away, but the ordinary people still fought for while...
--		sylvia::SID_0527:You learn fast when you have to.
	amycam:CutTo()
	amy:PlayAnimBlendOut(amy_happy,1,1,1)
--		amy::SID_0528:Well, looks like you've done pretty well on your own. One woman army.
	maincam:CutTo()
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
	local amy_shocked = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_EXP_Shocked")
--	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
--	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	
	others_done = true

--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
--	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk1,1,1,1)
	--DIALOGUE TREE (question 2)
--		doctor::SID_0529:And there are no other survivors?
	sylcam:CutTo()
--	ADD ANIM sylvia unhappy
	
--		sylvia::SID_0530:Us against the Daleks? They destroyed everything. Everyone. There's just me left.
	amycam:CutTo()
	amy:PlayAnimBlendOut(amy_shocked,1,1,1)
	--Amy looks in horror at the Doctor...
--		amy::SID_0531:The last human being. That's what the Dalek said.
	sylcam:CutTo()
--	sylvia:SetFocus(amy_ent)
	--	ADD ANIM sylvia happy

	--Sylvia manages a weak smile.
--		sylvia::SID_0532:Well, it was wrong about that, wasn't it? There's you two.
	
	maincam:CutTo()
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
	local dalek = GetActor("dalek")
	local dalek3 = GetActor("dalek3")
	local dalek4 = GetActor("dalek4")
	local doctor_drop_locator = FindNodeByName("doctor_drop_locator")
	local amy_drop_locator = FindNodeByName("amy_drop_locator")
	local sylvia_drop_locator = FindNodeByName("sylvia_drop_locator")
	local sylvia_fusebox_locator = FindNodeByName("sylvia_fusebox_locator")
	local sylvia_timeline = FindNodeByName("sylvia_timeline")
	local doc_forceful = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkForcefully")	
	local doc_negative = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_talk negative 1")	
	local doc_talk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")	
	local doc_talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")	
--	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")
--	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy:0")
--	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	
--	doctor:SetFocus(syl_ent)
--	amy:SetFocus(syl_ent)
--	sylvia:SetFocus(doc_ent)
	
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk2,1,1,1)
	--DIALOGUE TREE (question 3)
	--But the Doctor is agitated.
--		doctor::SID_0533:The Daleks can't do this. They never had the power to change time like this before. 
	sylcam:CutTo()	
--	ADD ANIM sylvia unhappy

--		sylvia::SID_0534:Change time? What are you talking about? Look, I'm barely hanging on to my sanity as it is.
	doccam:CutTo()
	doctor:PlayAnimBlendOut(doc_negative,1,1,1)
--		doctor::SID_0811:Listen to me, Sylvia. This was not supposed to have happened. 
	doctor:PlayAnimBlendOut(doc_talk3,1,1,1)
--		doctor::SID_0812:Nineteen sixty three was followed by nineteen sixty four and a whole lot more years after that. 
	doctor:PlayAnimBlendOut(doc_forceful,1,1,1)
--		doctor::SID_0535:I have to stop whatever the Daleks have done to make this happen.
	sylcam:CutTo()	
--	ADD ANIM sylvia talk concerned

--		sylvia::SID_0538:Look, it isn't safe to stay here. If you want to stay alive now, you have to keep on the move.
	--*EDIT split from previous line to fit on screen.
--		sylvia::SID_0954:Let me check ahead. These tunnels are dangerous.

	--play dalek audio
	sylvia_timeline:ClearPause()
	maincam:CutTo()
	
	dalek4:GetTransform():Trigger()
	dalek4:DisablePhysics()	
	dalek3:GetTransform():Trigger()
	dalek3:SetBehaviour("wait")
	dalek3:DisablePhysics()	
		
	doctor:Teleport(doctor_drop_locator)
	amy:Teleport(amy_drop_locator)
	sylvia:Teleport(sylvia_drop_locator)	

-------ACTIVE
		
	--CUT SCENE 5.2
	--Cut to Dalek shadow camera
	--Noise heard, then Daleks appear.
--		amy::SID_0537:What was that? 
	--As Daleks appear further down the tunnel. The Doctor and Amy pull back behind cover.
--		doctor::SID_0955:I think it just got even more dangerous.

	sylvia:SetTarget(sylvia_fusebox_locator)
	sylvia:SetMoveTime(10)
	sylvia:SetBehaviour("move")
	--Anim play slump idle on completion

	--CUT TO:
	--INT. UNDERGROUND TUNNEL -- CONTINUOUS
	--Sylvia has run to fuse box, player follows but approaching Dalek blocks their path.
--		doctor::SID_0539:Sylvia is safe, the Daleks can't see her. But we're going to have to be very careful if we're going to get to her.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalek3 = GetActor("dalek3")

	SayPrep("skip", "")
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	dalek3:SetBehaviour("patrol")
	doctor:EnablePhysics()
	amy:EnablePhysics()
	dalek3:EnablePhysics()
	doctor:EnableStealth()
	amy:EnableStealth()
	
	SetGlobalObjectiveState("Dalek_1_2", 3)
	AddGlobalObjective("Dalek_1_3")
end

global function Temp()
	local amy = GetActor("amy")
	
	--REDUNDANT
		--amy::SID_0508:Has anyone ever said you can be hard to please?
end
