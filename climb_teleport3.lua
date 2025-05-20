global function Trigger()
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_climb3")
	doctor:Teleport(locator)
	
	
	local chisholm = FindNodeByName("chisholm_script")
	local chisholm_ready = chisholm.script.chisholm_pos

	
	if(chisholm_ready == 5) then

	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.UnlockLocator(10)
	--	chisholm.script.chisholm_pos = 6
	--	chisholm = GetActor("chisholm")
	--	chisholm:Teleport(FindNodeByName("loc_chisholm6"))
	
	end
end