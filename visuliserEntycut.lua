global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	SayPrep("skip", "")
	CutToLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
--	VisEye:Hide()
	VisEye:CutsceneReset()
end


global function EndVisCut()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	amy:SetTarget(doctor)
	doctor:SetBehaviour("pc")
	amy:SetBehaviour("follow")
	amy_hint_interact:Wake()
	VisEye:Show()
	HideLetterBox()
end