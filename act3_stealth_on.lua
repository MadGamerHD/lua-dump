global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	
	if player:IsEqual(amy) then		
		amy:EnableStealth()
	end
end