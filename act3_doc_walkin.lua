global function Trigger()
	local doctor = GetActor("doctor")
	local cyberslave0 = FindNodeByName("Cyberslave_0")
	local cyberslave1 = FindNodeByName("Cyberslave_floor1")
	local cyberslave2 = FindNodeByName("Cyberslave_floor2")	
	local cyberslave3 = FindNodeByShortName("EM_ENTITY_Cyberslave_3")
	local cyberslave4 = FindNodeByShortName("EM_ENTITY_Cyberslave_4")
	local cyberslave6 = FindNodeByShortName("EM_ENTITY_Cyberslave_6")
	local cyberslave10 = FindNodeByShortName("EM_ENTITY_Cyberslave_10")
	local cyber4 = GetActor("cyberman_4")
	local cyber5 = GetActor("cyberman_5")
	local loc = FindNodeByName("doc_walkin")
	local cutscene11 = FindNodeByName("Cutscene_11")
	local idle = FindNodeByShortName("EM_ANIMATOR_Cyberman_Anim_CYB_Idle")
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")	
	doctor:SetTarget(loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	cyberslave0:StopTrigger()
	cyberslave1:StopTrigger()
	cyberslave2:StopTrigger()	
	cyberslave3:StopTrigger()
	cyberslave4:StopTrigger()
	cyberslave6:StopTrigger()	
	cyberslave10:StopTrigger()	
	
	cyber4:PlayAnim(idle,100,0)
	cyber4:DisableAnimLoop()
	cyber5:PlayAnim(idle,100,0)
	cyber5:DisableAnimLoop()

	Wait(1)
	ShowFade()
	
	Wait(1)
	HideFade()

	cutscene11:Trigger()
end