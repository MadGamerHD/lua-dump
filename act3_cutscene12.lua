global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("CS12_music")
	local ambience = FindNodeByName("ambience_control_room")
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")

	PlayMusic(music)
	ambience:StopTrigger()
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local cyber4 = GetActor("cyberman_4")
	local cyber5 = GetActor("cyberman_5")		
	local cyber6 = GetActor("cyberman_6")		
	local doctor_point = FindNodeByName("loc_cse_doctor1")
	local music = FindNodeByName("music_enter_stealth_def")
	local ambience = FindNodeByName("ambience_active_mothership")
	local c4 = FindNodeByName("cyber4_loc")
	local c5 = FindNodeByName("cyber5_loc")
	
	HideLetterBox()

	doctor:Teleport(doctor_point)
	doctor:EnableStealth()
	doctor:SetBehaviour("pc")

	cyber4:Teleport(c4)
	cyber5:Teleport(c5)
	cyber4:SetBehaviour("guard")
	cyber5:SetBehaviour("guard")
	cyber6:GetTransform():Trigger()
	
	--Wake the cybermen
	SetGlobalObjectiveState("Cyber_3_3", 3) -- 2 is unlock, 3 is done
	--adds new objective
	--Rescue Amy
	AddGlobalObjective("Cyber_3_4")
	--Locate the conversion chamber
	SetGlobalObjectiveState("Cyber_3_4_1", 2) -- 2 is white
	--Sneak past the patrolling cyberslaves
	SetGlobalObjectiveState("Cyber_3_4_2", 2) -- 2 is white
	--release Amy from the chair
	SetGlobalObjectiveState("Cyber_3_4_3", 1) -- 1 is blue

	PlayMusic(music)
	ambience:Trigger()
end