--local ArriveRightLocator_doc = FindNodeByName("loc_sway_plat_arrive_right_doc")
--local ArriveRightLocator_amy = FindNodeByName("loc_sway_plat_arrive_right_amy")
--local LeftLocator_doc = FindNodeByName("loc_sway_plat_left_doc")
--local LeftLocator_amy = FindNodeByName("loc_sway_plat_left_amy")
--local PreRightLocator_amy = FindNodeByName("loc_sway_plat_pre_right_amy")

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local RightLocator_doc = FindNodeByName("loc_sway_plat_right_doc")
	local RightLocator_amy = FindNodeByName("loc_sway_plat_right_amy")
	local platform = FindNodeByName("prop_sway_platform")
	local loc_platform = FindNodeByName("loc_sway_platform")
	local gantry_sound1 = FindNodeByName("audio_gantry_start")  --0.758s
	local gantry_sound2 = FindNodeByName("audio_gantry_middle")  --1.87s
	local gantry_sound3 = FindNodeByName("audio_gantry_stop")  --0.9s
	local ArriveLeftLocator_doc = FindNodeByName("loc_sway_plat_arrive_left_doc")
	local ArriveLeftLocator_amy = FindNodeByName("loc_sway_plat_arrive_left_amy")
	
	--TEMP
	local PreRight  = FindNodeByName("loc_sway_plat_pre_right_amy")
	
	doctor:DisableStealth()
	amy:DisableStealth()
	
	Wait(0.5)
	doctor:SetBehaviour("wait")
	doctor:SetTarget(RightLocator_doc)
	doctor:SetMoveTime(1.5)
	doctor:SetBehaviour("move")

	--TEMP
	amy:Teleport(PreRight)

	amy:SetTarget(RightLocator_amy)
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")

	Wait(2.5)
	platform:Move(loc_platform, 3.5, "lerp")
	Wait(0.4)
	gantry_sound1:Trigger()
	Wait(0.75)
	gantry_sound2:Trigger()
	Wait(1.86)
	gantry_sound3:Trigger()

	Wait(0.5)
	doctor:SetTarget(ArriveLeftLocator_doc)
	doctor:SetMoveTime(1.5)
	doctor:SetBehaviour("move")

	amy:SetTarget(ArriveLeftLocator_amy)
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")

	Wait(2.5)
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
end
