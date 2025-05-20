global script_node

global function run_cutscene()
	HideFade()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	Wait(12.3)
	ShowFade()
end


global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_point=FindNodeByName("loc_csc_DocToLab")

	doctor:Teleport(doc_point)
	HideLetterBox()
	
	
	local meadows = FindNodeByTag("meadows")
	meadows:StopTrigger()
	Wait(2)
	amy:SetBehaviour("pc")
	HideFade()
	--Fix the Radio
	AddGlobalObjective("Cyber_2_5")

	--Sub objective
	--FInd a new capacitor
	SetGlobalObjectiveState("Cyber_2_5_1", 2) -- 2 is unlock, 3 is done
	--Replace the capacitor in the radio
	SetGlobalObjectiveState("Cyber_2_5_2", 2) -- 2 is unlock, 3 is done
	--Wanr Fort Cecil
	SetGlobalObjectiveState("Cyber_2_5_3", 2) -- 2 is unlock, 3 is done
	FindNodeByName("snowfall_FX"):StopTrigger()
	SaveCheckpoint()
end