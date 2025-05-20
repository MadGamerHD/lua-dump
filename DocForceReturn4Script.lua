global function Start()
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)    

	doctor:SetBehaviour("wait")	
	LockActorCamera()
	ShowLetterBox()
	
	if (hint == "hint_241a" or hint == "hint_241b") then
		--VO
		--If the Doctor tries to go back to Production when needs Lift
			doctor::SID_1162:The Lift is just behind us.
	else
		--VO
		--If the Doctor trys to go back into Production when needs Visualiser Room
			doctor::SID_1033:I need to head back to the Visualiser Room!
	end
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	FreeActorCamera()
	doctor:SetBehaviour("pc")
end
