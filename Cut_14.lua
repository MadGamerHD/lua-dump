global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
		
	ShowLetterBox()

	SayPrep("skip","")
	
	FindNodeByTag("TARDIS1"):Hide()
	FindNodeByTag("TARDIS1"):Sleep()
	FindNodeByTag("TARDIS2"):Wake()
	FindNodeByTag("TARDIS2"):Show()
	FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01_Alt"):EnablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01"):DisablePlsVolumes()
	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01"):DisablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01_Alt"):EnablePlsVolumes();
	
	PlayMusic(FindNodeByName("Cut_14MusicDef"))
end

global function EndScene()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(5)
	
	--Repair the time lesion and reunite with the Doctor(done)
	SetGlobalObjectiveState("Objective_2_4", 3)
	--Answer all questions correctly(done)
	SetGlobalObjectiveState("Objective_2_4_1", 3)
	--Activate the Tachyon Feedback Loop (done)
	SetGlobalObjectiveState("Objective_2_4_2", 3)
	
	EndAct()
end

global function SwitchTARDIS()
	FindNodeByTag("TARDIS1"):Show()
	FindNodeByTag("TARDIS1"):Wake()
	FindNodeByTag("TARDIS2"):Sleep()
	FindNodeByTag("TARDIS2"):Hide()
	FindNodeByTag("Drawing2"):Show()
	FindNodeByTag("Drawing1"):Hide()
	
	FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01_Alt"):DisablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01"):EnablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01_Alt"):DisablePlsVolumes();
	FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01"):EnablePlsVolumes();
end