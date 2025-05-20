global function StartScene()
	local amy = GetActor("amy")
	
	ShowLetterBox()

	amy:SetBehaviour("wait")
end

global function EndScene()
	local amy = GetActor("amy")
	
	HideLetterBox()

	amy:SetBehaviour("pc")

	FindNodeByName("AllControlsScript").script.ResetAllControls()	
	FindNodeByName("AllControlsScript").script.ResetConsoles()
end