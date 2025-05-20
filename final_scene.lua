global function Start()
	local music = FindNodeByName("music_15")
	local eye_of_time = FindNodeByShortName("EM_ENTITY_Eye_of_Time_FX:0")
	local portaloo = FindNodeByShortName("EM_ENTITY_capsule_for_eye_of_time:0")	
	local sonic = FindNodeByShortName("EM_ANIMATOR_sonic_screw:0")
	local doctor = GetActor("doctor")

	PlayMusic(music)
	portaloo:StopTrigger()
	eye_of_time:Trigger()
	sonic:SyncDataFromDef()
	sonic:Trigger()
	Wait(60)
	doctor:say("WavInStream", "Er, Amy. RUN!")
end

global function End()
	CutToFade()
	EndAct()
end
