global script_node
global state

global function Interact()
	local doctor = GetActor("doctor")
	local cam = FindNodeByName("timeline_panel_d_cam0")
	local SwitchLocator = FindNodeByName("loc_lift_panel_d")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m") --4.07
	local left90 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft90") --1.43
	local click = FindNodeByName("audio_panel_click")
	local platform_c = FindNodeByName("prop_swivel_pl_a")
	local loc_platform_c = FindNodeByName("loc_swivel_pl_a")
	local gantry_start = FindNodeByName("audio_gantry_start")  --0.758s
	local gantry_stop = FindNodeByName("audio_gantry_stop")  --0.9s

	ShowLetterBox()
	cam:Trigger()
		
	doctor:SetTarget(SwitchLocator)
	doctor:SetMoveTime(2)	
	doctor:SetBehaviour("move")

	Wait(2)
	doctor:PlayAnim(anim, 1, 0.1)

	Wait(1.2)
	click:Trigger()
	
	Wait(2.9)
	platform_c:Move(loc_platform_c, 1, "lerp")
	gantry_start:Trigger()

	doctor:PlayAnim(left90,1,0.1)

	Wait(0.8)
	gantry_stop:Trigger()

	SayPrep("","async")
	--VO
	--Observed the Rotating gantry.
		doctor::SID_2209:Excellent.

--	platform_c:MoveToOrigin(1, "lerp")
--	jump:StopTrigger()
--	gantry_start:Trigger()

--	Wait(0.8)
--	gantry_stop:Trigger()
end

global function End()
	local doctor = GetActor("doctor")
	local jump = FindNodeByName("int_Jump4")
	local int1 = FindNodeByName("int_panel_d")	
	local int2 = FindNodeByName("int_panel_d_used")

	jump:Trigger()
	int2:Trigger()
	int1:StopTrigger()
		
	HideLetterBox()
	doctor:SetBehaviour("pc")
end

global function Use()
	local doctor = GetActor("doctor")
	
	--VO
	--Use Sonic on working panel.
		doctor::SID_2210:The controls are working so I don't need to use the Sonic.
end
