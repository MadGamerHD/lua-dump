global function PerformCutscene9()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
--	local oswald = GetActor("oswald")
--	local dana = GetActor("dana")
--	local jones = GetActor("jones")
	local door = FindNodeByName("Heavy_Door_Lab")
	local music = FindNodeByName("cs9_music")

	PlayMusic(music)
	
	door:StopTrigger()

	ShowLetterBox()
	Wait(0.5)
	HideFade()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	SayPrep("", "")
end

global function StopMusicBeforeLoad()
	StopMusic()
	FindNodeByName("amb_creaks"):StopTrigger()
end

global function EndCutscene9()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
	
	EndAct()
end
