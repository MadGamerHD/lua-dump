global script_node
global model
global state
global first
global cutscene_played
global play_lift_arrive

local platform_a = FindNodeByName("prop_pn_lift_a")
local loc_platform_a = FindNodeByName("loc_pn_lift_a")
local platform_b = FindNodeByName("prop_pn_lift_c")
local loc_platform_b = FindNodeByName("loc_pn_lift_c")
local lift_start = FindNodeByName("audio_lift_start")  --0.49s
local lift_end = FindNodeByName("audio_lift_end")  --1.54s

state = "up"
play_lift_arrive = true

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	local SwitchLocator = FindNodeByName("loc_lift_panel_b")
	local cam0 = FindNodeByName("timeline_panel_b_cam0")
	local cam1 = FindNodeByName("timeline_panel_b_cam1")
	local doc_idles = FindNodeByName("doc_idles")
	
	if(doctor_player) then	
		if cutscene_played then
			doctor:SetTarget(SwitchLocator)
			doctor:SetMoveTime(2)		
			doctor:SetBehaviour("move")
			doctor:SetCallback(script_node, "InteractMoveFinished")
		else
			cam1:Trigger()
			ShowLetterBox()
			
			doctor:SetTarget(SwitchLocator)
			doctor:SetMoveTime(2)		
			doctor:SetBehaviour("move")
			doctor:SetCallback(script_node, "InteractMoveFinished")
		end
	else
		cam0:Trigger()
		ShowLetterBox()
	
		doc_idles:Sleep()
		amy:SetTarget(SwitchLocator)
		amy:SetMoveTime(2)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node, "InteractMoveFinishedAmy")
	end	
end

-----

global function InteractMoveFinished()
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	local click = FindNodeByName("audio_panel_click")
	
	doctor:ClearFocus()
	doctor:PlayAnim(anim, 1, 0.1)
	doctor:DisableAnimLoop()
	doctor:SetCallback(script_node, "InteractAnimFinished")

	Wait(1.2)
	click:Trigger()
end

global function InteractMoveFinishedAmy()
	local amy = GetActor("amy")
	local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractPanelWallCode") --2.16s
	--local anim_amy = FindNodeByPartialName("amy_Anim_AMY_Interact1m")
	local click = FindNodeByName("audio_panel_click")
	
	amy:PlayAnim(anim_amy, 1, 0.1)
	amy:DisableAnimLoop()
	amy:SetCallback(script_node, "InteractAnimFinishedAmy")

	Wait(1)
	click:Trigger()	
end

-----

global function AmyRouteToPlatform()
	local amy = GetActor("amy")
	local loc = FindNodeByName("loc_panelb_amy_route3")

	Wait(1)
	amy:SetTarget(loc)
	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	amy:SetCallback(script_node, "AmyInPlace")
end

global function DoctorRouteToPlatform()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("loc_pn_lift_a_route")

	Wait(0.5)
	doctor:SetTarget(loc)
	doctor:SetMoveTime(2.5)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "DocInPlace")
end

-----

global function InteractAnimFinished()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local cutscene_10_2 = FindNodeByName("cutscene_10_2")
	local cutscene_script = FindNodeByName("cutscene_10_2_script")
	local talk = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointRight")
	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor_2")
	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy_0")

	if state=="up" then
		platform_a:Move(loc_platform_a, 1, "lerp")
		platform_b:Move(loc_platform_b, 1, "lerp")
		lift_start:Trigger()
		Wait(0.8)
		lift_end:Trigger()
		state="down"
	else
		platform_a:MoveToOrigin(1, "lerp")
		platform_b:MoveToOrigin(1, "lerp")
		lift_start:Trigger()
		Wait(0.8)
		if play_lift_arrive then		
			lift_end:Trigger()
		end
		state="up"
	end
	
	if(first == 2) then
		first = 3
		SayPrep("skip","")		
		doctor:SetFocus(amy_ent)
		doctor:PlayAnimBlendOut(talk,1,1,0.5)
		--Doctor asks Amy to move onto platform before 10.2
			doctor::SID_2032:Amy could you give me a hand?
		amy:SetFocus(doc_ent)
			amy::SID_2033:Sure.
		--Amy moves to position to go up
		AmyRouteToPlatform()
	elseif(first == 3) then
		first = 4
		--Amy is in position and platform goes up
		amy:ClearFocus()	
		play_lift_arrive = true	
		cutscene_script.script.amy_in_place = true
		cutscene_script.script.camera_position = 1
		cutscene_10_2:Trigger()
	else
		--Amy has gone up and Doctor goes back to pc (10.2 done)
		doctor:SetBehaviour("pc")
	end
end

global function InteractAnimFinishedAmy()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
--	local loc1 = FindNodeByName("loc_panelb_amy_route1")
	local loc2 = FindNodeByName("loc_panelb_amy_route2")
	
	if state=="up" then
		platform_a:MoveToOrigin(1, "lerp")
		platform_b:Move(loc_platform_b, 1, "lerp")
		lift_start:Trigger()
		Wait(0.8)
		lift_end:Trigger()	
		state="down"
	else
		platform_a:Move(loc_platform_a, 1, "lerp")
		platform_b:MoveToOrigin(1, "lerp")
		lift_start:Trigger()
		Wait(0.8)
		lift_end:Trigger()
		state="up"
	end

	if(first == nil) then
		first = 1
		--Doctor walks onto lift
		DoctorRouteToPlatform()
	else
		first = 2
		--Amy has raised Doc so he takes over

		amy:SetTarget(loc2)
		amy:SetMoveTime(2)
		amy:SetBehaviour("move")
		--HINT
		--Amy tells Doctor she will wait at location
			amy::SID_2307:I'll take this Lift next, Doctor. 
	end
end

-----

global function DocInPlace()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local turn180 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft180")
	
	SayPrep("skip", "")
	--HINT
	--Ask Amy to press a button
		doctor::SID_0471:Right, Amy. Press the button.
	
	doctor:PlayAnim(turn180,1,0.5)
	
	--Amy Auto does button
	InteractMoveFinishedAmy()
end

global function AmyInPlace()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local turnleft = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnLeft90")
	
	amy:PlayAnimBlendOut(turnleft,1,0.5,0.5)
	play_lift_arrive = false
	
	--Doctor Auto does button
	InteractMoveFinished()
end

-----

global function Use()
	local doctor = GetActor("doctor")

	--VO
	--Use Sonic on panel.
		doctor::SID_2034:The controls are fine so there is no need to use the Sonic.
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	doctor:SetBehaviour("pc")
end
