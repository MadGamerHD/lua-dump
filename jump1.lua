global script_node

global function InteractThree()
	--local walk = FindNodeByTag("TheDoctor_Anim_Walk")
	--local climb = FindNodeByTag("TheDoctor_Anim_ClimbUp_1m")
	local loc = FindNodeByName("loc_jump1")
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(loc)
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end

global function Interact()
	local doctor = GetActor("doctor")
	local doctor_locator = FindNodeByName("loc_jump1_takeoff")
	doctor:SetTarget(doctor_locator)
	doctor:SetMaxSpeed(3)
	doctor:SetBehaviour("move")
	doctor:DisableWalls()
	doctor:SetCallback(script_node,"JumpDoc")
end

global function JumpDoc()
	local doctor = GetActor("doctor")
	local doctor_jump = FindNodeByPartialName("Anim_DRW_JumpGap1_5")

	doctor:PlayAnim(doctor_jump,1,0)
	doctor:DisableAnimLoop()
	
	doctor:SetCallback(script_node,"DocDone")
end

global function DocDone()
	local loc = FindNodeByName("loc_jump1")
	local doctor = GetActor("doctor")
	doctor:Teleport(loc)
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end

global function Trigger()
--FOR TESTING
	local doctor = GetActor("doctor")
	local doctor_locator = FindNodeByName("loc_cs_waking_doc_1")
	doctor:Teleport(doctor_locator)
end