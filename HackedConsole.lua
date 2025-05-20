global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	--New
	--VO when player interacts with a reconfigured console in the visualiser room
		doctor::SID_1044:This Console has already been reconfigured.
end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end
