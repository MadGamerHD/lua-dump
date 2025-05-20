global first

global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("loc_return_to_lab")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	LockActorCamera()
	

	SayPrep("skip", "async")
	doctor:PlayAnimAndWait(turn,1,0)
	--VO
	--Stopping player from quitting lab.
	doctor::SID_2206:I need to create the serum straight away.

	doctor:SetTarget(return_spot)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2)
	HideLetterBox()	
	FreeActorCamera()
	doctor:SetBehaviour("pc")
end
