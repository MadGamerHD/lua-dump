global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function end_cutscene()
	local cutscene = FindNodeByName("Cutscene_16")

	-- Get back to the lift
	SetGlobalObjectiveState("Cyber_3_7_1", 3) -- 2 is unlock, 3 is done
	SetGlobalObjectiveState("Cyber_3_6_2", 3) --done

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)

	cutscene:Trigger()
end