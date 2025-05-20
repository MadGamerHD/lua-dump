global function Trigger()
	local ambience1 = FindNodeByName("ambience_active_mothership")
	local ambience2 = FindNodeByName("ambience_conversion_room")

	ambience1:Trigger()
	ambience2:StopTrigger()
end