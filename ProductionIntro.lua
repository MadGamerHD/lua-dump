global function Start()
	local doctor = GetActor("doctor")
	local Pos = FindNodeByName("LookFrom1")
	local LookAt = FindNodeByName("LookAt1")
	
	doctor:SetBehaviour("wait")
	
	DisableActorCameraCollision()
	SetPOILookAtNode(LookAt)
	SetPOIPositionNode(Pos)
	BeginPOI(3, 3, 3, true, true)

	ShowLetterBox()
end

global function End()
	local doctor = GetActor("doctor")

	EnableActorCameraCollision()	
	doctor:SetBehaviour("pc")
	HideLetterBox()

	SetGlobalObjectiveState("Dalek_2_2_1",3)
end