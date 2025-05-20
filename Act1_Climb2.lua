global function Interact()
	local loc=FindNodeByName("loc_climbing_2")
	--local walk = FindNodeByTag("TheDoctor_Anim_Walk")
	--local climb = FindNodeByTag("TheDoctor_Anim_ClimbUp_1m")
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(loc)
        doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
	
	
end