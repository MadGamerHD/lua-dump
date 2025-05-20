--4 (ACTIVE)
--plays on using sonic with grill door.
--ends when sylvia begins talking...

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local music = FindNodeByName("music_4")

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(2)
	
	PlayMusic(music)
	
	sylvia:GetTransform():Trigger()
	
	SayPrep("skip", "")
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_loc = FindNodeByName("doctor_platform_locator")
	local amy_loc = FindNodeByName("amy_platform_locator")	
	local syl_loc = FindNodeByName("sylvia_platform_locator")
	local cutscene_5a = FindNodeByName("cutscene_5a")
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw_0")
	local pipe = FindNodeByShortName("EM_ANIMATOR_SylviasPipe:0")
	
	sylvia:GetTransform():Trigger()	
	doctor:Teleport(doc_loc)
	amy:Teleport(amy_loc)
	sylvia:Teleport(syl_loc)
	sonic:StopTrigger()
	
	--TEMP
	pipe:StopTrigger()
		
	SetGlobalObjectiveState("Dalek_1_1_3", 3)
	AddGlobalObjective("Dalek_1_2")

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(2)

	cutscene_5a:Trigger()
end