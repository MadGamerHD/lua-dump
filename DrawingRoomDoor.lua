global script_node

global function MoveDoorsComplete()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
		
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer())then
		doctor:EnablePhysics()
		FindNodeByName("ControlRoomReturnDoc"):Trigger()
	else
		amy:EnablePhysics()
		FindNodeByName("ControlRoomReturn"):Trigger()
		
		if GetAct() == 2 then
			Wait(1)
			amy:FadeGlowUp(0.5)
		end
	end
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local exit_cam = FindNodeByName("ExitRoomCam")
	local anim1 = FindNodeByPartialName("Anim_DRW_OpenDoor_LH")
	local anim2 = FindNodeByPartialName("Anim_AMY_DoorOpen_Pull_LH")
	local doorprop = FindNodeByName("Door2Prop")
	
	ShowLetterBox()
	exit_cam:CutTo()

	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer())then
		doctor:DisablePhysics()
		doctor:SetTarget(FindNodeByName("PlayerDoorLoc"))
		doctor:SetMoveTime(0.7)
		doctor:SetBehaviour("move")
		
		Wait(0.7)
		doctor:PlayAnim(anim1,1.0,1.0)
	else
		amy:DisablePhysics()
		amy:SetTarget(FindNodeByName("AmyDoorLoc"))
		amy:SetMoveTime(0.7)
		amy:SetBehaviour("move")
		
		Wait(0.7)
		amy:PlayAnim(anim2,1.0,1.0)
	end

	Wait(1)
	doorprop:Move(FindNodeByName("Door2Loc"),2,"sine")
	doorprop:SetCallback(script_node,"MoveDoorsComplete")
end
