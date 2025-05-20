global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_script = FindNodeByName("amy_startup_0")
	local dalek_script = FindNodeByName("DalekSensors_0")
		
	print("Enter Stealth","\n")

	doctor:EnableStealth()
	
	if (amy_script.script.AmyState == 0) then
		amy:EnableStealth()
	end
	
	dalek_script.script.EnableSensors()
end