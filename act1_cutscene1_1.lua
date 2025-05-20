global function run_cutscene()

	local tardis = FindNodeByTag("whole_of_tardis")
	tardis:Hide()
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:Trigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:Trigger()
	HideFade()
	local ambience = FindNodeByName("ambience_upper_cave")
	ambience:Trigger()	
	local music = FindNodeByName("background_music")
	PlayMusic(music)
	Wait(1.2)
	local audio_tardis = FindNodeByName("audio_tardis_materialising")
	audio_tardis:Trigger()
	Wait(7)
	audio_tardis = FindNodeByName("audio_tardis_open")
	audio_tardis:Trigger()	
	Wait(2)
	audio_tardis = FindNodeByName("audio_tardis_close")
	audio_tardis:Trigger()
	Wait(1)
	local tardis = FindNodeByTag("whole_of_tardis")
	tardis:Show()	
	Wait(8.5)
	local audio_icequake = FindNodeByName("audio_icequake")
	audio_icequake:Trigger()	
	
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")


	local tardis = FindNodeByTag("whole_of_tardis")
	tardis:Show()

	local amy_loc = FindNodeByName("loc_cutscene1_1_amy_end")
	local doc_loc = FindNodeByName("loc_cutscene1_1_doc_end")
	doctor:Teleport(doc_loc)
	amy:Teleport(amy_loc)
	
	local chisholm_circle = FindNodeByName("EM_ENTITY_Interact_Disc_Chisholm")
	chisholm_circle:StopTrigger()

	HideLetterBox()
	doctor:SetBehaviour("pc")
	FindNodeByName("lua_amy_cutscene_idles"):Wake()
--	--adds new objective
--	AddGlobalObjective("Cyber_1_1")
--	--turns objective to complete
--	SetGlobalObjectiveState("Cyber_1_1_1", 2) -- 2 is unlock, 3 is done

        local chisholm = GetActor("chisholm")
        local anim = FindNodeByTag("Chisholm_Anim_Unconcious")
        chisholm:PlayAnim(anim ,1,0)
        --chisholm:DisableAnimLoop()
        
--        local redundant_actors = FindNodeByName("ChisholmGary_Actor")
--	redundant_actors:StopTrigger()
--	redundant_actors = FindNodeByName("ChisholmPat_Actor")
--	redundant_actors:StopTrigger()
	
	local tutorial = FindNodeByName("script_act1_tutorials")
	tutorial:Trigger()
	

	
	
	


	
end