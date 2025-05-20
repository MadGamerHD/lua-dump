global script_node

global function Interact()

	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	local waypoint = script_node:FindNodeByTag("Crate_Climb_Loc")
	actorDoctor:SetTarget(waypoint)
	actorDoctor:SetCallback(script_node,"ClimbBox")
	actorDoctor:SetMoveTime(1)
	actorDoctor:SetBehaviour("move")

end

global function ClimbBox()

	local climb_anim = FindNodeByPartialName("Anim_DRW_ClimbUp1m")
	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	actorDoctor:DisablePhysics()
	actorDoctor:PlayAnim(climb_anim,1,0)
	actorDoctor:SetCallback(script_node,"DocWalk")
	
end

global function DocWalk()
	
	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	actorDoctor:EnablePhysics()
	actorDoctor:SetBehaviour("pc")
end

global function ClimbDown()



end