global function Trigger()
	local doctor = GetActor("doctor")
	local lookat = FindNodeByName("gen_lookat")
	local position = FindNodeByName("gen_pos")
	
	SayPrep("skip", "async")	

	ShowLetterBox()
	doctor:SetBehaviour("wait")
	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(2, 6, 2, true, true)

	--NEW
	--VO 
	--Doctor walks into the council chamber and needs to see a way round the blind Daleks.
		doctor::SID_1047:I have to find a way round those Daleks to shut down the generators from the console.
	
	Wait(10)
	HideLetterBox()
	doctor:SetBehaviour("pc")
end
