global model
global script_node
global blocks_in_place
local next_push
--local doctor_push = FindNodeByTag("TheDoctor_Anim_PushCrate")
local doctor_push = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Push")

local doctor_locator
local new_blok
local old_blok
local done
local cutscene
local anim_blok
local anim
local mesh_anim_blok


if not IsLoadingSavedGame() then
	next_push = 1
	local platform_coll = FindNodeByTag("slot_platform_pos3_coll")
	platform_coll:StopTrigger()
	local platform = FindNodeByTag("slot_platform_pos3")
	platform:StopTrigger()
	local platform = FindNodeByTag("slot_platform_pos2")
	platform:StopTrigger()
	blocks_in_place = false
	
	
end

global function Init()
	if(not blocks_in_place) then
		local platform_coll = FindNodeByTag("slot_platform_pos3_coll")
		platform_coll:StopTrigger()
		local platform = FindNodeByTag("slot_platform_pos3")
		platform:StopTrigger()
		local platform = FindNodeByTag("slot_platform_pos2")
		platform:StopTrigger()

	end
end

global function Interact()
	ShowLetterBox()
	local doctor = GetActor("doctor")
	--doctor:DisableWalls()
	doctor:SetTarget(doctor_locator)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node,"DocPush")
end

global function push_the_first()
	doctor_locator = FindNodeByName("loc_push_blok1")
	new_blok = FindNodeByTag("slot_platform_pos2")
	old_blok = FindNodeByTag("slot_platform_pos1")
	anim_blok = FindNodeByName("prop_icecube_first")
	anim = FindNodeByShortName("EM_ANIMATOR_IceBlock_Anim_IceBlockAnim_1")
	mesh_anim_blok = FindNodeByTag("icecube_mesh1")
	cutscene = FindNodeByName("block1_slide")
	Interact()
end

global function push_the_second()
	doctor_locator = FindNodeByName("loc_push_blok2")
	new_blok = FindNodeByTag("slot_platform_pos3")
	old_blok = FindNodeByTag("slot_platform_pos2")
	anim_blok = FindNodeByName("prop_icecube")
	anim = FindNodeByShortName("EM_ANIMATOR_IceBlock_Anim_IceBlockAnim_2")
	mesh_anim_blok = FindNodeByTag("icecube_mesh2")
	cutscene = FindNodeByName("block2_slide")
	done = true
	Interact()
end

global function DocWalk()
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
	HideLetterBox()
	ResetPlayerCamera()
	if (done == true) then
		local gap_collision = FindNodeByName("gap_collision")
		gap_collision:StopTrigger()
		local chisholm_script = FindNodeByName("chisholm_script")
		chisholm_script.script.UnlockLocator(12)
		chisholm_script.script.UnlockLocator(11)
		chisholm_script.script.UnlockLocator(10)
		chisholm_script.script.UnlockLocator(9)
		chisholm_script.script.UnlockLocator(8)
		local stop_trigger = FindNodeByName("trigger_remember_chisholm1")
		stop_trigger:StopTrigger() -- no longer stop Doc from progressing
	end

	blocks_in_place = true
end

global function DocPush()
	local doctor = GetActor("doctor")
	doctor:DisablePhysics()
	doctor:PlayAnim(doctor_push,1,1)
	Wait(0.5)
	doctor:StopAnim(1.0)
	
	anim_blok:PlayAnim(anim, 1, 0)
	cutscene:Trigger()
	WaitFrame()
	
	WaitFrame()
	
	WaitFrame()
	
	
	old_blok:Hide()
	mesh_anim_blok:Show()
	
	Wait(0.5)
	local audio_blok = FindNodeByName("audio_iceblock_slide")
	audio_blok:Trigger()
	if (done == true) then
		Wait(2.5)
		audio_blok = FindNodeByName("audio_bridge_falls")
		audio_blok:Trigger()
		Wait(2.3)
	else
		Wait(1.6)
		audio_blok = FindNodeByName("audio_icecube_drop")
		audio_blok:Trigger()
		Wait(3.2)
	end

	


	
	old_blok:StopTrigger()
	mesh_anim_blok:Hide()
	new_blok:Trigger()
	DocWalk()
end




global function RedundantInteract()

	model:MoveByOverTime({0.0,0.0,3.15},1.0)
	model:MoveByOverTime({0.0,-1.8,0.0},0.25)
	
--	local chisholm = GetActor("chisholm")
--	local locator = FindNodeByName("loc_chisholm5_5")
--	chisholm:Teleport(locator)
--	chisholm = FindNodeByName("chisholm_script")
--	chisholm.script.chisholm_pos = 4
	
		local loc = FindNodeByName("loc_chisholm8")
		local chisholm = GetActor("chisholm")
		chisholm:SetBehaviour("wait")
		chisholm:Teleport(loc)
	
	local chisholm_script = FindNodeByName("chisholm_script")
	--chisholm_script.script.UnlockLocator(8)
	chisholm_script.script.chisholm_pos = 4
	
	local me = FindNodeByName("slot_platform_int")
	me:StopTrigger()
end