global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local player = FindPlayer()
	
	SayPrep("skip", "")	
	
	if player:IsEqual(doctor) then
	--*NEW
	--VO
	--Examine Eye of Time control console (turned on)
		doctor::SID_1045:I can't use this without Amy.
	else
	--*NEW
	--VO
	--Examine Eye of Time control console (turned on)
		amy::SID_1046:It seems to be active but I can't use it.
	end
end
