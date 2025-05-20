global function Trigger()
	local dalek = GetActor("dalek3")
	
	dalek:SetPatrolPauseTime(3)
end

global function Exit()
	local dalek = GetActor("dalek3")
	
	dalek:SetPatrolPauseTime(0)
end
