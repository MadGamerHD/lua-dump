global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	
	SayPrep("skip", "")
	if player:IsEqual(doctor) then		
	--VO
	--Examine secondary console of visualiser eye
		doctor::SID_0730:This is beyond repair.
	else
	--VO
	--Examine primary/secondary console of visualiser eye
		amy::SID_0888:I don't think we can use this anymore.
	end
end
