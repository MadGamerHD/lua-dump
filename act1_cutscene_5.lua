--5 (ACTIVE)
--Played when camera cuts to portal over london.
--Ends and returns to dialogue.

global function Start()
	local music = FindNodeByName("cs5_music")
	
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_wall = FindNodeByName("doctor_wall_locator")
	local amy_wall = FindNodeByName("amy_wall_locator")
	local syl_wall = FindNodeByName("sylvia_wall_locator")
	local cutscene_5_1 = FindNodeByName("cutscene_5_1")
	local music = FindNodeByName("Underground")
	
	PlayMusic(music)
	
	doctor:Teleport(doc_wall)
	amy:Teleport(amy_wall)
	sylvia:Teleport(syl_wall)

	cutscene_5_1:Trigger()

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(2)
	
end