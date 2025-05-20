--9
--played on start of act
--ends and player must interact with dalek helmet

global script_node

global function Start()
	local doctor = GetActor("doctor")
	local music = FindNodeByName("cutscene_9_wav_def")
	local chronon = FindNodeByTag("Chronon")

	chronon:StopTrigger()	
			
	SayPrep("skip", "")
	doctor:SetBehaviour("wait")
	CutToLetterBox()
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_waypoint = FindNodeByName("amy_waypoint")
	local theme = FindNodeByName("dalek_city_theme_def")
	local chronon = FindNodeByTag("Chronon")
	local tardis = FindNodeByShortName("EM_ENTITY_TARDIS:0")
	
	chronon:StopTrigger()	
	tardis:Trigger()
	
	doctor:SetBehaviour("pc")
	ResetPlayerCamera()
	HideLetterBox()
	PlayMusic(theme)

	AddGlobalObjective("Dalek_2_1")

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(4)

	amy:SetTarget(amy_waypoint)
	amy:SetMoveTime(6)
	amy:SetBehaviour("move")
	amy:SetCallback(script_node, "AtLoc")
end

global function AtLoc()
	local amy = GetActor("amy")
	local amy_chronon_loc = FindNodeByName("ChrononAmy1Loc")

	amy:SetTarget(amy_chronon_loc)
	amy:SetMoveTime(6)
	amy:SetBehaviour("move")
end