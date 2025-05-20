global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	local doc_time = FindNodeByName("noback_doc_time")
	local amy_time = FindNodeByName("noback_amy_time")
	
	if player:IsEqual(doctor) then		
		doc_time:Trigger()
	else
		amy_time:Trigger()
	end
end

