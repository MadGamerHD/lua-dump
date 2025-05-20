
global function DisableDalekStealth()
	local dalek = GetActor("dalek")
	local dalek1 = GetActor("dalek1")
	local dalek2 = GetActor("dalek2")
	local dalek3 = GetActor("dalek3")
	local dalek4 = GetActor("dalek4")
	local dalek5 = GetActor("dalek5")
	
	dalek:EnableSensorVisuals(false)
	dalek1:EnableSensorVisuals(false)
	dalek2:EnableSensorVisuals(false)
	dalek3:EnableSensorVisuals(false)
	dalek4:EnableSensorVisuals(false)
	dalek5:EnableSensorVisuals(false)
end