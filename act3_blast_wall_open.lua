global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local door_effect = FindNodeByShortName("EM_ANIMATOR_Wall_Explode:0")
	local wall = FindNodeByTag("weak_wall")
	local red_button = FindNodeByName("script_red_button")
	local ControlScript = FindNodeByName("Laser_puzzle_scripts")
--	local waypoint_doc = FindNodeByName("loc_wall_doc1")
	local laser_sound = FindNodeByName("audio_laser_hit")  --5.02s	
	local collapse_sound = FindNodeByName("audio_door_collapse")  --3.3s
	local hero = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_HeroicPose")
	local talk1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1")
	local talk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")
	local talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")
	local turn90 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft90")
	local turn180 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft180")
	--local idle3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03")
	local talka1 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Generic1")
	local idlea2 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle2")
	local sting = FindNodeByName("10s_exp_sting")

	ControlScript.script.TurnOffAllControlsLast()
	Stop2dMode()
	StopPOIWait()	
	
	ShowLetterBox()
	doctor:SetBehaviour("wait")

	laser_sound:Trigger()
	
	Wait(2)
	door_effect:Trigger()
	collapse_sound:Trigger()
	
	Wait(1)
	wall:StopTrigger()
	door_effect:StopTrigger()
	red_button.script.TurnOffAllLasers()

	Wait(0.5)
	doctor:PlayAnimBlendOut(hero,1,0.5,0.5)

	Wait(0.5)
	PlayMusic(sting)
	SayPrep("skip", "")
	--CUT SCENE 12.1
	--wall blasted open with lasers
		doctor::SID_0482:Yes! That did the trick!
	amy:PlayAnimBlendOut(talka1,1,0.5,0.5)
	doctor:PlayAnimBlendOut(turn180,1,0.5,0.75)	
		amy::SID_0483:Let's get out of here. They're almost through the door.
	doctor:SetFocus(amy)
	amy:SetFocus(doctor)
	doctor:PlayAnimBlendOut(talk1,1,0.5,0.5)	
		doctor::SID_1540:First I need to get back to the Control Room.
	--doctor:PlayAnimBlendOut(idle3,1,0.5,0.5)
		amy::SID_1541:Back to the Control Room? Why?
	doctor:PlayAnimBlendOut(talk2,1,0.5,0.5)
	amy:PlayAnimBlendOut(idlea2,1,1,0.5)	
		doctor::SID_1542:Because I need to stop the Cybermen.
		amy::SID_1543: How?
	doctor:ClearFocus()
	amy:ClearFocus()
	doctor:PlayAnimBlendOut(talk3,1,0.5,0.5)	
		doctor::SID_1544:Not quite sure, yet. Come on.  
	doctor:PlayAnim(turn90,1,0.5)
end

global function end_cutscene()	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local laser0=FindNodeByName("int_laser0")
	local laser1=FindNodeByName("int_laser1")
	local laser2=FindNodeByName("int_laser2")
	local mirror0=FindNodeByName("int_mirror0")
	local mirror1=FindNodeByName("int_mirror1")
	local mirror2=FindNodeByName("int_mirror2")
	local jump_point=FindNodeByName("jump_point7")
	local platform_c = FindNodeByName("prop_swivel_pl_a")
	local climb = FindNodeByName("int_climb1")
	local cs13trigger = FindNodeByName("Trigger_Chis_Rescue")
	local music = FindNodeByName("background_music")
	local panel_h_script = FindNodeByName("lift_panel_h_script")
	local int_amy = FindNodeByName("int_amy")

	panel_h_script.script.cutscene_12_1_played = true	

	ResetPlayerCamera()
		
	doctor:ClearFocus()
	doctor:EnablePhysics()
	amy:ClearFocus()
	amy:EnablePhysics()
	
	
	laser0:StopTrigger()
	laser1:StopTrigger()
	laser2:StopTrigger()
	mirror0:StopTrigger()
	mirror1:StopTrigger()
	mirror2:StopTrigger()
	jump_point:StopTrigger()
	platform_c:MoveToOrigin(0.5, "lerp")
	climb:Trigger()
	cs13trigger:Trigger()  
	int_amy:Trigger()

	HideLetterBox()
	PlayMusic(music)
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	--Locate weak wall
	SetGlobalObjectiveState("Cyber_3_5_1", 3) -- 2 is unlock, 3 is done	
	--blast through wall
	SetGlobalObjectiveState("Cyber_3_5_2", 3) -- 2 is unlock, 3 is done
	
	--Adds new objective
	--Put the cybermen back to sleep
	AddGlobalObjective("Cyber_3_6")
	--Get back tot the control room
	SetGlobalObjectiveState("Cyber_3_6_1", 2) -- 2 is white
	-- Reconfigure the computer
	SetGlobalObjectiveState("Cyber_3_6_2", 1) -- 1 is blue
end
