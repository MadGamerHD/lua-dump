global first

global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("loc_go_back_to_lift")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	
	doctor:SetBehaviour("wait")
	ShowLetterBox()	
	LockActorCamera()

	doctor:PlayAnimAndWait(turn,1,0.1)

	SayPrep("skip", "async")
	--VO
	--Stopping player from not returning to the lift
		doctor::SID_1836:We need to get out of here. Now!

	doctor:SetTarget(return_spot)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(3)
	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end
