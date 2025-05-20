global function Trigger()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("doc_walkin")
	local cutscene13 = FindNodeByName("Cutscene_13")

	ShowLetterBox()
	
	doctor:SetBehaviour("wait")	
	doctor:SetTarget(loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	Wait(1)
	ShowFade()
	
	Wait(1)
	HideFade()

	cutscene13:Trigger()
end