global teleported_chisholm


global function Trigger()
	local doctor = GetActor("doctor")
	--HINT
	--Remininding the player that they have to get Chisholm across too. Shouting to be heard.
	doctor::SID_1146: Don't worry. I will find a way to get you across.
end

global function RedundantTrigger()
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_climb2")
	doctor:Teleport(locator)
--	if(teleported_chisholm == nil) then
--		local chisholm = GetActor("chisholm")
--		chisholm:Teleport(locator)
--		teleported_chisholm = true
--	end

	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.UnlockLocator(5)
	chisholm_script.script.UnlockLocator(6)
	chisholm_script.script.UnlockLocator(7)
	
end
