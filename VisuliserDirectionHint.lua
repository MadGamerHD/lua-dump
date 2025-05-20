global function Start()
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)    

	doctor:SetBehaviour("wait")	
	LockActorCamera()
	ShowLetterBox()
	
	if (hint == "hint_241a" or hint == "hint_241b") then
		--VO
		--If the Doctor tries to go back to Production when needs Lift
			doctor::SID_1161:We need to use the Lift to reach the Council Chamber.
	else
		--VO
		--If the Doctor trys to go back into Production when needs Visualiser Room
			doctor::SID_0958:The Visualiser Room is in the other direction!
	end
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	FreeActorCamera()
	doctor:SetBehaviour("pc")
end
