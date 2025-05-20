local maincam = FindNodeByName("CutSceneCamera_0")
local doccam = FindNodeByName("CutSceneCamera_1")
local amycam = FindNodeByName("CutSceneCamera_2")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local portal_arrival_def = FindNodeByName("portal_arrival_def")
	local skaro_tense_def = FindNodeByName("skaro_tense_def")
--	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy_0")

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	ShowLetterBox()
	SayPrep("skip", "")	

	Wait(1)
	PlayMusic(portal_arrival_def)
	amy:StopInvisibilityFading()
	doctor:GetTransform():Trigger()
	amy:GetTransform():Trigger()

	Wait(3)
	PlayMusic(skaro_tense_def)

	Wait(0.5)
	doccam:CutTo()
	--[[ACT THREE]]
	--CUT SCENE 16
	--INT. RUINED KAALANN. SUPREME COUNCIL CHAMBER -- DAY
	--A flash of light. And The Doctor and Amy appear out of nowhere - mid air - and fall to the floor. 
	--It's the supreme council chamber, but this one is ruined - before the Daleks returned to Skaro and re-built Kaalann.
		doctor::SID_0700:Are you all right?
	amycam:CutTo()
		amy::SID_0701:Yes. What happened? 
	maincam:CutTo()
		doctor::SID_0702:Those temporal coordinates, remember? This is Kaalann just before the Daleks returned to it with the Eye of Time. 
	--But amid the wreckage of the disused council chamber - the brand new magnetic field generators have been installed.
	--And the gangway is in place. Amy notes.
		amy::SID_0703:But it looks like it will be coming soon.
		doctor::SID_0704:And it won't be long before the Emperor sends more Daleks after us through the Eye. We have to be ready for them.
	amycam:CutTo()
		amy::SID_0705:What do we do?
	maincam:CutTo()
--	doctor:SetFocus(amy_ent)

		doctor::SID_0706:Set a trap.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local theme = FindNodeByName("dalek_city_theme_def")
	
	PlayMusic(theme)
	
	HideLetterBox()	

--	doctor:ClearFocus()
	doctor:SetBehaviour("pc")
	amy:SetBehaviour("follow")
	
	AddGlobalObjective("Dalek_3_1")
end