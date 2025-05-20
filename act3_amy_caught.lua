global amy_in_place

global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cyberslave7 =GetActor("cyberslave7")
	local cyberslave8 =GetActor("cyberslave8")
	local loc1 = FindNodeByName("loc_caught_cyberslave1")
	local loc2 = FindNodeByName("loc_caught_cyberslave2")
--	local loc3 = FindNodeByName("loc_panelb_amy_route3")
	local loc4 = FindNodeByName("amy_lift")
	local loc5 = FindNodeByName("cyber7_lift")
	local loc6 = FindNodeByName("cyber8_lift")
	local cam1 = FindNodeByName("CutSceneCamera_1")
	local platform_c = FindNodeByName("prop_pn_lift_c")
	local loc_platform_c = FindNodeByName("loc_pn_lift_c")
	local panel_b_script = FindNodeByName("script_lift_Panel_b")
	local panel_c_script = FindNodeByName("script_lift_panel_c")
	local plead = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Pleading")
	local turn180 = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnLeft180")
	local platform_a = FindNodeByName("prop_pn_lift_1")
	local loc_platform_a = FindNodeByName("loc_pn_lift_1")
	local lift_start = FindNodeByName("audio_lift_start")  --0.49s
	local lift_end = FindNodeByName("audio_lift_end")  --1.54s
	local talk = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_talk negative 1")
	local sting = FindNodeByName("10s_shock_sting")

	panel_b_script.script.cutscene_played = true
	panel_c_script.script.cutscene_played = true
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	cyberslave7:Teleport(loc1)
	cyberslave8:Teleport(loc2)

	if(amy_in_place == nil) then
		platform_c:Move(loc_platform_c, 0.5, "lerp")
		Wait(0.5)
	end
	
	Wait(2.5)
	PlayMusic(sting)
	
	Wait(0.5)
	lift_end:Trigger()	
	
	Wait(1)
	amy:PlayAnimBlendOut(plead,1,0.5,0.5)

	SayPrep("skip", "")
	--CUT SCENE 10.2
	--Amy caught by slaves
		amy::SID_0472:Doctor! Help me.

	cam1:CutTo()
	amy:Teleport(loc4)
	cyberslave7:Teleport(loc5)
	cyberslave8:Teleport(loc6)
	
	doctor:SetTarget(amy)
	doctor:Face(1,"sine")
	doctor:SetFocus(amy)
	doctor:PlayAnimBlendOut(talk,1,1,1)
		doctor::SID_0473:Amy! Leave her alone! Don't you dare hurt her! Amy!

	Wait(2)
	platform_a:Move(loc_platform_a, 1.2, "lerp")
	lift_start:Trigger()
	Wait(1)
	lift_end:Trigger()
	
	amy:PlayAnim(turn180,1,0)
	Wait(2)
	SayPrep("skip", "async")
	--To himself
		doctor::SID_0474:Think-think-think! Where are they taking her? It must be to the Control Room up there. I don't have much time.
		Wait(1)
		doctor:ClearFocus()
	--SayPrep("skip", "")	
end

global function end_cutscene()	
	local doctor = GetActor("doctor")
	local amy=GetActor("amy")	
	local cyberslave7 =GetActor("cyberslave7")
	local cyberslave8 =GetActor("cyberslave8")
	local loc1 = FindNodeByName("loc_caught_cyberslave3")
	local loc2 = FindNodeByName("loc_caught_cyberslave4")
	local loc4 = FindNodeByName("loc_amyToConversion")
	local music = FindNodeByName("background_music")

	PlayMusic(music)
	
	amy:Teleport(loc4)
	cyberslave7:Teleport(loc1)
	cyberslave8:Teleport(loc2)

	doctor:ClearFocus()
	HideLetterBox()
	doctor:SetBehaviour("pc")
	
	--Find out where Amy has been taken
	SetGlobalObjectiveState("Cyber_3_2_2", 2) -- 2 is unlock, 3 is done
end
