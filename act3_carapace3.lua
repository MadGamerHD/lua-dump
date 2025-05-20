global function Interact()
	local amy = GetActor("amy")
	local object_states = FindNodeByName("object_states_script")
	local amy_carapace = FindNodeByName("amy_carapace_interact")
	local doc_carapace2 = FindNodeByName("doc_carapace_interact2")
	local cutscene_20 = FindNodeByName("cutscene_20")

	SayPrep("skip", "")	
	
	amy:SetBehaviour("wait")

	object_states.script.GeneratorState = 4
	amy_carapace:StopTrigger()
	doc_carapace2:Trigger()

	amy:DisableStealth()

	SetGlobalObjectiveState("Dalek_3_5_1", 3)		
	
	cutscene_20:Trigger()
end
