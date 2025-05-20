global script_node

--4.i
global function warn_about_dark_corridor()
	local doctor = GetActor("doctor")

	--Firecount = 1
	-- Don't trigger this VO again
	--FindNodeByName("warn_about_dark_corridor"):DisableNode()
		
	ShowLetterBox()	
	
	SayPrep("skip","async")
	
	doctor:SetBehaviour("wait")

	-- Look at the corridor
	SetPOIPosAndLookZ(FindNodeByName("warn_about_dark_corridor_cam_loc"))
	BeginPOI(2.0, 7.0, 2.0, true, true)

	--*NEW
	--VO
	doctor::SID_2618:We can get to the Generator through these blue doors, but this corridor is now too dark to safely pass. I'm going to have to boost the lighting somehow.

	Wait(11)
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	
	SaveCheckpoint()	
end

--4.ii
global function back_to_act2_tunnels()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("doc_uturn")

	ShowLetterBox()
	
	LockActorCamera()

	SayPrep("skip","async")

	--Permanant trigger...
	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	--*NEW
	--VO
	doctor::SID_2685:Let's not head back to the TARDIS just yet.

	Wait(2)
	doctor:SetBehaviour("pc")
	FreeActorCamera()
	HideLetterBox()

	--SaveCheckpoint()
end

--4.iii
global function got_past_vashta()
	local doctor = GetActor("doctor")

	--Firecount = 1
	-- Don't trigger this VO again
	--FindNodeByName("got_past_vashta"):DisableNode()

	SayPrep("skip","async")

	--*NEW
	--VO
	doctor::SID_2619:Got here at last. Good old Jones - she's opened the Airlock to the Generator.
	
	FindNodeByName("LightControlLight0_03"):StopTrigger()
	FindNodeByName("Cutscene_5").script.LightOn()
	
	-- save check point is done with light switch safe trigger
end

--6.ii
global function warn_about_flashing_lights()
	local amy = GetActor("amy")
	
	--Firecount = 1
	-- Don't trigger this VO again
	--FindNodeByName("warn_about_flashing_lights"):DisableNode()

	SayPrep("skip", "async")
		
	ShowLetterBox()
	
	-- Look at the corridor
	SetPOIPosAndLookZ(FindNodeByName("warn_about_flashing_lights_cam_loc"))
	BeginPOI(2.0, 5.0, 2.0, true, true)
	
	amy:SetBehaviour("wait")
	
	--*NEW
	--VO
	amy::SID_2620:Oh great, not much of an improvement... the lights are going crazy now!
	
	--*NEW
	--VO
	amy::SID_2621:Come on Amy, just need to stay to the bright bits.
	
	Wait(8)
	amy:SetBehaviour("pc")

	HideLetterBox()

	SaveCheckpoint()
end
