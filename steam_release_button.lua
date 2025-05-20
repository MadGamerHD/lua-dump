global script_node
global model
global first
global first_clue
local stop_vent
local slave_in_sight
local doctor_in_sight
local loc 
local loc_doc 

local common_scripts = FindNodeByName("common_scripts")

local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable")
--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractLowBend")
--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")

--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow") --3.3s
--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel") --4.0s
local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m") --4.0s


global vent_id




global function Interact()
	local closed
	local FX_steam
	if(script_node:GetName()=="script_steam_release_button1") then
		stop_vent=FindNodeByName("script_valve_wheel1")
		closed = stop_vent.script.valve_closed
		FX_steam = FindNodeByName("steam_FX_1") --s3
		loc = FindNodeByName("loc_release_button_amy1")
		loc_doc = FindNodeByName("loc_release_button_doc1")
		vent_id = 1
	else
		stop_vent=FindNodeByName("script_valve_wheel2")
		closed = stop_vent.script.valve_closed
		FX_steam = FindNodeByName("steam_FX_2") --s3
		loc = FindNodeByName("loc_release_button_amy2")
		loc_doc = FindNodeByName("loc_release_button_doc2")
		vent_id = 2
	end
	SayPrep("skip","")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then			
		local doctor=GetActor("doctor")
		--VO
		--interacting with steam button
		doctor::SID_0137: It says "Turn wheel to release pressure manually." 
	else
		local amy=GetActor("amy")
		if(first == nil) then
			first = 1
			--find a tool to use against cyberslave
			SetGlobalObjectiveState("Cyber_2_2_1", 3) -- 2 is unlock, 3 is done
		end
		if(closed==nil) then
			SayPrep("skip","")
			--VO
			--interacting with steam button
			amy::SID_0138:"Turn wheel to release pressure manually." Only, right now there's no pressure to release.
		else
			SayPrep("skip","async")
			amy:SetTarget(loc)
			amy:SetMoveTime(0.75)
			amy:SetBehaviour("move")
			Wait(0.75)
			local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_IdletoTurnValveIdle") --0.8s
			amy:PlayAnimAndWait(anim, 1, 0)
			anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValve") -- 1.5s
			amy:PlayAnim(anim, 1, 0)
			Wait(0.5)
			local audio_valve = FindNodeByName("audio_valve_squeak") --s0.57
			audio_valve:Trigger()
			
			
			local audio_steam = FindNodeByName("audio_steam_start") --s2
			audio_steam:Trigger()
			FX_steam:Trigger()
			
			

	
	
			

			
			if(vent_id == 1) then
				slave_in_sight = FindNodeByName("script_slave_by_vent1").script.slave_by_vent1
				doctor_in_sight = FindNodeByName("script_doc_by_vent1").script.doctor_by_vent1
			else
				slave_in_sight = FindNodeByName("script_slave_by_vent2").script.slave_by_vent2
				doctor_in_sight = FindNodeByName("script_doc_by_vent2").script.doctor_by_vent2
			end	
			
			if (slave_in_sight) then
				FindNodeByName("script_doctor").script.stop_chase = true
				local cutscene_script_node = FindNodeByName("script_key_card")
				if(vent_id == 1) then
					cutscene_script_node.script.vent_id = 1
					FindNodeByName("script_slave_by_vent2").script.slave_by_vent1 = false
				else
					cutscene_script_node.script.vent_id = 2
					FindNodeByName("script_slave_by_vent2").script.slave_by_vent2 = false
				end
				
				Wait(0.2)
				--local cutscene = FindNodeByName("first_slave_down1")
				local cutscene = FindNodeByName("show_first_slave_fall")
				cutscene:Trigger()
				Wait(2)
				FX_steam:StopTrigger()
			else
				if(doctor_in_sight) then
					local doctor=GetActor("doctor")
					SayPrep("skip","async")
					doctor::SID_2019: Watch it, Amy! 
					Wait(1)
					anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValveIdletoIdle") -- 1s
					amy:PlayAnim(anim, 1, 1.0)
					Wait(1)
					amy:SetBehaviour("pc")


				elseif(first_clue == nil) then
					SayPrep("skip","async")
					--VO
					--interacting with steam button - and steam is actually released.
					amy::SID_0139:Hey. This might work! If I can get the lumbering thing close enough to the Vent...
					Wait(1)
					anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValveIdletoIdle") -- 1s
					amy:PlayAnim(anim, 1, 1.0)
					Wait(1)		
					first_clue = 1
					amy:SetBehaviour("pc")
				else
					Wait(1)
					anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValveIdletoIdle") -- 1s
					amy:PlayAnim(anim, 1, 0)
					amy:SetBehaviour("pc")	
				end
				Wait(1)	
				FX_steam:StopTrigger()
				--block the flow of the steam vent
				SetGlobalObjectiveState("Cyber_2_2_2", 3) -- 2 is unlock, 3 is done
				--steam the cyberslave
				SetGlobalObjectiveState("Cyber_2_2_3", 2) -- 2 is unlock, 3 is done
				amy:SetBehaviour("pc")
			end
		end
	end
end




global function Use()
	FindNodeByName("common_scripts").script.RandomRefusal()
end
