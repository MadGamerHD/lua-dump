
global function run_cutscene()
	local control = FindNodeByTag("skidoo_control")
	control:StopTrigger()
	local winch = FindNodeByTag("winch")
	winch:StopTrigger()

	local doctor = GetActor("doctor")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	Wait(1)
	HideFade()
	local music = FindNodeByName("CS3_music")
	PlayMusic(music)
	
	Wait(20)
		local wall = FindNodeByTag("ice_barrier")
	local skidoo = FindNodeByTag("fact_skidoo")
	skidoo:Trigger()
	wall:StopTrigger()
end	

global function end_cutscene()
	--CutToFade()
	local script_trans = FindNodeByName("lua_transition")
	script_trans.script.BlackScreen(6)

	
	local doctor = GetActor("doctor")
	local chisholm = GetActor("chisholm")
	local amy = GetActor("amy")
	
	
	
	local control = FindNodeByTag("rope_model")
	control:StopTrigger()

	local SatNav = FindNodeByName("SatNav")
	if (doctor:IsInventoryItem(SatNav) or amy:IsInventoryItem(SatNav)) then
	else
		FindNodeByTag("sat_nav"):Trigger()
	end
	
	
	local skidoo = FindNodeByTag("skidoo_model")
	skidoo:StopTrigger()

	Wait(0.15)
	local loc_node =FindNodeByName("loc_doctor_end_cs3")
	doctor:Teleport(loc_node)
	local chisholm_node =FindNodeByName("loc_chisholm_end_cs3")
	chisholm:Teleport(chisholm_node)
	Wait(0.2)
	--HideFade()
	
--	local chisholm = GetActor("chisholm")
--	local chisholm_script = FindNodeByName("chisholm_script")
--	chisholm_script.script.UnlockLocator(1)
--	chisholm_script.script.UnlockLocator(2)
--	chisholm_script.script.UnlockLocator(3)
--	chisholm_script.script.UnlockLocator(4)

	local wall_script = FindNodeByName("script_ice_barrier")
	wall_script.script.path_clear = true

	SayPrep("skip", "")
	--HINT
	chisholm::SID_1532: I'm sorry, but I won't be able to climb anything.
	--HINT
	doctor::SID_1533:Don't worry. I'll make a route that's easier for you.
	
	HideLetterBox()
	doctor:SetBehaviour("pc")	
	
	chisholm_node =FindNodeByName("loc_chisholm_end_cs3_1")
	chisholm:SetTarget(chisholm_node)
	chisholm:SetMaxSpeed(1)
	chisholm:SetBehaviour("move")
	
	
	--Hoist Chisholm to the TARDIS
	SetGlobalObjectiveState("Cyber_1_2_4", 3) -- 2 is unlock, 3 is done
	
	--Get back to the TARDIS
	AddGlobalObjective("Cyber_1_4")
	SetGlobalObjectiveState("Cyber_1_4_1", 2) -- 2 is unlock, 3 is done
	--Make sure CHisholm can follow
	SetGlobalObjectiveState("Cyber_1_4_2", 2) -- 2 is unlock, 3 is done
	local music = FindNodeByName("background_music")
	PlayMusic(music)
--	local redundant_actors = FindNodeByName("ChisholmGary_Actor")
--	redundant_actors:StopTrigger()
--	redundant_actors = FindNodeByName("ChisholmPat_Actor")
--	redundant_actors:StopTrigger()

	Wait(1)
	chisholm:SetBehaviour("move")
	
end
