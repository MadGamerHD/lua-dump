global script_node
global model
global first

first = 1

global function Interact()
	local doctor = GetActor("doctor")
	local SwitchLocator = FindNodeByName("loc_lift_panel_erf")
	local cam = FindNodeByName("turn_and_up")

	if first == 1 then
		ShowLetterBox()
		cam:Trigger()
		doctor:SetTarget(SwitchLocator)
		doctor:SetMoveTime(2)	
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node, "InteractMoveFinished")
	else
		--VO
		--Use panel to turn and raise platform when raised.
			doctor::SID_2213:The platform is in place. So there is no need to reset it.
	end
end

global function InteractMoveFinished()
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	local click = FindNodeByName("audio_panel_click")
	
	doctor:PlayAnim(anim, 1, 0.1)
	doctor:DisableAnimLoop()
	doctor:SetCallback(script_node, "InteractAnimFinished")
	
	Wait(1.2)
	click:Trigger()
end

global function InteractAnimFinished()
	local doctor = GetActor("doctor")
	local platform_a = FindNodeByName("prop_swivel_plat2")
	local loc_platform_a = FindNodeByName("loc_swivel_plat2_turn")
	local loc_platform_b = FindNodeByName("loc_swivel_plat2")
	local gantry_start = FindNodeByName("audio_gantry_start")  --0.758s
	local gantry_stop = FindNodeByName("audio_gantry_stop")  --0.9s
	local pivot = FindNodeByName("platform_pivot")
	
	platform_a:MoveOnPivot(loc_platform_a, 1, "lerp", pivot)
	gantry_start:Trigger()
	Wait(0.8)
	gantry_stop:Trigger()
	
	Wait(0.5)
	platform_a:MoveOnPivot(loc_platform_b, 1, "lerp", pivot)
	gantry_start:Trigger()
	Wait(0.8)
	gantry_stop:Trigger()
end

global function End()
	local doctor = GetActor("doctor")
	local int_use = FindNodeByName("int_lift_panel_e")
	local int_exa = FindNodeByName("int_lift_panel_e1")

	first = 2
	HideLetterBox()
	int_exa:Trigger()
	int_use:StopTrigger()
	doctor:SetBehaviour("pc")
end

global function Use()
	local doctor = GetActor("doctor")
	
	--VO
	--Use Sonic on working panel.
		doctor::SID_2214:These controls are working so the Sonic is no use here.
end
