global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_position = FindNodeByName ("station_start_doc1")
	local amy_position = FindNodeByName ("station_start_amy1")
	local traf_amb = FindNodeByName("traf_amb")
	local sub_amb = FindNodeByName("sub_amb")
					
	ShowFade()
	Wait(1)

	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	doctor:Teleport(doc_position)
	doctor:EnablePhysics()
	amy:DisablePhysics()
	amy:Teleport(amy_position)
	amy:EnablePhysics()
	
	sub_amb:Trigger()
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	HideFade()
end