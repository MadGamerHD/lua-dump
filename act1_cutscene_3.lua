--3
--played on interaction with taxi
--ends and player enters subway

global function Start()
	local music = FindNodeByName("music_3")

	SayPrep("skip", "")
	ShowLetterBox()
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_loc  = FindNodeByName("station_end_doc")
	local amy_loc = FindNodeByName("station_end_amy")
	local interact_barrier = FindNodeByName("interactable_barrier")
	local taxi_front = FindNodeByName("car_push_interactable")
	local taxi_back = FindNodeByName("car_boot_interactable")
	local taxi_crashed = FindNodeByName("car_crash_interactable")
	local traf_amb = FindNodeByName("traf_amb")
	local sub_amb = FindNodeByName("sub_amb")
	local music = FindNodeByName("Underground")
	
	PlayMusic(music)
	
	traf_amb:StopTrigger()
	sub_amb:Trigger()
	
	doctor:Teleport(doc_loc)
	doctor:SetBehaviour("pc")

	ClearCallbacks()
	amy:SetTarget(doctor:GetTransform())
	amy:Teleport(amy_loc)
	amy:SetBehaviour("follow")
	amy:EnablePhysics()

	interact_barrier:StopTrigger()
	taxi_front:StopTrigger()
	taxi_back:StopTrigger()
	taxi_crashed:Trigger()

	HideLetterBox()

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)

	SetGlobalObjectiveState("Dalek_1_1_1", 3)
	SetGlobalObjectiveState("Dalek_1_1_2", 3)
	SetGlobalObjectiveState("Dalek_1_1_3", 2)
	
	--VO
	--TEMP moved to in game dialogue
		doctor::SID_0499:The platform must be up ahead. But we're going to have to get through that gate to get to it.
end