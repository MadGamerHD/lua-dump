global function Trigger()
	local amy = GetActor("amy")

	SayPrep("skip", "async")
	--VO
	--if both parts of vision disruptor collected
		amy::SID_0749:That's everything I need - I should get back to the Doctor.
	
	SetGlobalObjectiveState("Dalek_3_4_4", 2)	
	amy:SetBehaviour("pc")
	SaveCheckpoint()
end