--18
--plays when use sonic on vis console
--ends and player must pick up vis rec

global function Start()
	local doctor = GetActor("doctor")
	local varga = FindNodeByTag("temp_varga")
	local music = FindNodeByName("music_18")
	local vis_rec = FindNodeByTag("vis_rec")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")	
	
	vis_rec:Trigger()
	varga:StopTrigger()
	sonic:SyncDataFromDef()
	sonic:Trigger()
	PlayMusic(music)
	
	SayPrep("skip", "")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
end

global function End()
	local doctor = GetActor("doctor")
	local con_off = FindNodeByShortName("EM_ENTITY_vis_console_1a:0")
	local con_on = FindNodeByShortName("EM_ENTITY_vis_console_1:0")
	local vis_eye_open = FindNodeByShortName("EM_ENTITY_eye:0")
	local vis_eye_closed = FindNodeByShortName("EM_ENTITY_eye_knackered:0")
	local varga = FindNodeByTag("temp_varga")
	local chronon = FindNodeByTag("Chronon")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
	local theme = FindNodeByName("dalek_city_theme_def")
	local object_states = FindNodeByName("object_states_script")
	
	PlayMusic(theme)
	
	object_states.script.DebrisState = 4	
	
	chronon:SyncDataFromDef()
	sonic:StopTrigger()
	
	doctor:SetBehaviour("pc")

	vis_eye_open:StopTrigger()
	vis_eye_closed:Trigger()
	con_on:StopTrigger()
	con_off:Trigger()	
	varga:Trigger()
		
	HideLetterBox()
	
	SetGlobalObjectiveState("Dalek_3_2_2", 3)
	AddGlobalObjective("Dalek_3_3")

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
end