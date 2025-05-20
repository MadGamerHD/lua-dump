global first

if(first==nil) then
   if not IsLoadingSavedGame() then
	local door = FindNodeByName("prop_conversion_door")
	local loc = FindNodeByName("loc_conversion_door")
	
	door:Move(loc, 1, "lerp")
   end

   first = 1
end


global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
	--VO
	--Interacting with the bolted door. Cybermen are knocking from the other side.
		doctor::SID_0901:The Cybermen are breaking through the door. We need to find a different way out of here.
end

--triggered from trigger volume
global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("loc_conversion_door_doc1")
	local loc2 = FindNodeByName("loc_conversion_door_doc2")	
	local loc3 = FindNodeByName("loc_bolt_lock")
	local bolt = FindNodeByName("prop_bolt_lock")
	local door1 = FindNodeByName("prop_conversion_door")
	local ambience1 = FindNodeByName("ambience_active_mothership")
	local ambience2 = FindNodeByName("ambience_conversion_room")
	local camera_angle = FindNodeByName("show_conversion_chamber")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft90") --1.43
	local struggle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_StruggleInChair")
	local idle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_CChairIdle")
	local door_open = FindNodeByName("conv_door")
	local bolt_move = FindNodeByName("bolt_move")
	local bolt_lock = FindNodeByName("bolt_lock")
	local sting = FindNodeByName("10s_shock_sting")
	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy_0")

	ShowLetterBox()
	
	doctor:DisableStealth()
	amy:DisableStealth()
	amy:PlayAnim(idle,1,0)
	ambience1:StopTrigger()
	ambience2:Trigger()
	camera_angle:Trigger()
	PlayMusic(sting)

	Wait(0.2)
	doctor: SetBehaviour("wait")
	doctor:SetTarget(loc1)
	doctor:SetMoveTime(1.0)
	doctor:SetBehaviour("move")

	Wait(1)
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75) --4.3
	doctor:PlayAnim(anim, 1, 0.1)

	Wait(2.1)
	door1:MoveToOrigin(1.2, "lerp")
	door_open:Trigger()

	Wait(2.2)
	doctor:PlayAnim(turn,2,0.1) --1.43
	amy:PlayAnim(struggle,1,0.5)
	doctor:SetFocus(amy_ent)
	SayPrep("skip", "")
	--HINT
	--Amy in straps
		amy::SID_0475:Doctor! Get me out of here! Please!

	SayPrep("", "async")
	--HINT
	--Amy in straps
		doctor::SID_0476: I'm here. I'll get you free straight away.

	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75) --4.3
	doctor:PlayAnim(anim, 1, 0.1)
	
	Wait(2.1)
	bolt:Move(loc3, 1, "lerp")
	bolt_move:Trigger()
	
	Wait(0.7)
	bolt_lock:Trigger()

	Wait(1.5)
	doctor:SetTarget(loc2)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	amy:PlayAnim(idle,1,0.5)
end

global function End()	
	local doctor = GetActor("doctor")
	local cyber2 = GetActor("cyberman_2")
	local cyber3 = GetActor("cyberman_3")
	local door_bangs = FindNodeByName("door_bangs")
	local door2 = FindNodeByName("int_conversion_door")	
	local music = FindNodeByName("background_music")
	
	doctor:ClearFocus()
	cyber2:GetTransform():StopTrigger()
	cyber3:GetTransform():StopTrigger()
	door_bangs:Trigger()
	door2:Trigger()
	PlayMusic(music)
	
	HideLetterBox()
		
	--Locate the conversion chamber
	SetGlobalObjectiveState("Cyber_3_4_1", 3) -- 3 is tick
	--Sneak past the patrolling cyberslaves
	SetGlobalObjectiveState("Cyber_3_4_2", 3) -- 3 is tick
	--Release Amy from chair
	SetGlobalObjectiveState("Cyber_3_4_3", 2) -- 2 is blue

	doctor: SetBehaviour("pc")
end