global doctor_by_vent2

global function Trigger()

	if(doctor_by_vent2) then
		doctor_by_vent2 = false

	else
		doctor_by_vent2 = true

	end
end