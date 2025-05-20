global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("CS14_music")
	
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")

	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")
	local chisholm_model = FindNodeByTag("chisholm")
	local ambience1 = FindNodeByName("ambience_control_room")
	local ambience2 = FindNodeByName("ambience_tunnels")
	local doc_point = FindNodeByName("loc_cs13_doc2")
	local amy_point = FindNodeByName("loc_cs13_amy2")
	local chisholm_point = FindNodeByName("loc_cs13_chisholm2")
	local music = FindNodeByName("music_chase_def")
	local lift_control = FindNodeByName("int_lift_control")
	local alarm = FindNodeByName("audio_mothership_alarm")
	local panel_f_script = FindNodeByName("script_lift_panel_f")
	local panel_h_script = FindNodeByName("lift_panel_h_script")
	local script_lift_control = FindNodeByName("script_lift_control")
	local stop_trigger1 = FindNodeByName("Trigger_not_done_yet")
	local stop_trigger2 = FindNodeByName("Trigger_go_back_to_lift")
	local stop_trigger3 = FindNodeByName("control_room_block")
	local stop_trigger4 = FindNodeByName("wrong_way_trigger")
	local escape_trigger = FindNodeByName("escape_off_lift")
	local time = FindNodeByName("self_destruct_time")
	local int_chis = FindNodeByName("int_chis")
	
	panel_f_script.script.cutscene_14_played = true
	panel_h_script.script.cutscene_14_played = true
	script_lift_control.script.cutscene_14_played = true		
	
	local lift_volume = FindNodeByName("trigger_get_companions_in_place")
	lift_volume:Trigger()

	--escape without amy
	stop_trigger1:StopTrigger()
	--go back into tunnels
	stop_trigger2:Trigger()
	--go back inot control room
	stop_trigger3:Trigger()
	--first guard wrong way trigger
	stop_trigger4:StopTrigger()
	--follow after lift
	escape_trigger:Trigger()
	--main way out
	lift_control:Trigger()	
	--interact chisholm
	int_chis:Trigger()
	--destruct timeline
	time:Trigger()
	--control room	
	ambience1:StopTrigger()
	--tunnels
	ambience2:Trigger()
	--beep beep
	alarm:Trigger()
	--chase
	PlayMusic(music)

	HideLetterBox()
	
	chisholm_model:Trigger()	
	doctor:Teleport(doc_point)
	amy:Teleport(amy_point)
	amy:EnablePhysics()
	chisholm:Teleport(chisholm_point)
	
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy:SetFollowDistance(2)
	chisholm:SetTarget(doctor)
	chisholm:SetBehaviour("follow")
	chisholm:SetFollowDistance(3)

	--Reconfig controls
	SetGlobalObjectiveState("Cyber_3_6_1", 3) --done
	SetGlobalObjectiveState("Cyber_3_6_2", 3) --done

	--Adds new objective
	--Get out of the base
	AddGlobalObjective("Cyber_3_7")
	-- Get back to the lift
	SetGlobalObjectiveState("Cyber_3_7_1", 2) -- 2 is unlock, 3 is done

	doctor:SetBehaviour("pc")
end