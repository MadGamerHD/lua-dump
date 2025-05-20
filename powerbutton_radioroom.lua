global script_node
global state
global wire_down
--local SwitchOff = script_node:FindNodeByTag("SwitchOff")
--local SwitchProp = script_node:FindProp()
local SwitchLocator = FindNodeByName("loc_powerbutton")
local anim = FindNodeByPartialName("amy_Anim_AMY_Interact1m")
--local anim = FindNodeByTag("TheDoctor_Anim_Interact_1m")

wire_down = false
state="off"

global function InteractMoveFinished()
	local amy = GetActor("amy")
	if amy:GetBehaviour() == "dead" then
		return
	end

	--amy:SetCallback(script_node, "InteractAnimFinished")
	amy:PlayAnim(anim, 1, 0.1)
	Wait(1)
--end

--global function InteractAnimFinished()
	local amy = GetActor("amy")
	if amy:GetBehaviour() == "dead" then
		return
	end

	amy:SetBehaviour("pc")
	SayPrep("skip", "")
	

	
	if state=="off" then
		--SwitchProp:Move(SwitchOff, 0.5, "lerp")
		state="on"
		local Switch = FindNodeByName("switch_up")
		Switch:StopTrigger()
		Switch = FindNodeByName("switch_down")
		Switch:Trigger()
		local danger_triggers = FindNodeByName("trigger_live_wire_amy")
		danger_triggers:Trigger()
		danger_triggers = FindNodeByName("trigger_live_wire_slave")
		danger_triggers:Trigger()
		--VO
		--Interact with power button
		amy::SID_0854:I've turned the power on.

		
	else
		--SwitchProp:MoveToOrigin(0.5, "lerp")
		state="off"
		local Switch = FindNodeByName("switch_down")
		Switch:StopTrigger()
		Switch = FindNodeByName("switch_up")
		Switch:Trigger()
		--VO
		--Interact with power button
		amy::SID_0855:I've turned the power off.

		local danger_triggers = FindNodeByName("trigger_live_wire_amy")
		danger_triggers:StopTrigger()
		danger_triggers = FindNodeByName("trigger_live_wire_slave")
		danger_triggers:StopTrigger()
	end
end

global function Interact()
	local amy = GetActor("amy")
	SayPrep("skip", "")	
	if(wire_down == false) then
		--VO
		--interacting with powerswitch before the wire is in place
		amy::SID_2407:That switch must control the power to one of the circuits.
	else
		amy:SetTarget(SwitchLocator)
		amy:SetMoveTime(1)
		amy:SetCallback(script_node, "InteractMoveFinished")
		amy:SetBehaviour("move")
	end

end
