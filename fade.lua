global script_node

global function Taxi()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_start = FindNodeByName ("doc_start")
	local amy_start = FindNodeByName ("amy_start")
	local doc_push = FindNodeByName ("doc_push")
	local amy_push_loc = FindNodeByName ("amy_push")
	local doc_slope = FindNodeByName ("doc_slope")
	local amy_slope = FindNodeByName ("amy_slope")
	local doctor_idle2 = FindNodeByPartialName("Anim_DRW_Idle02")
	local doc_idle1 = FindNodeByPartialName("Anim_DRW_Idle01")
	local amy_idle1 = FindNodeByPartialName("Anim_AMY_Idle1")
	local sid0009 = FindNodeByPartialName("Anim_DRW_E2_SID0009")
	local sid0012 = FindNodeByPartialName("Anim_DRW_E2_SID0012")
	local timeline = FindNodeByName("car_crash_time")

	SayPrep("skip", "")

	ClearCallbacks() 
	timeline:PauseAt(32.99)
	StopMusic();
	ShowLetterBox()

	doctor:SetBehaviour("wait")	
	doctor:EnablePhysics()
	doctor:DisableWalls()
	doctor:Teleport(doc_start)
	amy:SetBehaviour("wait")
	amy:EnablePhysics()
	amy:DisableWalls()
	amy:Teleport(amy_start)
	
	doctor:SetTarget(doc_push)
	doctor:SetMaxSpeed(2)
	doctor:SetBehaviour("move")
	
	--CUT SCENE 3
	--EXT. RUINED LONDON -- DAY
	--Doctor assesses the taxi.
--		doctor::SID_0018:This looks like it could smash through that barrier.
	doctor:PlayAnimBlendOut(sid0009,1,2,1)
--		doctor::SID_0009:Amy, can you give me a hand?
	doctor:PlayAnimBlendOut(doctor_idle2,1,1,1)
--		amy::SID_0007:Sure
	amy:SetTarget(amy_push_loc)
	amy:SetMoveTime(1.5)
	amy:SetBehaviour("move")

	Wait(2.5)
--		doctor::SID_0014:Right then, on three.
		--doctor::SID_0015:1...
		--doctor::SID_0016:2...
		--doctor::SID_0017:3...
	Wait(3.5)
	--doc, amy push, taxi anim...

	Wait(5)	
	--Bang!
	--play particles
	doctor:PlayAnimBlendOut(doc_idle1,1,0.5,0.5)
	amy:PlayAnimBlendOut(amy_idle1,1,0.5,0.5)
	
	Wait(4)
	doctor:PlayAnimBlendOut(sid0012,1,1,1)
	--As The Doctor and Amy stand clear, the taxi rolls down the slope and crashes through the barricade.	
--		doctor::SID_0012:Well, not exactly elegant. But it did the job.
	
	--walk down slope
	amy:SetTarget(amy_slope)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	Wait(0.2)
	doctor:SetTarget(doc_slope)
	doctor:SetMoveTime(3)
	doctor:SetBehaviour("move")
	Wait(2)

	timeline:ClearPause()
end

global function Entrance()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_ent = FindNodeByName("doc_ent")
	local amy_ent = FindNodeByName("amy_ent")
	local doc_steps = FindNodeByName("doc_steps")
	local amy_steps = FindNodeByName("amy_steps")
	local timeline = FindNodeByName("car_crash_time")
	local sid0010 = FindNodeByPartialName("Anim_DRW_E2_SID0010")

	timeline:PauseAt(48)
	
	--cut to barrier
	doctor:SetBehaviour("wait")
	doctor:Teleport(doc_ent)
	amy:SetBehaviour("wait")
	amy:Teleport(amy_ent)

	
	Wait (1)
	--As they approache the opening. Darkness beyond.
--		amy::SID_0004:It's dark down there. When I said I wanted to meet the Beatles I meant the band, not the bugs.
	doctor:PlayAnimBlendOut(sid0010,1,1,1)	
--		doctor::SID_0010:Or you can stay up here and meet the Daleks. But they're more heavy metal.
	--add fear and set focus 
	Wait(4)
	
	--walk down steps
	doctor:SetTarget(doc_steps)
	doctor:SetMoveTime(3)
	doctor:SetBehaviour("move")
	Wait(0.5)
	amy:SetTarget(amy_steps)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	
	ShowFade()
	timeline:ClearPause()
end

global function Underground()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_pos1 = FindNodeByName ("station_start_doc")
	local amy_pos1 = FindNodeByName ("station_start_amy")
	local doc_pos2 = FindNodeByName("station_end_doc")
	local amy_pos2 = FindNodeByName("station_end_amy")
	local timeline = FindNodeByName("car_crash_time")
	local subwayArea = FindNodeByName("EmArea_Uid_EM_AREA_Station:0")
	local traf_amb = FindNodeByName("traf_amb")
	local sub_amb = FindNodeByName("sub_amb")

	traf_amb:StopTrigger()	
	sub_amb:Trigger()
	timeline:PauseAt(56)

	doctor:SetBehaviour("wait")	
--	doctor:GetTransform():SetNodeParent( subwayArea )
	doctor:Teleport(doc_pos1)
	
	amy:SetBehaviour("wait")
--	amy:GetTransform():SetNodeParent( subwayArea )
	amy:Teleport(amy_pos1)

	doctor:SetTarget(doc_pos2)
	doctor:SetMoveTime(3)
	doctor:SetBehaviour("move")
	amy:SetTarget(amy_pos2)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")

	Wait(0.5)
	HideFade()

	Wait(1)
	--CUT TO:
	--INT. UNDERGROUND TUNNEL -- DAY
--		doctor::SID_0499:The platform must be up ahead. But we're going to have to get through that gate to get to it.
	
	Wait(2.5)
	timeline:ClearPause()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local interact_barrier = FindNodeByName("interactable_barrier")

	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetBehaviour("follow")
	amy:EnablePhysics()
	amy:SetTarget(doctor)

	interact_barrier:StopTrigger()
	SetGlobalObjectiveState("Dalek_1_1_1", 3)
	SetGlobalObjectiveState("Dalek_1_1_2", 3)
	SetGlobalObjectiveState("Dalek_1_1_3", 2)
end
