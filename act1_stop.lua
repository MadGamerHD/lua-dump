global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local sylvia = GetActor("sylvia")
	local lookat = FindNodeByName("track_lookat")
	local position = FindNodeByName("track_position")
	local doc_loc = FindNodeByName("doc_loc")
	local amy_loc = FindNodeByName("amy_loc")
	local doc_talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")
	local music = FindNodeByName("add2")

	SayPrep("skip", "")
	ShowLetterBox()

	doctor:DisableStealth()
	doctor:SetBehaviour("wait")
	doctor:SetTarget(doc_loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	amy:DisableStealth()
	amy:SetTarget(amy_loc)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(2, 5, 2, true, true)
	
	Wait(0.5)
	PlayMusic(music)
--	ADD ANIM Sylvia talk forceful

	--CUT SCENE 6
	--INT. UNDERGROUND TUNNEL. FUSE BOX -- DAY
	--Sylvia waits by the fusebox	
		sylvia::SID_0788:Stop! The track is electrified... 
	doctor:PlayAnimBlendOut(doc_talk3,1,1,1)
		doctor::SID_0789:Then we need to reroute the power somehow. And fast.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("Underground")
	PlayMusic(music)

	SayPrep("skip", "")
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	
	SetGlobalObjectiveState("Dalek_1_3_1", 3)
	SetGlobalObjectiveState("Dalek_1_3_2", 2)
end