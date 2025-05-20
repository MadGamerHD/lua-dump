global function Trigger()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	

	--VO
	--Player finds vis room (trigger plane)
		doctor::SID_0940:Aha. Here we are again.
	
	SetGlobalObjectiveState("Dalek_3_2_1", 3)
	SetGlobalObjectiveState("Dalek_3_2_2", 2)
	
	SaveCheckpoint()
end
