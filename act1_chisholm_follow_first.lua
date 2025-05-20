

global function Trigger()
	local chisholm = GetActor("chisholm")
	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.UnlockLocator(1)
	chisholm_script.script.UnlockLocator(2)
		chisholm_script.script.UnlockLocator(3)

end