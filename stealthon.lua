global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalek = GetActor("dalek")	
	local patrol1 = FindNodeByName("patrol1")
					
	doctor:EnableStealth()
	amy:EnableStealth()
	
	dalek:SetSpline(patrol1)
	dalek:SetBehaviour("patrol")
end