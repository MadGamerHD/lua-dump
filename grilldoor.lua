global function Interact()
	local doctor = GetActor("doctor")

	print ("examine grilldoor","\n")
	SayPrep("skip", "")
	
	--VO
	--Examine tube grill door
		doctor::SID_0552:The platform Gate is locked.
end

global function Use()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	local cutscene_4 = FindNodeByName("cutscene_4")

	if doctor:IsUsingInventoryItem(screwdriver) then
		cutscene_4:Trigger()
	end
end
