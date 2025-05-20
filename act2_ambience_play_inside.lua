


	
global function Trigger()
	local ambience = FindNodeByName("ambience_outside_GSO")
	ambience:StopTrigger()
	local ambience = FindNodeByName("ambience_inside_GSO")
	ambience:Trigger()
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:StopTrigger()
	
end