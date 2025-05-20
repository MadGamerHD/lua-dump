global script_node
global chisholm_follow

global function WishItWorked()
	print ("climb","\n")
	local doctor = GetActor("doctor")
	local doctor_locator = FindNodeByName("loc_climbing_1_po")
	doctor:SetTarget(doctor_locator)
	doctor:SetMaxSpeed(0.6)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocClimb")
end

global function Interact()
	--local walk = FindNodeByTag("TheDoctor_Anim_Walk")
	--local climb = FindNodeByTag("TheDoctor_Anim_ClimbUp_1m")
	local loc = FindNodeByName("loc_climbing_1")
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(loc)
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
	if(chisholm_follow==nil) then
		local loc = FindNodeByName("loc_chisholm7")
		local chisholm = GetActor("chisholm")
		chisholm:SetBehaviour("wait")
		chisholm:Teleport(loc)
		chisholm_follow = 1
	end
end

global function DocClimb()
	local doctor = GetActor("doctor")
	--local doctor_climb = FindNodeByPartialName("Anim_DRW_ClimUp_1m")
	local doctor_climb = FindNodeByTag("TheDoctor_Anim_ClimbUp_1m")
	doctor:DisableWalls()
	doctor:PlayAnim(doctor_climb,1,1)
	doctor:SetCallback(script_node,"DocWalk")
end

global function DocWalk()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
end