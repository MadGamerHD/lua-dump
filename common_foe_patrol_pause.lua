global function PauseOn()
	local TriggerNode = GetTriggerNode()
	local Foe = TriggerNode:FindActor()
	
	Foe:SetPatrolPauseTime(5)
end

global function PauseOff()
	local TriggerNode = GetTriggerNode()
	local Foe = TriggerNode:FindActor()
	
	Foe:SetPatrolPauseTime(0)
end