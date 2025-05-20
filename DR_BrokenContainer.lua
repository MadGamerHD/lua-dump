global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO 
		--Doctor examines the broken bottle
			doctor::SID_1575:I can't believe it's escaped! I have to hurry, Amy must be in more danger than I thought!
	else
		--VO
			amy::SID_2521:I think it's too late to do anything about that now.		
	end
end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end
