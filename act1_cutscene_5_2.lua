--5.2 (ACTIVE)
--Played when dialogue is over.
--Ends and returns to gameplay in tube.

local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Start()
	local music = FindNodeByName("cs_5_2_music")
	
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek3 = GetActor("dalek3")
	local dalek4 = GetActor("dalek4")
	local doc_loc = FindNodeByName("doctor_drop_locator")
	local amy_loc = FindNodeByName("amy_drop_locator")
	local syl_loc = FindNodeByName("sylvia_fusebox_locator")
	local syl_disc = FindNodeByShortName("EM_ENTITY_Interact_Disc_2")

	SayPrep("skip", "")
	HideLetterBox()
	
	syl_disc:Trigger()
	
	doctor:EnablePhysics()
	doctor:Teleport(doc_loc)
	doctor:EnableStealth()
	doctor:SetBehaviour("pc")
	
	amy:EnablePhysics()
	amy:Teleport(amy_loc)
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	amy:EnableStealth()

	sylvia:EnablePhysics()
	sylvia:Teleport(syl_loc)

	dalek4:GetTransform():Trigger()
	dalek4:DisablePhysics()	
	
	dalek3:GetTransform():Trigger()
	dalek3:EnablePhysics()
	
	SetGlobalObjectiveState("Dalek_1_2", 3)
	AddGlobalObjective("Dalek_1_3")
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
	WaitFrame()
	WaitFrame()
	WaitFrame()
	WaitFrame()	
	OverlayManager:ShowTutorial("STEALTHV2")
end