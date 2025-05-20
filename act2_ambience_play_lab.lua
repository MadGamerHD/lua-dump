global function Trigger()
	local ambience = FindNodeByName("ambience_lab")
	ambience:Trigger()
	local ambience = FindNodeByName("ambience_inside_GSO")
	ambience:StopTrigger()
	
end