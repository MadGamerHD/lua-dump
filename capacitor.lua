global script_node
global model

global function Interact()

	local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable")
	--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
	local amy=GetActor("amy")
	amy:SetBehaviour("wait")
	
	local loc = FindNodeByName("loc_capacitor")
	amy:SetTarget(loc)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	SayPrep("skip", "async")
	--VO
	--picking up radio part
	amy::SID_0450:A Capacitor. At least I hope that's what it is.
	amy:AddInventoryItem(script_node:FindInventoryItem())
	Wait(1)
	amy:PlayAnim(anim_amy, 1, 0.1)
	--FInd a new capacitor
	SetGlobalObjectiveState("Cyber_2_5_1", 3) -- 2 is unlock, 3 is done
	Wait(0.5)
	model:Hide()
	Wait(1)
	amy:SetBehaviour("pc")
	SayPrep("skip", "")
	model:StopTrigger()
end

global function Trigger()
	local amy=GetActor("amy")
	amy:AddInventoryItem(script_node:FindInventoryItem())
end
