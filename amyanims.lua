global script_node

global function Play()
	local amy = GetActor("amy")
	local amy_turn_locator = FindNodeByName("amy_turn_locator")
	local amy_left90 = FindNodeByPartialName("Anim_AMY_TurnLeft90")

	amy:Teleport(amy_turn_locator)
	Wait(1)
	amy:PlayAnim(amy_left90,0.7,0)
	amy:SetCallback(script_node,"Point")
end

global function Point()
	local amy = GetActor("amy")
	local amy_point = FindNodeByPartialName("Anim_AMY_PointFwd")
	
	amy:PlayAnim(amy_point,1,0)
end