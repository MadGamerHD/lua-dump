global script_node

global function Hint()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)                 
	local doctor = GetActor("doctor")

	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO
		--The Doctor tries to use the TARDIS door
		doctor::SID_1801:I'm not going out there again!
	else
		--VO Amy examines door in act 2.
		amy::SID_2461:Locked, can't open it.
	end

end

global function Interact()
	Hint()
end

global function Use()
end

