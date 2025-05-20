global function RedundantInteract()
	--local walk = FindNodeByTag("TheDoctor_Anim_Walk")
	--local climb = FindNodeByTag("TheDoctor_Anim_ClimbUp_1m")
	local loc = FindNodeByName("loc_climb_down2")
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(loc)
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end


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
	
	--local doctor_climb = FindNodeByTag("TheDoctor_Anim_ClimbDown1m")
	local doctor_climb = FindNodeByPartialName("Anim_DRW_ClimbDown3m") --2.9s
	--local doctor_climb = FindNodeByPartialName("Anim_DRW_ClimbDown1m_idle")
	--local doctor_climb = FindNodeByPartialName("Anim_DRW_ClimbDown1m")
	--doctor:DisablePhysics()
	
	
	
	doctor:PlayAnim(doctor_climb,1,1)
	doctor:DisableAnimLoop()
	Wait(1.4)
	local audio_drop = FindNodeByName("audio_land_from_fall")
	audio_drop:Trigger()
	doctor:SetCallback(script_node,"DocWalk")
end

global function DocWalk()
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
end