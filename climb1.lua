global script_node

global function Interact()
	local common_script = FindNodeByName("common_climb_scripts")
	local doctor_locator = FindNodeByName("doctor_climb1")
	local amy_locator = FindNodeByName("amy_climb1")

	common_script.script.ClimbDocAndAmy(doctor_locator, amy_locator)
end