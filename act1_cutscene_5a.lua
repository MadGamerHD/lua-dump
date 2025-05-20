--5a (PASSIVE)
--Played when cars begin talking
--Ends with camera switch to portal over london

local maincam = FindNodeByName("CutSceneCamera_0")
local doccam = FindNodeByName("CutSceneCamera_1")
local amycam = FindNodeByName("CutSceneCamera_2")
local sylcam = FindNodeByName("CutSceneCamera_3")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_concern1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1")
	local doc_concern2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2")
	local doc_positive = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPositive1")
	local amy_idle2 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle2")
	local amy_idle3 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle3")

	SayPrep("skip", "")

	--TEMP
	local amy_loc = FindNodeByName("amy_platform_locator")	
	local syl_loc = FindNodeByName("sylvia_platform_locator")
	amy:Teleport(amy_loc)
	sylvia:Teleport(syl_loc)

	WaitFrame()
	doccam:CutTo()	
	Wait(0.5)

	--CUT SCENE 5a
	--INT. UNDERGROUND TUNNEL -- DAY
	--Camera cuts to platform view
		doctor::SID_0512:Calm down. We're here to help you.
	sylcam:CutTo()
		sylvia::SID_0513:How can I trust you?
	amycam:CutTo()
		amy::SID_0514:Do we look like Daleks? Us humans have to stick together.
	doccam:CutTo()
		doctor::SID_0515:I'm the Doctor by the way.
	amycam:CutTo()
		amy::SID_0516:And I'm Amy.
	sylcam:CutTo()
--	sylvia:SetFocus(amy_ent)

	--Sylvia lowers the pipe 
		sylvia::SID_0517:Sylvia.
	doccam:CutTo()
		doctor::SID_0518:Tell me what happened. When did the Daleks get here?
	sylcam:CutTo()
--	sylvia:SetFocus(doc_ent)

		sylvia::SID_0519:What do you mean? How can't you know? They over ran the Earth. The whole planet.
	amycam:CutTo()
		amy::SID_0520:We've sort of been away.
	maincam:CutTo()
	--Sylvia looks at her like she's hearing things.
		doctor::SID_0521:I promise you Sylvia. We can help you. Just tell us please.
		sylvia::SID_0522:They came out of the sky. Like, like they tore a hole in it.
end

global function End()
	local cutscene_5 = FindNodeByName("cutscene_5")
	cutscene_5:Trigger()
end