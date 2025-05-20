global function Start()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	
	LockActorCamera()

	--CUT SCENE 20.1
	--Attempt to leave council chamber before generators triggered and Amy reached.
		doctor::SID_0897:Amy is counting on me. I have to get back to the Council Chamber.
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	doctor:SetBehaviour("pc")
	
	FreeActorCamera()
end
