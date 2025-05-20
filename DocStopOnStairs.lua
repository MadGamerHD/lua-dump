global function StartScene()
	local doctor = GetActor("doctor")
	
	ShowLetterBox()

	doctor:SetBehaviour("wait")
end


global function EndScene()
	local doctor = GetActor("doctor")

	HideLetterBox()
	doctor:SetBehaviour("pc")
end