
global script_node

local doctor_jump = FindNodeByTag("TheDoctor_Anim_JumpGap")

global function Interact()
	local doctor = GetActor("doctor")
	local doctor_locator = script_node:FindNodeByTag("jump_tag")
	doctor:DisableWalls()
	doctor:SetTarget(doctor_locator)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocJump")
end


global function DocJump()
	local doctor = GetActor("doctor")
	
	doctor:DisablePhysics()
	doctor:PlayAnim(doctor_jump,1,1)
	doctor:SetCallback(script_node,"DocWalk")
end

global function DocWalk()
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end

global function Trigger()
	DocJump()
end