global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local pickup_wiring = FindNodeByName("pickup_wiring_loc")
	
	SayPrep("skip", "async")
	--VO
	--Pickup Dalekanium Wiring
		doctor::SID_0708:Some of this debris could be useful. These wires are made from Dalekanium.

	doctor:SetTarget(pickup_wiring)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"PickUp")	
end

global function PickUp()
       local doctor = GetActor("doctor")
       local int_low = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")
       local inv_wiring = FindNodeByName("wiring")
       local obj_wiring = FindNodeByShortName("EM_ENTITY_dalek_wiring:0")
       local pickup_interact_def_2 = FindNodeByName("pickup_interact_def_2")
       local wiring_pickup_locator = FindNodeByName("wiring_scale_locator")

       doctor:PlayAnim(int_low,1,1)
       Wait(3)
       doctor:AddInventoryItem(inv_wiring)
       pickup_interact_def_2:ScaleDownOff(wiring_pickup_locator)
       Wait(2.96667)
       doctor:SetBehaviour("pc")
       obj_wiring:StopTrigger()
end
