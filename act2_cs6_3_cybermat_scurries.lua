global function run_cutscene()
	local main_cam = FindNodeByName("CutSceneCamera_0")
	local doc_cam = FindNodeByName("CutSceneCamera_1")
	local amy_cam = FindNodeByName("CutSceneCamera_2")
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local loc_doc = FindNodeByName("loc_cs6_3_doc1")
	local loc_amy = FindNodeByName("loc_cs6_3_amy1")
	local loc_doc_focus = FindNodeByName("loc_doc_focus")
	local loc_amy_focus = FindNodeByName("loc_amy_focus")
	

		doctor:Teleport(loc_doc)
		amy:Teleport(loc_amy)
		local mat = GetActor("office_mat")
		mat:SetBehaviour("wait")
		
		local door = FindNodeByName("script_office_door").script.toggle
		if(door == "open") then
			door = FindNodeByName("script_office_door")
			door.script.people_in_door = 0
			door.script.toggle  = "closed"
			--local audio_door = FindNodeByName("audio_GSO_door_close")
			--audio_door:Trigger()
			local left_door=FindNodeByName("prop_office_door") 
			left_door:MoveToOrigin(1, "lerp")
		end
		
		
		SayPrep("skip","async")
		--CUT SCENE 6.3
		--INT - Office in the GSO
		--The Doctor is looking for a code to the lab door so he can get in and talk to Meadows. As he explores he encounters a cybermat. He needs to use the Sonic on it to make it scurry away.
		doctor::SID_0409:Look! A tin can on legs! Meet my can opener!
		
		local music = FindNodeByName("music_shock_10s")
		PlayMusic(music)
		
		Wait(1)
		local sonic_script = FindNodeByName("Sonic_Script:0")
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_Crouch_InteractSS", 0.75)

		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Crouch_InteractSS") --4s
		doctor:PlayAnim(anim, 1, 0.1)
		

		
		Wait(2)
		local hideout = FindNodeByName("loc_office_mat_hide1")
		--mat:SetTarget(hideout)
		mat:DisableSensors()
		mat:DisableWalls()
		--mat:SetBehaviour("move")
		local audio_mat_hiss = FindNodeByName("audio_cybermat_hiss")
		audio_mat_hiss:Trigger()
		Wait(2.5)

		
		mat = FindNodeByName("Cybermat_1")
		mat:StopTrigger()	
	
		loc_doc = FindNodeByName("loc_cs6_3_doc2")		
		doctor:SetBehaviour("wait")
		--amy_cam:CutTo()
		doctor:Teleport(loc_doc)
		doc_cam:CutTo()
		
		loc_amy = FindNodeByName("loc_cs6_3_amy2")
		amy:SetTarget(loc_amy)
		amy:SetMoveTime(1)
		amy:SetBehaviour("move")
		SayPrep("skip","")	
		
		
		--The Doctor uses the sonic on the Cybermat and it scurries away
		amy::SID_0410:It did not like that.
		local music = FindNodeByName("background_music")
		PlayMusic(music)
		doctor:SetTarget(hideout)
		doctor:Face(1, "sine")
		
		--doc_cam:CutTo()
		doctor:SetFocus(hideout)
		doctor::SID_0411:The Sonic signal gives them a Cyber-migraine.
		doctor::SID_0412:The Sonic's frequency keeps them at bay. 
		doctor:ClearFocus()
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking1") -- 4.9s
		--head in hand again
		doctor:PlayAnimBlendOut(anim, 1, 0.5, 0.5)
		
		amy:SetFocus(loc_doc_focus)
		doctor::SID_1023:We might be able to rig something at another frequency to stun or deactivate them.
		--amy_cam:CutTo()
		amy:SetTarget(doctor)
		amy:Face(1, "sine")
		amy:ClearFocus()
		anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive01") -- 3s
		--nod
		amy:PlayAnim(anim, 1, 0)
		amy::SID_0413:That would be good. Those things are worse than spiders.
		amy:SetBehaviour("wait")
		SayPrep("skip","async")
		doctor:SetFocus(loc_amy_focus)
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2") -- 4.0s
		--finger in forehead
		doctor:PlayAnimBlendOut(anim, 1, 0.5,0.5)
		doctor:SetTarget(amy)
		doctor:Face(0.8, "sine")
		doctor::SID_0414:Spiders? I'd rather we changed the subject.
		Wait(1)
		doctor:ClearFocus()
		
		Wait(2.5)
		
		amy:ClearFocus()
		local stealth_fiddler = FindNodeByName("Trigger_stealth")
		stealth_fiddler:Trigger()
			
   
end
