global script_node
global first
global know_about_code

global function Trigger()
	local doctor=GetActor("doctor")
	local loc=FindNodeByName("loc_lab_panel") 
	doctor:Teleport(loc)
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	doctor:PlayAnim(anim,1,0.5)

end

global function Interact()
		local doctor=GetActor("doctor")
		local amy=GetActor("amy")
		local cabinet=FindNodeByName("script_file_cabinet") 
		local got_code = cabinet.script.got_birthday
		SayPrep("skip", "async")
		if(got_code) then
			--VO
			--interact with code panel
			doctor:SetBehaviour("wait")
			doctor:DisableStealth()
			amy:DisableStealth()
			local loc_doc = FindNodeByName("loc_lab_panel")
			doctor:SetTarget(loc_doc)
			doctor:SetMoveTime(1.5)
			doctor:SetBehaviour("move")
			WaitFrame()
			doctor::SID_0193: I bet the good professor used her daughter's birthday as the Code.
			Wait(1.5)
			WaitFrame()
			local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
			doctor:PlayAnim(anim,1,0.5)
			Wait(4)
			local door=FindNodeByName("prop_lab_door") 
			local loc_door=FindNodeByName("loc_lab_door_open")
			--local loc_door=FindNodeByName("lab_door_pos")
			--local loc_door=FindNodeByName("loc_lab_door")
			local audio_door = FindNodeByName("audio_GSO_door_open")
			audio_door:Trigger()
			door:Move(loc_door, 1.2, "lerp")
			--VO. success opening the coded door
			doctor::SID_0194: Bingo!
			Wait(1)
			ShowFade()
			local me=FindNodeByName("int_lab_code_panel") 
			local cutscene = FindNodeByName("meeting_meadows")
			local cutscene = FindNodeByName("Cutscene_7")
			Wait(1)
			cutscene:Trigger()
			me:StopTrigger()
		else
			local doctor=GetActor("doctor")
			if(first == nil) then
			first = 1
				--VO
				--interacting with the locked lab door without code, first time.
				doctor::SID_2201:It's a Keycode lock. The name tag says Meadows.
				know_about_code = true
				--explore the base
				SetGlobalObjectiveState("Cyber_2_3_1", 3) -- 2 is unlock, 3 is done
				--find the code to the lab door
				SetGlobalObjectiveState("Cyber_2_3_2", 2) -- 2 is unlock, 3 is done
			else
			
			--VO
			--interacting with the locked lab door without code
			doctor::SID_0195:It's a Keycode lock. But I haven't got the Code.
			end
			
		end
end

global function Use()
	local doctor=GetActor("doctor")
	local keycard = FindNodeByName("key_card")
	if (doctor:IsUsingInventoryItem(keycard)) then
		--VO
		--using sonic with the locked lab door without code
		doctor::SID_0196: No, that won't work here. This panel needs a code.
	else
		local common_scripts=FindNodeByName("common_scripts")
		common_scripts.script.RandomRefusal()
	end
	
	if(first == nil) then
	first = 1
		--find the code to the lab door
		SetGlobalObjectiveState("Cyber_2_3_2", 2) -- 2 is unlock, 3 is done
	end

end
