global function StartScene()
	local amy = GetActor("amy")

	ShowLetterBox()
	
	amy:SetBehaviour("wait")

	PlayMusic(FindNodeByName("Cut_8MusicDef"))
end

global function EndScene()
	--Assemble the Tractor Beam and rescue the Doctor (done)
	SetGlobalObjectiveState("Objective_1_4", 3)
	--Aim the Tractor Beam with the controls and fire (done)
	SetGlobalObjectiveState("Objective_1_4_2", 3)

	EndAct()

	FindNodeByName("lua_transition").script.BlackScreen(3)
end

global function switchAB()
	local doctor = GetActor("doctor")

	doctor:Hide()

	FindNodeByTag("TARDIS1"):Hide()
	FindNodeByTag("TARDIS1"):Sleep()

	FindNodeByTag("TARDIS2"):Wake()
	FindNodeByTag("TARDIS2"):Show()

	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01"):DisablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01_Alt"):EnablePlsVolumes();
end
