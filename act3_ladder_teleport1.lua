global script_node

global function Interact()
	
	local doctor = GetActor("doctor")
	local locator = FindNodeByName("loc_ladder_teleport1_1")

	doctor:DisableWalls()	
	doctor:SetTarget(locator)
	doctor:SetBehaviour("move")
	doctor:SetMoveTime(2)
	doctor:SetCallback(script_node,"MoveDone")
end

global function MoveDone()
	ShowLetterBox()
	local cam_angle = FindNodeByName("Show_ladder0")
	cam_angle:Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local down = FindNodeByName("int_ladder_teleport1")
	local up = FindNodeByName("int_ladder_teleport2")
	local drop = FindNodeByPartialName("Anim_DRW_ClimbDown3m") --2.9s
	--local drop = FindNodeByShortName("EM_ANIMATOR_TheDoctor_anim_DRW_Climbdown1m")
	local locator1 = FindNodeByName("loc_ladder_teleport1_2")
	local locator2 = FindNodeByName("loc_ladder_teleport1_3")

	doctor:PlayAnim(drop,1,0.5)
	
	Wait(1.5)
	doctor:EnableWalls()
	ShowFade()
	
	Wait(1)
	doctor:Teleport(locator1)
	amy:Teleport(locator2)
	HideFade()

	Wait(1)
	--up:Trigger()
	--down:StopTrigger()
	HideLetterBox()
	doctor:SetBehaviour("pc")	
	SaveCheckpoint()	
end
