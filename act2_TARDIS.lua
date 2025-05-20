global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip", "")
	if (FindPlayer():GetName()==amy:GetName()) then
		--VO
		--Examine TARDIS
		amy::SID_1887: I wish we could just leave, but we need to see this through.
	else
		--VO
		--Examine TARDIS
		doctor::SID_1888:I promised Chisholm I'd help before I leave.
	end
end
