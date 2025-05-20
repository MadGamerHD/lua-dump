global function Trigger()
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_back_up1")
	doctor:Teleport(locator)
	
end