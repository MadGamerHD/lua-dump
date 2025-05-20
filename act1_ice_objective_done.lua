

global function Trigger()

	-- move across with timing
	SetGlobalObjectiveState("Cyber_1_7_1", 3) -- 2 is unlock, 3 is done
	-- don't fall of
	SetGlobalObjectiveState("Cyber_1_7_2", 3) -- 2 is unlock, 3 is done
	
	local platform = FindNodeByName("script_sway_platform1")
	platform.script.go_creaking = false
	platform = FindNodeByName("script_sway_platform2")
	platform.script.go_creaking = false
	platform = FindNodeByName("script_sway_platform3")
	platform.script.go_creaking = false
end