global script_node
global model
global state
global first
global cutscene_played
global doc_onlift
global count
global hint

state = "up"
first = 1
count = 1
hint = 1

global function Interact()
	local doctor = GetActor("doctor")	
	local amy = GetActor("amy")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()

	SayPrep("skip","")

	if doctor_player then	
		if cutscene_played then
			if count == 1 then
				--VO
				--Interact with broken control panel (after Amy caught).
					doctor::SID_0883:This panel seems to be broken. Maybe it just needs a little boost.
				count = 0
			else
				--VO
				--Interact with broken control panel (after Amy caught - second time).
					doctor::SID_2394:Without a sonic boost, the panel won’t work.	
			end
		else
			--VO
			--Interact with broken control panel (before Amy caught).
				doctor::SID_2399:Amy is waiting for me by the other lift.
		end
	else
		--VO
		--Interact with broken control panel (amy).
			amy::SID_1539:This control panel doesn't work.
	end	

end

global function Use()
	local doctor = GetActor("doctor")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local cam = FindNodeByName("up_and_down")
	
	if cutscene_played then
		if hint == 4 then
		SayPrep("","async")
		--VO
		--Used the Sonic 3 times without standing on it.
			doctor::SID_2395:Perhaps I should stand on the lift?
			hint = 2
		end
		
		doctor:SetBehaviour("wait")
		doctor:SetTarget(model)
		doctor:Face(0.5,"sine")
			
		Wait(0.5)
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
		doctor:PlayAnim(anim, 1, 0.1)
		doctor:SetCallback(script_node, "InteractAnimFinishedSonic")
	else
		SayPrep("skip","")
		--VO
		--Use Sonic with broken control panel before cut scene.
			doctor::SID_2400:The Sonic would work with this broken panel but I'm not leaving Amy.
	end
end

global function InteractAnimFinishedSonic()
	local doctor = GetActor("doctor")
	local platform_b = FindNodeByName("prop_pn_lift_b")
	local loc_platform_b = FindNodeByName("loc_pn_lift_b")
	local lift_start = FindNodeByName("audio_lift_start")  --0.49s
	local lift_end = FindNodeByName("audio_lift_end")  --1.54s
	local model1 = FindNodeByShortName("EM_ENTITY_control_panel_g")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local doc_end = FindNodeByName("doc_end")
	
	if doc_onlift then
		--go up and leave doc up top
		--moves up
		platform_b:Move(loc_platform_b, 1, "lerp")
		lift_start:Trigger()
		Wait(0.8)
		lift_end:Trigger()
		
		doctor:SetBehaviour("pc")
	else
		--Doc not on lift
		if state=="up" then
			platform_b:Move(loc_platform_b, 1, "lerp")
			lift_start:Trigger()
			Wait(0.8)
			lift_end:Trigger()
			state="down"
		else
			platform_b:MoveToOrigin(1, "lerp")
			lift_start:Trigger()
			Wait(0.8)
			lift_end:Trigger()
			state="up"
		end
		
		hint = hint +1
		doctor:SetBehaviour("pc")
	end
end

global function End()
	local doctor = GetActor("doctor")
	
	HideLetterBox()
	doctor:SetBehaviour("pc")
end
