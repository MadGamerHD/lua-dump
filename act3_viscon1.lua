global function Interact()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")	
	--VO
	--Examine primary console of visualiser eye
		doctor::SID_0728:If I give this a boost we may be able to restore power for a little while.
end

global function Use()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	local common_scripts = FindNodeByName("common_scripts")	
	local cutscene_18 = FindNodeByName("cutscene_18")

	SayPrep("skip", "")
	if doctor:IsUsingInventoryItem(screwdriver) then
		cutscene_18:Trigger()
	else
		--other objects
		common_scripts.script.RandomRefusal()
	end
end