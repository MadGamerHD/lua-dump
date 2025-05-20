global function PlayObjectiveCompleteMessage()
	local doctor = GetActor("doctor")

-- don't skip line as it will follow on from previous in crystal or coil script
--	SayPrep("skip", "")

	--VO
	--Pick up second item
		doctor::SID_0625:That's everything I need. Now I'd better get back to Amy and start work putting it together.

	SetGlobalObjectiveState("Dalek_2_2_4", 2)
	doctor:SetBehaviour("pc")	
	SaveCheckpoint()
end