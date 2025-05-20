global function Trigger()
	local amy = GetActor("amy")
	local waypoint = FindNodeByName("loc_cs4_amy_end")
	amy:SetTarget(waypoint)
	amy:SetBehaviour("move")
end