global cutscene_12_1_played
global cutscene_14_played
global script_node
global model

global function Interact()
	local doctor = GetActor("doctor")

	if cutscene_14_played then
		--VO
		--Examine panel at the top (Escape!).
			doctor::SID_2222:The panel has been broken by the Cyberslaves but we have to use this lift to get down.
	elseif cutscene_12_1_played then
		--VO
		--Examine panel at the top (Cybermen not asleep).
			doctor::SID_2223:The controls are broken but I'm not leaving without putting those Cybermen back to sleep.
	else
		--VO
		--Examine panel at the top (No Amy).
			doctor::SID_2224:The controls have been broken by the Cyberslaves. But I'm not going anywhere without Amy anyway.
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")	
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local doc_loc = FindNodeByName("doc_loc")
	local amy_loc = FindNodeByName("loc_pre_amy")
	local chis_loc = FindNodeByName("loc_pre_chisholm")

	if cutscene_14_played then

	
		amy:SetTarget(amy_loc)
		amy:SetMaxSpeed(2)
		amy:SetBehaviour("move")

		chisholm:SetTarget(chis_loc)
		chisholm:SetMaxSpeed(2)
		
		chisholm:SetBehaviour("move")
		chisholm:SetCallback(script_node, "Chisholm_in_place")
		
		local redundant_plane = FindNodeByName("trigger_get_companions_in_place")
		redundant_plane:StopTrigger()
		
		doctor:SetTarget(doc_loc)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")



	elseif cutscene_12_1_played then
	--VO
	--Use Sonic on panel at the top (Cybermen not asleep).
		doctor::SID_2226:I'm not leaving without stopping the Cybermen.	
	else
	--VO
	--Use Sonic on panel at the top (No Amy).
		doctor::SID_2227:I'm not going down without Amy.
	end
end

global function Chisholm_in_place()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")	
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3

	local amy_loc = FindNodeByName("amy_loc")
	local chis_loc = FindNodeByName("chis_loc")
	
		amy:SetTarget(amy_loc)
		amy:SetMoveTime(2)
		amy:SetBehaviour("move")

		chisholm:SetTarget(chis_loc)
		chisholm:SetMoveTime(2)
		chisholm:SetBehaviour("move")

		Wait(2)
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
		doctor:PlayAnim(anim, 1, 0.1)
		doctor:SetCallback(script_node, "InteractAnimFinishedSonic")
end

global function InteractAnimFinishedSonic()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")		
	local platform_a = FindNodeByName("prop_pn_lift_1")
	local lift_start = FindNodeByName("audio_lift_start")  --0.49s
	local lift_end = FindNodeByName("audio_lift_end")  --1.54s

	platform_a:MoveToOrigin(1.2, "lerp")
	lift_start:Trigger()
	Wait(1)
	lift_end:Trigger()

	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	chisholm:SetTarget(doctor)
	chisholm:SetBehaviour("follow")
	chisholm:SetMaxSpeed(4.0)
end
