global function StartScene()

	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	CutToLetterBox()
	amy:SetBehaviour("wait")
	doctor::Need to start adding some VO_3 script here!
	
end

global function EndScene()

	local amy = GetActor("amy")
	HideLetterBox()
	amy:SetBehaviour("pc")
	
end