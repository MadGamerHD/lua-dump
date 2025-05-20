global has_played_radio
global model
global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local SwitchLocator = FindNodeByName("loc_cybermat_part")
	doctor:SetTarget(SwitchLocator)
	ShowLetterBox()
	LockActorCamera()
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")

Wait(1)
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")
	doctor:PlayAnim(anim, 1, 0.1)
	Wait(1.5)
	model:Hide()

	SayPrep("skip", "")
	
	--interact with the cybermat part.
	--The Doctor picks up something from the Cybermat nest that fell in through the roof with Amy.
	doctor::SID_0296:Perfect. A Nano-synthesizer. Just what Professor Meadows needs.  She can get a sample of the cyber-virus from this. Come on.
	local mat_part = FindNodeByName("cybermat_part")
	doctor:AddInventoryItem(mat_part)
	
	--salvage a cybermat part
	SetGlobalObjectiveState("Cyber_2_4_4", 3) -- 2 is unlock, 3 is done
	ShowFade()
	Wait(1)
	FreeActorCamera()
	local cutscene = FindNodeByName("Cutscene_8_3")
	cutscene:Trigger()
	
--	if(has_played_radio == true) then
--		--local cutscene = FindNodeByName("radio_room_csc2")
--		local cutscene = FindNodeByName("Cutscene_8_4")
--		cutscene:Trigger()
--	else
--		--set up radio speak to trigger if we leave before interacting with the radio
--		local trigger_sphere = FindNodeByName("trigger_radio_speak")
--		
--		trigger_sphere:Trigger()
		--HideLetterBox()
--	end
	--doctor:SetBehaviour("pc")
	
	model:StopTrigger()
end

