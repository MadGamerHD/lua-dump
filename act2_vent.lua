global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()

	SayPrep("skip","")

	if(doctor_player) then	
		--VO
		--Examine vent
		doctor::SID_2466:Another vent for the Cybermats to use.
	else
		--VO
		--Examine vent
		amy::SID_2467:I hope no more Cybermats are in there.
	end		
end
