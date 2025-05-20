global script_node
local second_locator

global function ClimbDocAndAmy(doctor_locator, amy_locator)
	local doctor = GetActor("doctor")

	second_locator = amy_locator

--	doctor:DisableStealth()
	Wait(0.5)
	doctor:SetTarget(doctor_locator)
	doctor:SetMaxSpeed(2)
	doctor:DisableWalls()
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocClimb")
end

global function DocClimb()
	local doctor = GetActor("doctor")
	local doctor_climb = FindNodeByPartialName("Anim_DRW_ClimbUp1m")
	doctor:DisablePhysics()
	doctor:PlayAnim(doctor_climb,1,0)
	doctor:SetCallback(script_node,"DocWalk")
end

--walk anim removed so this function is 'done'
global function DocWalk()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	--local doctor_walk = FindNodeByPartialName("Anim_DRW_Walk")
	--doctor:PlayAnim(doctor_walk,1,0.5)
	--doctor:DisableAnimLoop()
	doctor:EnablePhysics()
	--doctor:SetCallback(script_node, "DocDone")
	doctor:SetBehaviour("pc")
	doctor:SetMaxSpeed(6)
	
	--amy follows when doc has finished climb and walk
	amy:DisableStealth()
	Wait(0.5)
	amy:SetTarget(second_locator)
	amy:SetMaxSpeed(2)
	amy:DisableWalls()
	amy:SetBehaviour("move")
	amy:SetCallback(script_node,"AmyClimb")
end

--global function DocDone()
	--local doctor = GetActor("doctor")
	--doctor:SetBehaviour("pc")
--end

global function AmyClimb()
	local amy = GetActor("amy")
	local amy_climb = FindNodeByPartialName("Anim_AMY_ClimbUp1m")
	amy:DisablePhysics()
	amy:PlayAnim(amy_climb,1,0)
	amy:SetCallback(script_node,"AmyWalk")
end

--walk anim removed so this function is 'done'
global function AmyWalk()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	--local amy_walk = FindNodeByPartialName("Anim_AMY_Walk")
	--amy:PlayAnim(amy_walk,1,0.5)
	--amy:DisableAnimLoop()
	amy:EnablePhysics()
	--amy:SetCallback(script_node, "AmyDone")
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	amy:SetMaxSpeed(6)

end

--global function AmyDone()
	--local doctor = GetActor("doctor")
	--local amy = GetActor("amy")
	--amy:SetTarget(doctor)
	--amy:SetBehaviour("follow")
--end
