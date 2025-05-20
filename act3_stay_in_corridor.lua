global first

global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("loc_go_to_corridor")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")

	doctor:SetBehaviour("wait")
	ShowLetterBox()
	LockActorCamera()
		
	doctor:PlayAnimAndWait(turn,1,0.1)

	SayPrep("skip", "async")

	if(first == nil) then
		--VO
		--stopping player from returning to the control room
		doctor::SID_1821:I can't go back in there. They'll kill me too.
		first = 1
	else
		--VO
		--Hint to where Amy is found
		doctor::SID_1822:Amy is somewhere within the ship below. I have to find her.
	end

	doctor:SetTarget(return_spot)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	Wait(2)
	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end
