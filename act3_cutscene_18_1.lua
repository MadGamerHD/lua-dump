--18.1
--plays when vis rec picked up
--ends and play shifts to amy

global script_node

global function Start()
	local doctor = GetActor("doctor")
	local varga = FindNodeByTag("temp_varga")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
		
	varga:StopTrigger()	
	sonic:SyncDataFromDef()	
	sonic:Trigger()
	
	SayPrep("skip", "")
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_loc1 = FindNodeByName("reciever_doc_door")
	local amy_loc = FindNodeByName("reciever_amy_door")
	local vis_rec = FindNodeByShortName("EM_ANIMATOR_vis_reciever:0")
	local vis_door = FindNodeByShortName("EM_ANIMATOR_corridor_doors1:0")
	local varga = FindNodeByTag("temp_varga")
	local chronon = FindNodeByTag("Chronon")
	local theme = FindNodeByName("dalek_city_theme_def")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
	local endscript = FindNodeByName("cutscene_18_1_end")
	local dalek_door = FindNodeByShortName("EM_ENTITY_dalek_door:0")
	local dalek_door1 = FindNodeByShortName("EM_ENTITY_dalek_door1:0")
	
	PlayMusic(theme)
	
	chronon:SyncDataFromDef()
	sonic:StopTrigger()
	
	doctor:Teleport(doc_loc1)
	amy:Teleport(amy_loc)
	
	vis_rec:StopTrigger()
	vis_door:StopTrigger()
	dalek_door:StopTrigger()
	dalek_door1:StopTrigger()
	varga:Trigger()
	
	HideLetterBox()

	amy:SetBehaviour("pc")

	SetGlobalObjectiveState("Dalek_3_3", 3)
	AddGlobalObjective("Dalek_3_4")
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
	endscript.script.TurnStart()
end

