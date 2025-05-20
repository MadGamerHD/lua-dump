global is_dead

local function PlayDead()
	local diver0 = GetActor("Diver_0")
	local diver1 = GetActor("Diver_1")
	local die0 = FindNodeByShortName("EM_ANIMATOR_Diver_Anim_Diver0_CS06Death")
	local die1 = FindNodeByShortName("EM_ANIMATOR_Diver_Anim_Diver1_CS06Death")
	local fact0 = FindNodeByName("diver_fact0")
	local fact1 = FindNodeByName("diver_fact1")

	diver0:PlayAnim(die0,1,0)
	diver1:PlayAnim(die1,1,0)
	
	fact0:Trigger()
	fact1:Trigger()
end

global function Init()
	if is_dead then
		PlayDead()
	end
end

global function SetDead()
	is_dead = true
	
	PlayDead()
end

global function PerformCutscene6()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("cs6_music")
	local generator_script = FindNodeByName("GeneratorGameplayScript")
	local light = FindNodeByTag("controlled_light")

	light:StopTrigger()
	generator_script.script.DeactivateLight()

	PlayMusic(music)
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function EndCutscene6()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local diver0 = GetActor("Diver_0")
	local diver1 = GetActor("Diver_1")	
	local amb = FindNodeByName("act2_amb_def")
	local origin = FindNodeByName("origin")

	PlayMusic(amb)
		
	doctor:AddInventoryItem(FindNodeByName("chip"))
	
	doctor:Teleport(FindNodeByName("after_cutscene6_loc_doctor"))
	amy:Teleport(FindNodeByName("after_cutscene6_loc_amy"))
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	HideLetterBox()
	
	-- we're downstairs now - make sure the ladder interactables are set correctly
	FindNodeByName("LadderInteractableUp_0"):EnableNode()
	FindNodeByName("LadderInteractableDown_0"):DisableNode()
	FindNodeByName("LadderInteractableUp_1"):EnableNode()
	FindNodeByName("LadderInteractableDown_1"):DisableNode()
	
	FindNodeByName("Act2Progression").script.SetStage_RewireTheGenerator()
	
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)	
	
	diver0:DisablePhysics()
	diver1:DisablePhysics()
	diver0:Teleport(origin)
	diver1:Teleport(origin)
		
	SetDead()
end

