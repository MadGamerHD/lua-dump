global slave_by_vent1

global function Trigger()
	local doctor = GetActor("doctor")
	if(slave_by_vent1) then
		slave_by_vent1 = false
		--doctor::[SLAVE LEFT VENT]
	else
		slave_by_vent1 = true
		--doctor::[SLAVE BY VENT]
	end
end