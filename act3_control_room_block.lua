global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("doc_turn_loc")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	
	doctor:SetBehaviour("wait")
	ShowLetterBox()	
	LockActorCamera()

	doctor:PlayAnimAndWait(turn,1,0.1)
	
	SayPrep("skip", "async")
	--VO
	--Stopping player from not returning to control room
		doctor::SID_2228:I need to get down those lifts.

	doctor:SetTarget(return_spot)	
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2)
	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end
