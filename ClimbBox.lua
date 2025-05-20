global script_node
global isInsideRoom

global function Interact()

	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	local waypoint
	if(isInsideRoom == 1) then
		waypoint = script_node:FindNodeByTag("Crate_Climb_Loc_Inside")
	else
		waypoint = script_node:FindNodeByTag("Crate_Climb_Loc")
	end
	
	actorDoctor:SetTarget(waypoint)
	actorDoctor:SetCallback(script_node,"ClimbBox")
	actorDoctor:SetMoveTime(1)
	actorDoctor:SetBehaviour("move")

end

global function DocWalk()
	print("DocWalk")
	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	actorDoctor:EnablePhysics()
	actorDoctor:SetBehaviour("pc")
end

global function ClimbBox()

	local climb_anim = FindNodeByPartialName("Anim_DRW_ClimbUp1m")
	local doctor = GetActor("doctor")
	doctor:DisablePhysics()
	doctor:PlayAnim(climb_anim,1,0)
	--doctor:SetCallback(script_node,"DocWalk")
	doctor:SetCallback(script_node,"ClimbDown")
	
end

global function ClimbDown()
	local climb_anim = FindNodeByPartialName("Anim_DRW_ClimbDown1m_Idle")
	local doctor = GetActor("doctor")
	doctor:DisablePhysics()
	doctor:SetCallback(script_node,"DocWalk")
	doctor:PlayAnim(climb_anim,1,0)
	doctor:DisableAnimLoop()

end