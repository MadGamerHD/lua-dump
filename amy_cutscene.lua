global function Start()
	local amy = GetActor("amy")

	ShowLetterBox()
	amy:SetBehaviour("wait")
end

global function End()
	local amy = GetActor("amy")

	HideLetterBox()
	amy:SetBehaviour("pc")
	Wait(0.5)
	SaveCheckpoint()
	
end

global function EndWithStealth()
	local amy = GetActor("amy")
	amy:EnableStealth()
	HideLetterBox()
	amy:SetBehaviour("pc")
	Wait(0.5)

	SaveCheckpoint()
	
end


global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	--amy:SetTarget(doctor)
	amy:SetBehaviour("pc")
	doctor:SetBehaviour("wait")
	--local doc_int = FindNodeByName("int_doctor")
	--doc_int:Trigger() --make doctor interactable when Amy is it.
	
end