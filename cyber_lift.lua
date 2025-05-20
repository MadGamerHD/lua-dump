global script_node
global state

state="up"

global function Trigger()
	local doctor = GetActor("doctor")
	local UpLocator = FindNodeByName("loc_cyb_lift_route_up")
	local DownLocator = FindNodeByName("loc_cyb_lift_route_down")
	local music = FindNodeByName("background_music")

	PlayMusic(music)
	doctor:DisableStealth()
	
	if(state == "up") then
		doctor:SetTarget(UpLocator)
	else
		doctor:SetTarget(DownLocator)
	end

	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "InteractMoveFinished")
end

global function InteractMoveFinished()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft180")
	local platform_c = FindNodeByName("prop_cyb_lift")
	local loc_platform_c = FindNodeByName("loc_cyb_lift")
	local chair_pos = FindNodeByName("chair_pos")
	local chair_script = FindNodeByName("amy_chair_script")

	chair_script.script.SetAmyInChair() 

	amy:DisablePhysics()
	amy:Teleport(chair_pos)

	Wait(0.25)
	doctor:PlayAnimBlendOut(turn,1,0.5, 0.5)

	Wait(0.25)
	if state=="up" then
		platform_c:Move(loc_platform_c, 4, "lerp")
		state="down"
	else
		platform_c:MoveToOrigin(4, "lerp")
		state="up"
	end
	
	Wait(4.25)
	doctor:SetBehaviour("pc")
end