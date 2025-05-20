global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local talk_amy_hints_int = FindNodeByName("talk_amy_hints_int")
	local talk_amy_end_int = FindNodeByName("talk_amy_end_int")

	--allow doctor to talk to amy for the win
	talk_amy_hints_int:StopTrigger()
	talk_amy_end_int:Trigger()
	
	Wait(11)
	--VO
	--The Doctor running out of time...
		doctor::SID_2040:There goes another generator. I have to get to Amy.
	Wait(10)
	--VO
	--The Doctor running out of time...
		doctor::SID_2041:I've only got about 10 seconds left!
end

global function End()
	local doctor = GetActor("doctor")
	local daleks = FindNodeByName("council_daleks")
--	local amy = GetActor("amy")

--	amy:Die("electric")
	doctor:Die("explosion")
	Wait(0.1)
	daleks:StopTrigger()
end
