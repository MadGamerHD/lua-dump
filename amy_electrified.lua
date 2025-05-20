global function Trigger()
	--Amy death to go in here
	
	local amy=GetActor("amy")
--	SayPrep("skip", "async")
--	amy::[AMY WALKS INTO ELECTRICS AND DIES]
--	Wait(2)
	amy:Die("electric")
end
	
global function another_cutscene()
	local amy=GetActor("amy")
	--SayPrep("skip", "async")
	
--	amy::[CYBERSLAVE WALKS INTO ELECTRICS AND DIES]
--	Wait(3)
	local cutscene = FindNodeByName("radio_room_csc2")
	cutscene:Trigger()
	local danger_triggers = FindNodeByName("trigger_live_wire_amy")
	danger_triggers:StopTrigger()
	danger_triggers = FindNodeByName("int_power_button")
	danger_triggers:StopTrigger()


end