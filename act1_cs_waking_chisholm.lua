global script_node



global function run_cutscene()
	local doctor = GetActor("doctor")
	local chisholm = GetActor("chisholm")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	
	
	local doctor_locator = FindNodeByName("loc_cs_waking_doc_1")
	doctor:SetTarget(doctor_locator)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	Wait(1)
	
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_IdletoKneel") --1.4s
	doctor:PlayAnimAndWait(anim, 1, 0.1)

	
	local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_KneelIdle") --1.8s loop
	doctor:PlayAnim(doctor_crouch,1,0.5)
	

	

	
	SayPrep("skip", "async")
	--CUT SCENE 2.2
	--ICE CAVE - REVIVING CHISHOLM
	doctor::SID_0112:Here you go. Get some warmth into you.
	
	local caddie_prop = FindNodeByName("Caddie_prop")
	local caddie_entity = FindNodeByName("Caddie_entity")
	local caddie_anim = FindNodeByShortName("EM_ANIMATOR_Caddie_Anim_CAD_KneelpourCaddie") --5.43s
	caddie_prop:PlayAnim(caddie_anim, 1, 0)
	caddie_entity:Show()	
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_KneelpourCaddie") --5.43s
	local caddie_audio = FindNodeByName("audio_chisholm_drinks")
	caddie_audio:Trigger()
	
	doctor:PlayAnimAndWait(anim, 1, 0.1)	
	caddie_entity:Hide()
	local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_KneelIdle") --1.8s loop
	doctor:PlayAnim(doctor_crouch,1,0.5)

	

	
	local chisholm = GetActor("chisholm")
	--Wait(1)
	local chs_anim = FindNodeByShortName("EM_ANIMATOR_Chisholm_Anim_CHS_ReviveAndSitUp")
	--chisholm:PlayAnimAndWait(chs_anim ,1,0)
	chisholm:PlayAnim(chs_anim ,1,0)
	Wait(3.96)
	
	--local chisholm_point = FindNodeByName("loc_cs_waking_chisholm1")
	--chisholm:Teleport(chisholm_point)
	local chs_anim = FindNodeByShortName("EM_ANIMATOR_Chisholm_Anim_CHS_SitIdle")
	chisholm:PlayAnim(chs_anim ,1,0.2)
	
		local loc_doc_focus = FindNodeByName("loc_cs_waking_doc_focus1")
	doctor:SetFocus(loc_doc_focus)
	
	--Wait(1)
	local loc_chis_focus = FindNodeByName("loc_cs_waking_chisholm_focus1")
	chisholm:SetFocus(loc_chis_focus)
	SayPrep("skip", "")
	--Chisholm wakes and sits up. He is confused and scared.
	chisholm::SID_0113:...Where am I?
	

	
	SayPrep("skip", "async")
	
	doctor::SID_0114:You fell. Looks like your ankle is sprained. But I'll soon get you out of here, don't worry.
	Wait(2.5)
	local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_KneeltoIdle") --1.63s
	doctor:PlayAnimAndWait(doctor_crouch,1,0)
	doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle01") 
	doctor:PlayAnim(doctor_crouch,1,0)

	
	chisholm:ClearFocus()
	local chs_anim = FindNodeByShortName("EM_ANIMATOR_Chisholm_Anim_CHS_StandFromSitUp") --2.96s
	chisholm:PlayAnimBlendOut(chs_anim,1,0.25,0.25)

end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local chisholm = GetActor("chisholm")
	doctor:ClearFocus()
	chisholm:SetBehaviour("wait")
	doctor:ClearFocus()
	HideLetterBox()
	doctor:SetBehaviour("pc")

	
	
	local rope_int = FindNodeByName("int_hanging_rope")
	rope_int:StopTrigger()
	rope_int = FindNodeByName("int_hanging_rope_use")
	rope_int:Trigger()
	local chisholm_circle = FindNodeByName("EM_ENTITY_Interact_Disc_Chisholm")
	chisholm_circle:Trigger()
	
	local chisholm_int = FindNodeByName("int_chisholm_examine")
	chisholm_int:StopTrigger()
	chisholm_int = FindNodeByName("int_chisholm")
	chisholm_int:Trigger()
	
	--give the driver his drink
	SetGlobalObjectiveState("Cyber_1_2_3", 3) -- 2 is unlock, 3 is done
	--Hoist Chisholm to the TARDIS
	SetGlobalObjectiveState("Cyber_1_2_4", 2) -- 2 is unlock, 3 is done
end

global function Trigger()
--FOR TESTING
	local doctor = GetActor("doctor")
	local doctor_locator = FindNodeByName("loc_cs_waking_doc_1")
	doctor:Teleport(doctor_locator)
end
