global script_node
global function Interact()

	local doctor = GetActor("doctor")
	local JumpLocator = script_node:FindNodeByTag("JumpStart")
	doctor:DisableWalls()
	--doctor:DisablePhysics()
	doctor:SetCallback(script_node, "Jump")
	doctor:SetTarget(JumpLocator)
	doctor:SetBehaviour("move")
end

global function Jump()
	local jump_anim = FindNodeByTag("TheDoctor_Anim_JumpGap_R")
	local doctor = GetActor("doctor")
	doctor:SetCallback(script_node, "FinishedJump")

	doctor:PlayAnim(jump_anim,1,0)
		doctor:DisableAnimLoop()
end


global function FinishedJump()

	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	doctor:EnableWalls()
	doctor:EnablePhysics()

end