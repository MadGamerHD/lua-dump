global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local supreme = GetActor("supreme")

	--CUT SCENE 20
	--INT. RUINED KAALANN. SUPREME COUNCIL CHAMBER -- DAY
	--Amy reaches the cradle of the old emperor, climbs inside and activates the vision disruptor. 
	--Climb Emperor's Carapace and whisper: (TO HERSELF)
		amy::SID_0765:This had better work, Doctor.
	--There is a burst of light. Suddenly the Daleks are blinded, swinging around wildly...
		supreme::SID_0767:Vision malfunction! Daleks are under attack! Daleks are under attack!
		doctor::SID_0768:Now I've got to destroy those Magnetic Field Generators to free the Eye.

	--on end
	
	SetGlobalObjectiveState("Dalek_3_5_2", 3)	
	AddGlobalObjective("Dalek_3_6")
end
