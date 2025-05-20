global model
global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local SwitchLocator = FindNodeByShortName("loc_coiled_rope_scale")
	doctor:SetTarget(SwitchLocator)
	doctor:SetCallback(script_node, "InteractMoveFinished")
	doctor:SetMoveTime(1)
	doctor:SetMoveNearbyDistance(0.25)
	doctor:SetBehaviour("move")
end

global function InteractMoveFinished()
	local cam_angle = FindNodeByShortName("throw_rope_timeline")
	cam_angle:Trigger()
	ShowLetterBox()
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")
	doctor:SetCallback(script_node, "InteractAnimFinished")
	doctor:PlayAnim(anim, 1, 0.1)
	Wait(3)
	
	local rope_interact = FindNodeByName("int_coiled_rope")
	local scale_locator = FindNodeByName("loc_coiled_rope_scale")

       rope_interact:ScaleDownOff(scale_locator)

	--model:Hide()
	--doctor:DisableAnimLoop()
end

global function InteractAnimFinished()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	local amy = GetActor("amy")
	model:Hide()
	--local Rope = script_node:FindInventoryItem()
	--amy:AddInventoryItem(Rope)	
	local rope = FindNodeByName("coiled_rope2")
	rope:Trigger()
	doctor:SetFocus(amy)
	
	SayPrep("skip", "async")
	--HINT
	--throwing up the rope to Amy
	
	doctor::SID_0028: Amy! Can you tie this Rope to something please?
	Wait(0.3)
	local camera1 = FindNodeByName("CutSceneCamera_1")
	
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_ThrowRopeUp5m") --5.06s
	doctor:PlayAnim(anim, 1, 0.1)
	
	-- Show and play throw rope animation
	local rope_prop = FindNodeByName("Coiled_Rope_Prop")
	local rope_entity = FindNodeByName("EM_ENTITY_CoiledThrowingRope")
	local rope_anim = FindNodeByShortName("EM_ANIMATOR_CoiledThrowingRope_Anim_ROP_ThrowRopeUp5m")
	rope_prop:PlayAnim(rope_anim, 1, 0)
	rope_entity:Show()
	WaitFrame()
	WaitFrame()
	camera1:CutTo()
	
	Wait(4)
	rope_entity:Hide()
	doctor:SetBehaviour("wait")
	SayPrep("skip", "")
	--HINT
	--explain rope for Amy. Shouting up to Amy
	doctor::SID_1140: We need to find a way to Winch this fellow up. 
	--HINT
	--Acknowledge rope. Shouting down.
	amy::SID_1141: Sure.
	local point = FindNodeByName("loc_switch_amy")
	local amy = GetActor("amy")
	amy:Teleport(point)
	--doctor:SetBehaviour("wait")
	HideLetterBox()
	amy:SetBehaviour("pc")
	--tie the rope to the skidoo
	AddGlobalObjective("Cyber_1_3")
	SetGlobalObjectiveState("Cyber_1_3_1", 2) -- 2 is unlock, 3 is done
	doctor:ClearFocus()
	model:StopTrigger()	
end
