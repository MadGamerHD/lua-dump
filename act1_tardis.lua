--starts act
--ends and switches to 1.1

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local tard_amb = FindNodeByName("tard_amb")	
	local traf_amb = FindNodeByName("traf_amb")	
	local music = FindNodeByName("music_1")

	SayPrep("skip", "")
	CutToLetterBox()

	traf_amb:StopTrigger()
	tard_amb:Trigger()
	PlayMusic(music)

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	doctor:DisableWalls()
	amy:DisableWalls()
end

global function End()
	local cutscene_1_1 = FindNodeByName("cutscene_1_1")
	
	cutscene_1_1:Trigger()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(4)
end
