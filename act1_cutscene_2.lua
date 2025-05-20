--2
--played after titles
--ends and play begins

global function Start()
	local dalek = GetActor("dalek")	
	local sylvia = GetActor("sylvia")
	local origin = FindNodeByName("origin")
	local music = FindNodeByName("music_2")

	dalek:GetTransform():StopTrigger()
	sylvia:Teleport(origin)
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")	
	local dalek1 = GetActor("dalek1")
	local dalek2 = GetActor("dalek2")
	local explore_music = FindNodeByName("explore_music_def")
	local hints_script = FindNodeByName("hints_script")
	--local start_spot = FindNodeByTag("start_spot")
--	local collect4 = FindNodeByShortName("EM_ENTITY_act1_collect_4")

--	collect4:Trigger()
	
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")

	amy:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy:SetMaxSpeed(6)

	sylvia:GetTransform():StopTrigger()

	--dalek:Teleport(start_spot)
	dalek:GetTransform():Trigger()
	--dalek:EnablePhysics()
	--dalek:SetBehaviour("patrol")
	
	dalek1:GetTransform():Trigger()
	dalek1:DisablePhysics()

	dalek2:GetTransform():Trigger()
	dalek2:DisablePhysics()

	hints_script.script.after_intro_hints = true

	PlayMusic(explore_music)
	HideLetterBox()
	
	FindNodeByName("lua_transition").script.BlackScreen(3)
end