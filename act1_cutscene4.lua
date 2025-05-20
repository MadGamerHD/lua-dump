

global function run_cutscene()
	--ShowFade()
	Wait(1.0)
	--HideFade()
	local chisholm=GetActor("chisholm")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	chisholm:SetBehaviour("wait")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	
	local ambience = FindNodeByName("ambience_upper_cave")
	ambience:Trigger()	
	local ambience = FindNodeByName("ambience_far_cave")
	ambience:StopTrigger()
	
	local music = FindNodeByName("CS4_music")
	PlayMusic(music)	
	Wait(33)	
	ShowFade()

end

global function end_cutscene()
	local chisholm=GetActor("chisholm")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	local loc_node =FindNodeByName("loc_cs4_doc_end")
	doctor:Teleport(loc_node)
	local amy_node =FindNodeByName("loc_cs4_amy_end")
	amy:Teleport(amy_node)
	local chisholm_node =FindNodeByName("loc_cs4_chisholm_end")
	chisholm:Teleport(chisholm_node)

	chisholm:SetBehaviour("wait")
        local anim = FindNodeByTag("Chisholm_Anim_Unconcious")
        chisholm:PlayAnim(anim ,1,0)
        
        local chisholm_circle = FindNodeByName("EM_ENTITY_Interact_Disc_Chisholm")
	chisholm_circle:StopTrigger()
	
       -- chisholm:DisableAnimLoop()
       WaitFrame()
       WaitFrame()
       WaitFrame()
       HideFade()

	local music = FindNodeByName("background_music")
	PlayMusic(music)

	--Find another way up
	SetGlobalObjectiveState("Cyber_1_4_1", 3) -- 2 is unlock, 3 is done
	--Make sure CHisholm can follow
	SetGlobalObjectiveState("Cyber_1_4_2", 3) -- 2 is unlock, 3 is done
	--find out where Chisholm came from

	local SatNav = FindNodeByName("SatNav")
	if (amy:IsInventoryItem(SatNav)) or (doctor:IsInventoryItem(SatNav)) then
		local satnav_cutscene = FindNodeByName("talk_about_satnav_cs4_1")
		satnav_cutscene:Trigger()
	else
		local satnav_cutscene = FindNodeByName("talk_about_satnav_cs4_2")
		satnav_cutscene:Trigger()
	end
end