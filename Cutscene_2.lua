global function PerformCutscene2()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("cs2_music")
	local amb_creak = FindNodeByName("amb_creak")
	local amb_gen = FindNodeByName("amb_gen")
	
	amb_creak:Trigger()
	amb_gen:Trigger()
	PlayMusic(music)	
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function EndCutscene2()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	--should be green!
	local temp_door = FindNodeByTag("cs1_temp_door")
	local amb = FindNodeByName("act1_amb_def")
	local hints_script = FindNodeByName("tutorials")

	PlayMusic(amb)
	
	hints_script.script.after_intro_hints = true

	temp_door:Trigger()
	
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	doctor:Teleport(FindNodeByName("start_loc_doctor"))
	amy:Teleport(FindNodeByName("start_loc_amy"))

	doctor:AddInventoryItem(FindNodeByName("screwdriver"))
	
	FindNodeByName("Flanagan_Trigger"):Trigger()
end
