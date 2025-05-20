global script_node
global valve_closed
global first
global model
local common_scripts = FindNodeByName("common_scripts")
local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable")
--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow")

global function Trigger()
		local amy = GetActor("amy")
		local waypoint = FindNodeByName("loc_release_button_amy2")
		amy:Teleport(waypoint)

		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_IdletoTurnValveIdle") --0.8s
		amy:PlayAnimAndWait(anim, 1, 0)
		
	

		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValve") -- 1.5s

		amy:PlayAnimAndWait(anim, 1, 0)
		


		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValveIdletoIdle") -- 1s

		amy:PlayAnimAndWait(anim, 1, 1.0)
		amy:StopAnim(0.5)
		--amy:SetBehaviour("wait")

end


global function Interact()
	local doctor =GetActor("doctor")
	local amy =GetActor("amy")
	--local loc = FindTransform()
	local loc = script_node:FindNodeByTag("loc_valve_wheel")
	SayPrep("skip","")
	local doctor_player =common_scripts.script.DoctorIsPlayer()
	if(doctor_player) then	
		--VO
		--interacting with valve wheel
		doctor::SID_0140: It says "Valve control". This Wheel adjusts the steam pressure. 
	else
		local loc = script_node:FindNodeByTag("loc_valve_wheel_amy")
		amy:SetTarget(loc)
		amy:SetMoveTime(1)
		amy:SetBehaviour("move")
		Wait(1)
	

	if(script_node:GetName()=="script_valve_wheel1") then
		FindNodeByName("int_valve_wheel1"):StopTrigger()
		FindNodeByName("int_valve_wheel1_examine"):Trigger()
	else
		FindNodeByName("int_valve_wheel2"):StopTrigger()
		FindNodeByName("int_valve_wheel2_examine"):Trigger()
	end
		SayPrep("skip","async")
		--VO
		--interacting with valve wheel
		amy::SID_0141: I'll just turn this Wheel and close the Valve. Now the Steam has nowhere to go.
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_IdletoTurnValveIdle") --0.8s
		amy:PlayAnimAndWait(anim, 1, 0)
		anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValve") -- 1.5s
		local audio_valve = FindNodeByName("audio_valve_squeak") --s0.57
		audio_valve:Trigger()
		amy:PlayAnimAndWait(anim, 1, 0)
		anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_TurnValveIdletoIdle") -- 1s
		amy:PlayAnimAndWait(anim, 1, 1.0)
		--find a tool to use against cyberslave
		SetGlobalObjectiveState("Cyber_2_2_1", 3) -- 2 is unlock, 3 is done
		--block the flow of the steam vent
		SetGlobalObjectiveState("Cyber_2_2_2", 3) -- 2 is unlock, 3 is done
		--steam the slave
		SetGlobalObjectiveState("Cyber_2_2_3", 2) -- 2 is unlock, 3 is done
		amy:SetBehaviour("pc")
		SayPrep("skip","")
	end
	valve_closed = true
end

global function Interact_examine()
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		local doctor=GetActor("doctor")
		--VO
		doctor::SID_1883:The Steam in now building up inside.
	else
		local amy=GetActor("amy")
		--VO
		amy::SID_1884:The Steam in now building up inside.
		--find a tool to use against cyberslave
		SetGlobalObjectiveState("Cyber_2_2_1", 3) -- 2 is unlock, 3 is done
		--block the flow of the steam vent
		SetGlobalObjectiveState("Cyber_2_2_2", 2) -- 2 is unlock, 3 is done
		--block the flow of the steam vent
		SetGlobalObjectiveState("Cyber_2_2_2", 3) -- 2 is unlock, 3 is done
	end
end
