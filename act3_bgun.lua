global script_node

global BeamGun

global function Interact()
	local amy = GetActor("amy")
	local beam_gun_loc = FindNodeByName("beam_gun_loc")

	SayPrep("skip", "async")
	--VO
	--Pick up Beam Distributor
		amy::SID_0747:Good, a Dalek Gun. Hope it still works.
	
	amy:SetTarget(beam_gun_loc)
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
	local obj_beam_gun = FindNodeByShortName("EM_ENTITY_beam_gun:0")
	local inv_beam_gun = FindNodeByName("beam_gun")
	local both_objects = FindNodeByName("both_objects_script")
	local eye_stalk = FindNodeByName("eye_stalk_script")

	obj_beam_gun:StopTrigger()
	amy:AddInventoryItem(inv_beam_gun)
	BeamGun = true

	SetGlobalObjectiveState("Dalek_3_4_3", 3)
	
	if eye_stalk.script.EyeStalk then
		both_objects.script.Trigger()
	else
		--VO
		--Hint to pick up Eye Stalk
			amy::SID_1881:Now I have to find that Eye Stalk.

		amy:SetBehaviour("pc")
		SaveCheckpoint()
	end
end
