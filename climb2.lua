global script_node

global function Interact()
	local common_script = FindNodeByName("common_climb_scripts")
	local doctor_locator = FindNodeByName("doctor_climb2")
	local amy_locator = FindNodeByName("amy_climb2")

	common_script.script.ClimbDocAndAmy(doctor_locator, amy_locator)
end