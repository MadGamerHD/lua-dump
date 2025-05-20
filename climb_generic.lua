


global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local doctor_locator = script_node:FindNodeByTag("climb_tag")
	doctor:DisableWalls()
	doctor:SetTarget(doctor_locator)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocClimb")
end


global function DocClimb()
	local doctor = GetActor("doctor")
	local doctor_climb = FindNodeByPartialName("TheDoctor_Anim_DRW_ClimbUp1m")
	doctor:DisablePhysics()
	doctor:PlayAnim(doctor_climb,1,1)
	doctor:SetCallback(script_node,"DocWalk")
end

global function DocWalk()
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end