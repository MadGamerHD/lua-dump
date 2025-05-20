global function Trigger()
	local doctor = GetActor("doctor")
	local doc_loc = FindNodeByName("CS11Loc")
	
	ShowLetterBox()

	SayPrep("skip","")

	FindNodeByName("cs11a_timeline"):Trigger()
	
	doctor:SetBehaviour("wait")
	doctor:SetTarget(doc_loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2)
end

global function End()
	FindNodeByName("Cut_11"):Trigger()
end