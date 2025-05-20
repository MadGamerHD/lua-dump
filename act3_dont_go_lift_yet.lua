global first

global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("loc_go_to_control_room")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")

	doctor:SetBehaviour("wait")
	ShowLetterBox()	
	LockActorCamera()

	doctor:PlayAnimAndWait(turn,1,0.1)

	SayPrep("skip", "async")

	if(first == nil) then
		--VO
		--stopping player from returning to the lift
			doctor::SID_1834:I can't go back out without Amy.
		first = 1
	else
		--VO
		--Hint to where Amy is found
			doctor::SID_1835:I need to go further up to find Amy, not back out.
	end

	doctor:SetTarget(return_spot)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2)
	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end
