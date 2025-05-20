global first

global function Trigger()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	LockActorCamera()
	
	local return_spot = FindNodeByName("loc_remember_chicholm1")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	
	
	doctor:PlayAnimAndWait(turn,1,0)
	
	SayPrep("skip", "async")
	--Wait(1)
	if(first == nil) then
		--VO
		--Remininding the player that they have to get Chisholm across too.
		doctor::SID_1147: I have to make sure Chisholm can follow before I go any further.
		first = 1
	else
		--VO
		--Hint to get Chisholm across
		doctor::SID_1148: How can I bridge that gap down there?
	end
	
	doctor:SetTarget(return_spot)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	Wait(2)
	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end
