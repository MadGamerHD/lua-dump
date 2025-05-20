global script_node

global function AmyHide()
	local waypoint = script_node:FindNodeByTag("HidePoint")
	local amy = GetActor("amy")
	
	amy:SetTarget(waypoint)
	amy:SetMoveTime(2)
	amy:EnableMoveWalls()
	amy:SetBehaviour("move")
end

global function AmyFollow()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
end
