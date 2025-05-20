global function Start()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	
	LockActorCamera()
	
	--CUT SCENE 16.2
	--Trigger attempt to exit council room before trap set
		doctor::SID_0717:There's no time to explore. We must set a trap for the Daleks before they get here.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	HideLetterBox()

	FreeActorCamera()

	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
end
