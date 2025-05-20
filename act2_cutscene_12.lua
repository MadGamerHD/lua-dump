--12
--played when third console hacked
--ends and players much go to lift

global function Start()
	local doctor = GetActor("doctor")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	local music = FindNodeByName("music_12")
	
	PlayMusic(music)
	
	doctor:SetBehaviour("wait")
	VisEye:Sleep()
	VisEye:Hide()
	VisEye:CutsceneReset()
	ShowLetterBox()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local Start1 = FindNodeByName("DocConsole1")
	local Start2 = FindNodeByName("AmyConsole1")
	local stealth1 = FindNodeByName("ActivateStealth5")
	local stealth2 = FindNodeByName("ActivateStealth6")
	local chronon = FindNodeByTag("Chronon")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
	local theme = FindNodeByName("dalek_city_theme_def")

	chronon:SyncDataFromDef()
	sonic:StopTrigger()
	
	doctor:Teleport(Start1)
	doctor:SetBehaviour("pc")
	amy:Teleport(Start2)
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	HideLetterBox()
	stealth1:Wake()
	stealth2:Wake()

	PlayMusic(theme)
	
	AddGlobalObjective("Dalek_2_4")

	FindNodeByName("lua_transition").script.BlackScreen(4)

	--*NEW
	--VO
	--Explanation after truncated cutscene 12.
		doctor::SID_1052:We'll have to find a way to get upstairs and talk to the Dalek Emperor.
end
