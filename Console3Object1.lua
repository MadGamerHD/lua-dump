global function Interact()
	local PanelScript = FindNodeByName("Console3InteractableScript")
	local amy = GetActor("amy")
	local hint = QueryObjective(0)          
	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1870:Mic / water dispenser- The microphone is for the voice recorder, and broadcasting messages. The water dispenser is for diluting samples for testing.
	else
		--VO Console Control Text
		amy::SID_1871:Don't know what this is for, but I've seen the Doctor fill the kettle from it. Surely it can't just be for that?
	end

	FindNodeByName("Console3InteractableScript").script.Object1State = 1
	FindNodeByName("AllControlsScript").script.InteractDone()
--	FindNodeByName("CombinationScriptControl").script.CheckCombination()

end

global function Use()
	local amy = GetActor("amy")
end
