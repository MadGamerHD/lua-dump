
global function Trigger()
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_climb1")
	doctor:Teleport(locator)

	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.UnlockLocator(1)
	chisholm_script.script.UnlockLocator(2)
end