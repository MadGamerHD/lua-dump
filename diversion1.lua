global script_node

global function Interact()
	local doctor = GetActor("doctor")
	--REDUNDANT
	--Interact with part of databank on the way to the visualiser
		doctor::SID_1039:Maybe I can distract that dalek with a little sabotage?
end

global function dalekArrived1()
	local dalek = FindNodeByTag("dalek4")
	local waypoint = FindNodeByName("DalekTP1")
	dalek:SetBehaviour("guard")
	Wait(10)
	dalek:SetTarget(waypoint)
	dalek:SetMoveTime(3)
	dalek:SetCallback(script_node, "dalekArrived2")
	dalek:SetBehaviour("move")
end

global function dalekArrived2()
	local dalek = FindNodeByTag("dalek4")
	dalek:SetBehaviour("guard")
end

global function Use()
	local dalek = FindNodeByTag("dalek4")
	local doctor = GetActor("doctor")
	local eye_script = FindNodeByName("eye_disabled_script_0")
	local RandomRef = FindNodeByName("RandomRefusalScript")
	local screwdriver = FindNodeByName("screwdriver")
	local waypoint = FindNodeByName("DalekMove1")
	
	if doctor:IsUsingInventoryItem(screwdriver) then
		--REDUNDANT
		-- Doctor has used screwdriver on databank to cause a distraction.
			doctor::SID_1040:That should give us a few seconds of peace.
		dalek:SetTarget(waypoint)
		dalek:SetMoveTime(2)
		dalek:SetCallback(script_node, "dalekArrived1")
		dalek:SetBehaviour("move")
	else
		RandomRef.script.RandomRefusal()
	end
end
