global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	
	if player:IsEqual(doctor) then		
		doctor:DisableStealth()
	else
		amy:DisableStealth()
	end
end