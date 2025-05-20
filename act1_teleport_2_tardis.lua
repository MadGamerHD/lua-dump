global script_node

--if not IsLoadingSavedGame() then
--	local skidoo_fact = FindNodeByName("FACT_Skidoo1")
--	skidoo_fact:StopTrigger()
--end


global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")
	ShowLetterBox()
	
	amy:ClearFocus()
	
	--CutToFade()
	ShowFade()
	Wait(1)
	doctor:SetBehaviour("wait")
	Wait(1.5)
	
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Chisholm")
	breath:StopTrigger()
	
	local ambience = FindNodeByName("ambience_upper_cave")
	ambience:StopTrigger()	
	local ambience = FindNodeByName("ambience_TARDIS")
	ambience:Trigger()	
	
	local cutscene=FindNodeByName("hook_up_satnav_to_TARDIS")
	cutscene:Trigger()	
	
	local TardisArea = FindNodeByTag("tardis_area")
	doctor:GetTransform():SetNodeParent( TardisArea )
	amy:GetTransform():SetNodeParent( TardisArea )
	chisholm:GetTransform():SetNodeParent( TardisArea )
	
	local locator = FindNodeByName("loc_doc_teleport_2_tardis")
	doctor:Teleport(locator)
	local locator = FindNodeByName("loc_amy_teleport_2_tardis")
	amy:Teleport(locator)
	local locator = FindNodeByName("loc_chisholm_teleport_2_tardis")
	chisholm:Teleport(locator)

            local anim = FindNodeByTag("Chisholm_Anim_Unconcious")
            chisholm:PlayAnim(anim ,1,0)
           -- chisholm:DisableAnimLoop()
   
	local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_CrouchToIdle") --0.8s   
	--local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow") --3.36
	--local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor") --5.96s
	
	Wait(0.5)
	HideFade()
	doctor:PlayAnim(doctor_crouch,1,0.75)
	--doctor:PlayAnimAndWait(doctor_crouch,1,0.75)
	Wait(1)
	
	--Wait(0.8)
	
	local locator = FindNodeByName("loc_doc_2_controls")
	doctor:SetTarget(locator)
	--Wait(0.5)
	doctor:SetMaxSpeed(1)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocAtPanel")
end


	
global function DocAtPanel()
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_tardis_control")
	doctor:SetTarget(locator)
	
	doctor:SetMaxSpeed(1)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocAtPanel2")
end

global function DocAtPanel2()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	HideLetterBox()
	
	
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local CircuitMinigame = MinigameManager:GetCircuitMiniGame()

	MinigameManager:SetMiniGameID("MINI_WIRE01")	
--	CircuitMinigame:SetBoard(0)
	MinigameManager:StartMiniGame(CircuitMinigame)
	MinigameManager:SetCallback(script_node, "Run_cutscene")

	--local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	--local NanoMinigame = MinigameManager:GetCircuitMiniGame()
	--MinigameManager:SetCallback(script_node, "Run_cutscene")
	--MinigameManager:StartMiniGame(NanoMinigame)

end

global function Run_cutscene()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	local ambience = FindNodeByName("ambience_TARDIS")
	ambience:Trigger()	
	ShowLetterBox()
	SayPrep("", "")
	--NEW
	doctor::SID_1531:Bingo. Now we have the coordinates.
	local cutscene=FindNodeByName("Cutscene_5") 
	cutscene:Trigger()
end
	

	
