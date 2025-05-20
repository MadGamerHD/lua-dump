global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doctor_locator = FindNodeByName("loc_jump1")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()

	if(doctor_player) then	
		doctor:SetTarget(doctor_locator)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		doctor:DisableWalls()
		doctor:SetCallback(script_node,"JumpDoc")
	else
		amy:SetTarget(doctor_locator)
		amy:SetMoveTime(2)
		amy:SetBehaviour("move")
		amy:DisableWalls()
		amy:SetCallback(script_node,"JumpAmy")
		--amy:SetCallback(script_node,"AmyDone")
	end
end

global function JumpDoc()
	local doctor = GetActor("doctor")
	local doctor_jump = FindNodeByPartialName("Anim_DRW_JumpGap1")

	doctor:DisablePhysics()
	doctor:PlayAnim(doctor_jump,1,0)
	doctor:DisableAnimLoop()
	doctor:SetCallback(script_node,"DocDone")
end

global function DocDone()
	local doctor = GetActor("doctor")

	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end

global function JumpAmy()
	local amy = GetActor("amy")
	local doctor_jump = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Jump1_5m")

	amy:DisablePhysics()
	amy:PlayAnim(doctor_jump,1,0)
	amy:DisableAnimLoop()
	amy:SetCallback(script_node,"AmyDone")
end

global function AmyDone()
	local amy = GetActor("amy")

	--local loc = FindNodeByName("loc_jump1a")
	--amy:Teleport(loc)
	amy:EnablePhysics()
	amy:SetBehaviour("pc")
end

global function Trigger()
	local amy = GetActor("amy")
	local doctor_jump = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Jump1_5m")

	amy:DisablePhysics()
	amy:PlayAnim(doctor_jump,1,0)
	amy:DisableAnimLoop()
	amy:SetCallback(script_node,"AmyDone")
end