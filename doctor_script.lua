local doctor = GetActor ("doctor")

if (not IsLoadingSavedGame()) then
	local screwdriver = FindNodeByName("screwdriver")

	doctor: AddInventoryItem (screwdriver)
end

	doctor:DisableTeeter()

global function UpdateHint()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--Temp storage for these items.
        --VO
        --Examine with other deadlocked door
		doctor::SID_0598:Locked. This area must be restricted.
end

global function NoPoint()
		local RandomRef = FindNodeByName("RandomRefusalScript")
		RandomRef.script.RandomRefusal()
end
	
global function NotGoingToWork()
		local RandomRef = FindNodeByName("RandomRefusalScript")
		RandomRef.script.RandomRefusal()
end


global function SealedAndAnother()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--VO
	--Examine research door
		doctor::SID_0621:The Sensor won't open this door it must be higher security. There must be another way in.
end

global function Sealed()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--VO
	--Examine atrium door alternate 
		doctor::SID_0599:This door is sealed shut. It doesn't seem the right way.
end
