global doctor_by_vent1

global function Trigger()

	if(doctor_by_vent1) then
		doctor_by_vent1 = false

	else
		doctor_by_vent1 = true

	end
end