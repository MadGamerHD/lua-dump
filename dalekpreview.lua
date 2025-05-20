local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Start()
	local doctor = GetActor("doctor")
	local dalek = GetActor("dalek")
	local lookat = FindNodeByName("dalek_lookat")
	local position = FindNodeByName("dalek_pos")
	local start = FindNodeByName("dalek_start")
					
	SayPrep("skip", "")
	doctor:SetBehaviour("wait")
	dalek:Teleport(start)
	dalek:SetBehaviour("patrol")
	
	ShowLetterBox()

	DisableActorCameraCollision()	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(0, 6, 2, true, true)

	Wait(0.5)
	--CUT SCENE 2.1
	--EXT. RUINED LONDON  CONTINUOUS
		doctor::SID_0551:Stop! Look out for that Dalek! Maybe we can avoid it if we are careful.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local hints_script = FindNodeByName("hints_script")
	
	EnableActorCameraCollision()
	
	doctor:EnableStealth()
	doctor:SetBehaviour("pc")
	amy:EnableStealth()
	
	hints_script.script.after_daleks_preview = true

	HideLetterBox()	

	OverlayManager:ShowTutorial("STEALTH")
end
