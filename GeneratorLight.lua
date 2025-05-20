global script_node
global played_cutscene_5i

local generator_script = FindNodeByName("GeneratorGameplayScript")
local light = script_node:FindNodeByTag("controlled_light")
local is_light_active = false
local time_light_on_remaining = 0
local have_done_vo_hint = false
local divers_killed = 0

global function Interact()
	local doctor= GetActor("doctor")
	local loc = FindNodeByName("doc_use_lights_loc")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	local camera_pos = FindNodeByName("light_lookat_loc")
	local beep = FindNodeByName("lights_beep")

	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	
	Wait(1)
	doctor:PlayAnim(anim,2,0.1)

	Wait(0.5)
	beep:Trigger()

	Wait(0.5)
	doctor:StopAnim(0.5)
	
	--5.i
	--has it NOT done cut scene?
	if not played_cutscene_5i then
		played_cutscene_5i = true
		
		SetPOIPosAndLookZ(camera_pos)
		BeginPOI(1.25, 2, 1.25, true, true)

		ShowLetterBox()
		
		-- Turn on the light
		generator_script.script.ActivateLight()
		light:SetAttr("IntensityMultiplier", 10)
		light:Trigger()
		is_light_active = true
		time_light_on_remaining = 2
				
		Wait(0.2)
		
		if generator_script.script.num_divers_dead == 2 then
			SayPrep("skip","async")
			--*NEW
			--VO
			doctor::SID_2698:Great that's the last of them.
		elseif generator_script.script.num_divers_dead == 1 then
			SayPrep("skip","async")
			--*NEW
			--VO
			doctor::SID_2677:Brilliant, now all I need is to wait for the next diver.
		else
			SayPrep("skip","async")
			--*NEW
			--VO
			doctor::SID_2615:Ah, now if only I could get the divers into that alcove...
		end

		Wait(4.8) --POI ends
		
		HideLetterBox()
	else
		-- Turn on the light
		generator_script.script.ActivateLight()
		light:SetAttr("IntensityMultiplier", 10)
		light:Trigger()
		is_light_active = true
		time_light_on_remaining = 2
	
		Wait(0.2)

		SayPrep("skip","")
		
		if generator_script.script.num_divers_dead == 2 then
			--*NEW
			--VO (duplicate)
			doctor::SID_2699:Great that's the last of them.
		elseif generator_script.script.num_divers_dead == 1 then
			--*NEW
			--VO (duplicate)
			doctor::SID_2678:Brilliant, now all I need is to wait for the next diver.
		else
			--*NEW
			--VO (duplicate)
			doctor::SID_2700:I need to get the divers into that alcove.
		end
	end

	doctor:SetBehaviour("pc")
end

global function Idle()
	if(is_light_active) then
		time_light_on_remaining = time_light_on_remaining - GetTimeStep()
		if(time_light_on_remaining < 0) then
			is_light_active = false
			light:StopTrigger()
			generator_script.script.DeactivateLight()
		end
	end
end
