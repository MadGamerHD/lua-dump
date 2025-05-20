global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local doctor_locator = FindNodeByName("loc_jump5")

	doctor:SetTarget(doctor_locator)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:DisableWalls()
	doctor:SetCallback(script_node,"JumpDoc")
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
