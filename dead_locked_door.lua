global function Interact()
	local doctor=GetActor("doctor")
	SayPrep("skip","async")
	--VO
	--generic response to locked door
	doctor::SID_0259: Locked.
end

global function Use()
	local doctor=GetActor("doctor")
--	local screwdriver = FindNodeByName("Screwdriver")
--	if doctor:IsUsingInventoryItem(screwdriver) then
--		SayPrep("skip","async")
		--VO
		--generic response to dead-locked door
--		doctor::SID_0260: This door is dead-locked. The Sonic is no good.
--	else
		FindNodeByName("common_scripts").script.RandomRefusal()	 
--	end

end
