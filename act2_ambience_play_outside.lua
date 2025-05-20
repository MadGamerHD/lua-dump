
global function Trigger()
	local ambience = FindNodeByName("ambience_outside_GSO")
	ambience:Trigger()
	local ambience = FindNodeByName("ambience_inside_GSO")
	ambience:StopTrigger()
	
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:Trigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:Trigger()
	
	
	
end




