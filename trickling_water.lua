global model
global script_node
local first = 1

global function Interact()
	local doctor = GetActor("doctor")
	--VO
	-- interacting with trickling stream of water.
	doctor::SID_0029: Trickling water.
	if(first == 1) then
		--VO
		doctor::SID_1528:Warm water would revive the Skidoo rider
		first = 2
	end
end

global function Use()
	local MessCaddie = FindNodeByName("MessCaddie")
	local FullMessCaddie = script_node:FindInventoryItem()
 	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	
	if (doctor:IsUsingInventoryItem(MessCaddie)) then
		ShowLetterBox()
		local camera_angle = FindNodeByName("warming_caddie")
		camera_angle:Trigger()
		local loc = FindNodeByName("loc_trickling_water")
		doctor:SetTarget(loc)
		doctor:SetMoveTime(1)
		doctor:SetBehaviour("move")
		Wait(1)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor") --6s
		doctor:PlayAnim(anim,1,1)
		Wait(1)
		local audio_water = FindNodeByName("audio_fill_caddie")
		audio_water:Trigger()
		
		doctor:RemoveInventoryItem(MessCaddie)
		doctor:AddInventoryItem(FullMessCaddie)
		--VO
		--The Doctor is trying to wake up Chisholm and has been given the hint that he needs to get something warm inside the unconscious man. He finds a mess caddie, he fills it with water, he warms it with the sonic. Filling up the caddie with water and heating it with the screwdriver.
		doctor::SID_1529:A Mess Caddie. The perfect receptacle for Water. 
		Wait(2)
		SayPrep("", "async")
		--VO
		doctor::SID_0030: I'll heat this Water up with the Sonic Screwdriver. Could do with a tea bag but just plain old hot Water will have to do.
		
		local sonic_script = FindNodeByName("Sonic_Script:0")
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_WarmCaddie", 2)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_WarmCaddie") --7.633s
		doctor:PlayAnim(anim, 1, 0.1)
		
		
		local caddie_prop = FindNodeByName("Caddie_prop")
		local caddie_sound = FindNodeByName("caddie_boil")
		local caddie_entity = FindNodeByName("Caddie_entity")
		local caddie_anim = FindNodeByShortName("EM_ANIMATOR_Caddie_Anim_CAD_WarmCaddie")
		caddie_prop:PlayAnim(caddie_anim, 1, 0)
		Wait(1)
		caddie_entity:Show()
		Wait(1)
		caddie_sound:Trigger()
		Wait(4)
		caddie_entity:Hide()
		Wait(1.6)
		
		
		
		

		local my_interact=FindNodeByName("int_trickling_water")
		my_interact:StopTrigger()
		doctor:SetBehaviour("pc")
		HideLetterBox()
		--fill the mess caddie
		SetGlobalObjectiveState("Cyber_1_2_2", 3) -- 2 is unlock, 3 is done
	
		
		
	elseif (doctor:IsUsingInventoryItem(FullMessCaddie)) then
		--VO
		doctor::SID_0031:The Mess Caddie is full
	else
		local refusal = FindNodeByName("common_scripts")
		refusal.script.RandomRefusal()
	end
end

global function Trigger()
	local doctor = GetActor("doctor")
		local sonic_script = FindNodeByName("Sonic_Script:0")
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_WarmCaddie", 2)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_WarmCaddie") --7.633s
		doctor:PlayAnim(anim, 1, 0.1)
		
		local caddie_prop = FindNodeByName("Caddie_prop")
		local caddie_entity = FindNodeByName("Caddie_entity")
		local caddie_anim = FindNodeByShortName("EM_ANIMATOR_Caddie_Anim_CAD_WarmCaddie")
		caddie_prop:PlayAnim(caddie_anim, 1, 0)
		Wait(1)
		caddie_entity:Show()
		Wait(5)
		caddie_entity:Hide()
		Wait(1.6)
	end
