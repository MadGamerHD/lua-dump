global function Interact()
	local doctor = GetActor("doctor")
	local sensor = FindNodeByName("DalekSensor")

	SayPrep("skip", "")

	if doctor:IsInventoryItem(sensor) then
		--NEW*
		--VO
		--Examine storeroom door console unlocked
			doctor::SID_1292:With the Internal Sensor, this door should open automatically.
	else
		--VO
		--Examine storeroom door console locked
			doctor::SID_0595:The door is deadlocked. We'll need a Dalek's Internal Sensor to get through.
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local sensor = FindNodeByName("DalekSensor")	
	local screwdriver = FindNodeByName("screwdriver")
	local RandomRef = FindNodeByName("RandomRefusalScript")

	SayPrep("skip", "")

	if doctor:IsInventoryItem(sensor) and doctor:IsUsingInventoryItem(screwdriver) then
		--VO
		--Use sonic on storeroom door (got sensor)
			doctor::SID_1293:Now we have the Dalek Sensor there is no need to use the Sonic.
	elseif doctor:IsUsingInventoryItem(screwdriver) then
		--VO
		--Use sonic on storeroom door (no sensor)
			doctor::SID_2038:If I use the Sonic I may cause an alert. If we can find a Dalek Sensor it should open automatically.
	else
		RandomRef.script.RandomRefusal()
	end
end
