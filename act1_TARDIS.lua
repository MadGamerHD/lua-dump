global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip", "")
	if (FindPlayer():GetName()==amy:GetName()) then
		--VO
		--Examine TARDIS
		amy::SID_1809: I wish we were back inside, but we can't leave just yet.
	else
		--VO
		--Examine TARDIS
		doctor::SID_1810: We can't leave before I know where that distress signal came from.
	end
end
