global slave_by_vent2

global function Trigger()
	local doctor = GetActor("doctor")
	if(slave_by_vent2) then
		slave_by_vent2 = false
		--doctor::[SLAVE LEFT VENT]
	else
		slave_by_vent2 = true
		--doctor::[SLAVE BY VENT]
	end
end