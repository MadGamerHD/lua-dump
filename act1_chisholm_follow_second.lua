

global function Trigger()
	local chisholm = GetActor("chisholm")
	local chisholm_script = FindNodeByName("chisholm_script")

	chisholm_script.script.UnlockLocator(4)
	chisholm_script.script.UnlockLocator(5)
	local ambience = FindNodeByName("ambience_inner_cave")
	ambience:StopTrigger()	
	local ambience = FindNodeByName("ambience_far_cave")
	ambience:Trigger()	
end