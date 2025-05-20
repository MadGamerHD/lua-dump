global function Interact()
	local sabotage_time = FindNodeByName("sabotage_time")
	local cutscene_21 = FindNodeByName("cutscene_21")
	
	--stop generator explosions
	sabotage_time:StopTrigger()
	
	SetGlobalObjectiveState("Dalek_3_6_2",3)
	
	cutscene_21:Trigger()
end