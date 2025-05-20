global function Start()
	local amy = GetActor("amy")
	
	SayPrep("skip", "")	
	amy:DisableStealth()
	amy:SetBehaviour("wait")
	
	ShowLetterBox()
	
	LockActorCamera()

	--CUT SCENE 19.2
	--Played if Amy attempts to leave council chamber before carapace reached.
		amy::SID_0898:I can't run away. I must get back in there. I can do this!
end

global function End()
	local amy = GetActor("amy")

	HideLetterBox()
	amy:EnableStealth()
	amy:SetBehaviour("pc")
	
	FreeActorCamera()
end
