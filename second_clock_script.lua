global function Interact()
	local amy = GetActor("amy")
	local loc = FindNodeByName("amy_open")
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractHigh") --2.3
	local clock = FindNodeByName("ClockProp")
	local clock_int = FindNodeByName("second_clock_int")
	
	amy:SetBehaviour("wait")
	amy:SetTarget(loc)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	
	Wait(1)
	amy:PlayAnim(anim,2,0.1)
	
	Wait(0.6)
	amy:StopAnim(0.6)
	
	Wait(0.3)
	FindNodeByName("Safe_Open_Sound"):Trigger()
	clock:MoveOnPivot(FindNodeByName("ClockPos2"), 1, "lerp",FindNodeByName("ClockPos1"))

	clock_int:StopTrigger()

	FindNodeByName("LaserInteractable"):Wake()

	amy:SetBehaviour("pc")
	
end