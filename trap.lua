global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_trap_loc = FindNodeByName("doc_trap_loc")
	local amy_trap_loc = FindNodeByName("amy_trap_loc")
	local sylvia_trap_loc = FindNodeByName("sylvia_trap_loc")
	local lookat = FindNodeByName("track_lookat")
	local position = FindNodeByName("track_position")
	local sparks = FindNodeByShortName("EM_ENTITY_ElectricRails:0")
--	local crackles = FindNodeByName("crackles_audio")
	local music = FindNodeByName("add1")
	
	SayPrep("skip", "")
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	doctor:SetTarget(doc_trap_loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	amy:SetTarget(amy_trap_loc)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	
	sylvia:SetTarget(sylvia_trap_loc)
	sylvia:SetMoveTime(1)
	sylvia:SetBehaviour("move")
	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(2, 4, 2, true, true)
	
	Wait(1)
	PlayMusic(music)
	
	Wait(1)
	sparks:StopTrigger()
--	crackles:StopTrigger()
	
	--CUT SCENE 6.1
	--INT. UNDERGROUND TUNNEL. FUSE BOX -  DAY
	--Electrified rail tracks lose power.
		doctor::SID_0790:Now it's safe. We'd better get a move on before that Dalek spots us.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia_script = FindNodeByName("sylvia_hints")
	local music = FindNodeByName("Underground")
	PlayMusic(music)

	HideLetterBox()
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")

	amy:EnablePhysics()
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")

	RunAsync(sylvia_script, "RunToEscape")
	
	SetGlobalObjectiveState("Dalek_1_3_2", 3)
end
