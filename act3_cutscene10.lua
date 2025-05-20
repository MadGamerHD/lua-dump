global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local music = FindNodeByName("CS10_music")

	ShowLetterBox()
	
	PlayMusic(music)

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_point = FindNodeByName("loc_doctor1_csb")
	local amy_point = FindNodeByName("loc_amy1_csb")
	local music = FindNodeByName("music_enter_stealth_def")

	HideLetterBox()
	
	doctor:Teleport(doc_point)
	doctor:SetBehaviour("pc")

	amy:Teleport(amy_point)
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	PlayMusic(music)
	
	--Find a way through the tunnels
	SetGlobalObjectiveState("Cyber_3_1", 3) -- 2 is unlock, 3 is done
	--Find a way to the controlroom
	AddGlobalObjective("Cyber_3_2")
	--Negotiate the gantries
	SetGlobalObjectiveState("Cyber_3_2_1", 2) -- 2 is unlock, 3 is done
end
