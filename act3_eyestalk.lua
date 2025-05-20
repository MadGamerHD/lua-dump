global script_node

global EyeStalk

global function Interact()
	local amy = GetActor("amy")
	local eye_stalk_loc = FindNodeByName("eye_stalk_loc")

	SayPrep("skip", "async")
	--VO
	--Pick up Ocular Cable
		amy::SID_0748:Perfect. An Eye Stalk, it had better not be too damaged.
	
	amy:SetTarget(eye_stalk_loc)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	amy:SetCallback(script_node,"PickUp")
end

global function PickUp()
	local amy = GetActor("amy")
	local int_low = FindNodeByPartialName("EM_ANIMATOR_Amy_Anim_AMY_CrouchInteract01")

	amy:PlayAnim(int_low,1,1)

	amy:SetCallback(script_node,"Inventory")
end

global function Inventory()
	local amy = GetActor("amy")
	local obj_eye_stalk = FindNodeByShortName("EM_ENTITY_eye_stalk:0")
	local inv_eye_stalk = FindNodeByName("eye_stalk")
	local beam_gun = FindNodeByName("beam_gun_script")
	local both_objects = FindNodeByName("both_objects_script")

	obj_eye_stalk:StopTrigger()
	amy:AddInventoryItem(inv_eye_stalk)
	EyeStalk = true

	SetGlobalObjectiveState("Dalek_3_4_2", 3)
	
	if beam_gun.script.BeamGun then
		both_objects.script.Trigger()
	else
		--VO
		--Hint to pick up Beam Distributor
			amy::SID_1880:Now I have to find that Beam Distributor.

		amy:SetBehaviour("pc")
		SaveCheckpoint()
	end
end
