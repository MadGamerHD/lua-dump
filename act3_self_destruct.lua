global function Start()
	local doctor = GetActor("doctor")

	SayPrep("skip", "async")
	Wait(1)
	--VO
	--The Doctor running out of time...
		doctor::SID_2401:I'm guessing we have about 60 seconds to get to the lift.
	Wait(30)
	--VO
	--The Doctor running out of time...
		doctor::SID_2402:I have to hurry, must be about 30 seconds left!
	Wait(20)
	--VO
	--The Doctor running out of time...
		doctor::SID_2403:10 seconds left.
end

global function End()
	local doctor = GetActor("doctor")

	doctor:Die("explosion")
end
