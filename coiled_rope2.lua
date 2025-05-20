global model
global script_node

global function Interact()
	local amy = GetActor("amy")
	local SwitchLocator = FindNodeByName("loc_coiled_rope2_scale")
	amy:SetTarget(SwitchLocator)
	amy:SetCallback(script_node, "InteractMoveFinished")
	amy:SetMoveTime(1)
	amy:SetMoveNearbyDistance(0.25)
	amy:SetBehaviour("move")
end

global function InteractMoveFinished()
	local amy = GetActor("amy")
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractFloor") --1.8s
	amy:SetCallback(script_node, "InteractAnimFinished")
	amy:PlayAnim(anim, 1, 0.5)
	Wait(0.8)
	
	local rope_interact = FindNodeByName("int_coiled_rope2")
	local scale_locator = FindNodeByName("loc_coiled_rope2_scale")

       rope_interact:ScaleDownOff(scale_locator)
end

global function InteractAnimFinished()
	local amy = GetActor("amy")
	model:StopTrigger()
	local Rope = FindNodeByName("Rope")
	amy:AddInventoryItem(Rope)	
	amy:SetBehaviour("pc")
	
	--tie the rope to the skidoo
--	SetGlobalObjectiveState("Cyber_1_3_1", 2) -- 2 is unlock, 3 is done

	model:StopTrigger()	
end
