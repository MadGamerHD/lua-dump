global function Trigger()
	local Pos = FindNodeByName("VisualiserInfoLook")
	local LookAt = FindNodeByName("DalekTP1")
	local doctor = GetActor("doctor")
	
	doctor:SetBehaviour("wait")

	DisableActorCameraCollision()
	SetPOILookAtNode(LookAt)
	SetPOIPositionNode(Pos)
	BeginPOI(2, 3, 2, true, true)

	ShowLetterBox()
end

global function EndScene()
	local doctor = GetActor("doctor")

	EnableActorCameraCollision()
	doctor:SetBehaviour("pc")
	HideLetterBox()
end