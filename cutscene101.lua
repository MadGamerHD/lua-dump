global function Trigger()
	local doctor = GetActor("doctor")
	local cutScene = FindNodeByName("Cutscene101Timeline")
	local Pos = FindNodeByName("LookFromResearch1")
	local LookAt = FindNodeByName("LookAtResearch1")

	CutToLetterBox()
	doctor:SetBehaviour("wait")
	cutScene:Trigger()
	
	SetPOILookAtNode(LookAt)
	SetPOIPositionNode(Pos)
	BeginPOI(2, 3, 2, true, true)
end

global function EndScene()
	local doctor = GetActor("doctor")
	
	HideLetterBox()
	doctor:SetBehaviour("pc")
end