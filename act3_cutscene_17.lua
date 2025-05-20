--17
--plays when doctor uses sonic on gen console
--ends and players exit chamber

global function Start()
	local doctor = GetActor("doctor")
	local music = FindNodeByName("music_17")

	SayPrep("skip", "")
	doctor:SetBehaviour("wait")
	PlayMusic(music)

	ShowLetterBox()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local object_states = FindNodeByName("object_states_script")
	local exit_council_trigger = FindNodeByName("exit_council_trigger")
	local gens_off = FindNodeByName("gens_off")
	local gens_on = FindNodeByName("gens_on")
	local controls_off = FindNodeByShortName("EM_ENTITY_unit_off:0")
	local controls_on = FindNodeByShortName("EM_ENTITY_unit_on:0")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
	local electric = FindNodeByShortName("EM_ENTITY_Connective_Electric:0")
	local chronon = FindNodeByTag("Chronon")
	local doc_loc = FindNodeByName("cs17_doc")
	local amy_loc = FindNodeByName("cs17_amy")
	local theme = FindNodeByName("dalek_city_theme_def")
	
	PlayMusic(theme)
	
	chronon:SyncDataFromDef()

	object_states.script.DebrisState = 3	
	object_states.script.GeneratorState = 2
	exit_council_trigger:StopTrigger()
	gens_off:Trigger()
	gens_on:StopTrigger()
	controls_off:Trigger()
	controls_on:StopTrigger()
	sonic:StopTrigger()
	electric:StopTrigger()
	
	doctor:Teleport(doc_loc)
	doctor:SetBehaviour("pc")

	amy:Teleport(amy_loc)
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy:StartInvisibilityFading(7,2,1,0.2)
	
	HideLetterBox()

	SetGlobalObjectiveState("Dalek_3_1_2", 3)
	AddGlobalObjective("Dalek_3_2")

	FindNodeByName("lua_transition").script.BlackScreen(2)
	
	--VO
	--Extra info for the player after cut scene 17
		doctor::SID_1295:I need to check out what the Daleks are up to. I have to get to the Visualiser Room, to see what I can see.
end
