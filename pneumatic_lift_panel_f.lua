global cutscene_14_played
global script_node
global model
global state

state="down"

global function Interact()
	local doctor = GetActor("doctor")	

	--VO
	--Interact with broken control panel (2nd).
		doctor::SID_2215:Another broken panel. 
end

global function Use()
	local doctor = GetActor("doctor")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3

	if cutscene_14_played then
	--VO
	--Use Sonic with broken control panel after escape.
		doctor::SID_2216:There is no time to lose. We have to get out of here.
	else
		doctor:SetBehaviour("wait")
		doctor:SetTarget(model)
		doctor:Face(0.5,"sine")
		
		Wait(0.5)
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
		doctor:PlayAnim(anim, 1, 0.1)
		doctor:SetCallback(script_node, "InteractAnimFinishedSonic")
	end
end

global function InteractAnimFinishedSonic()
	local doctor = GetActor("doctor")
	local platform_a = FindNodeByName("prop_pn_lift_1")
	local loc_platform_a = FindNodeByName("loc_pn_lift_1")
	local lift_start = FindNodeByName("audio_lift_start")  --0.49s
	local lift_end = FindNodeByName("audio_lift_end")  --1.54s

	if state=="up" then
		platform_a:Move(loc_platform_a, 1.2, "lerp")
		lift_start:Trigger()
		Wait(1)
		lift_end:Trigger()
		state="down"
	else
		platform_a:MoveToOrigin(1.2, "lerp")
		lift_start:Trigger()
		Wait(1)
		lift_end:Trigger()
		state="up"
	end

	doctor:SetBehaviour("pc")
end
