global function Interact()
	local doctor_locator = FindNodeByName("loc_climb1")
	local climberscript = FindNodeByName("Common_climb_scripts")

	climberscript.script.ClimbDocAndAmy(doctor_locator, doctor_locator)
end