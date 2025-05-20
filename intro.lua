global script_node

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalek = GetActor("dalek")
--	local dalek1 = GetActor("dalek1")
--	local dalek2 = GetActor("dalek2")
	local sylvia = GetActor("sylvia")
	local waypoint1 = FindNodeByName("waypoint1_locator")
	local waypoint3 = FindNodeByName("waypoint3_locator")
	local intro_timeline = FindNodeByName("intro_time")
	local doc_idle1 = FindNodeByPartialName("Anim_DRW_Idle01")
	local doc_idle3 = FindNodeByPartialName("Anim_DRW_Idle03")
	local doc_leftlookin = FindNodeByPartialName("Anim_DRW_IdleToLookOverShoulder_L")
	local amy_idle1 = FindNodeByPartialName("Anim_Amy_Idle1")
	local amy_idle2 = FindNodeByPartialName("Anim_Amy_Idle2")
	local amy_idle3 = FindNodeByPartialName("Anim_Amy_Idle3")
	local sid0002 = FindNodeByPartialName("Anim_DRW_E2_SID0002")
	local DRlight_DLB = FindNodeByPartialName("EM_Light_CS_DR_Down_Left_Back:0")
	local DRlight_UL = FindNodeByPartialName("EM_Light_CS_DR_Up_Left:0")
	local DRlight_DL = FindNodeByPartialName("EM_Light_CS_DR_Down_Left:0")
	local DRlight_DF = FindNodeByPartialName("EM_Light_CS_DR_Down_Forward:0")
	--local SAlight_DR = FindNodeByPartialName("EM_Light_CS_SA_Down_Right:0")
	local DRlight_DRB = FindNodeByPartialName("EM_Light_CS_DR_Down_Right_Back:0")
	local doc_start_loc = FindNodeByName("doc_start_loc")
	local amy_start_loc = FindNodeByName("amy_start_loc")
	local traf_amb = FindNodeByName("traf_amb")
	local tard_amb = FindNodeByName("tard_amb")	
	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")

	SayPrep("skip", "")

	tard_amb:StopTrigger()
	traf_amb:Trigger()

	doctor:Teleport(doc_start_loc)
	amy:Teleport(amy_start_loc)

	dalek:SetBehaviour("wait")
--	dalek1:SetBehaviour("wait")
--	dalek2:SetBehaviour("wait")
	dalek:DisablePhysics()
--	dalek1:DisablePhysics()
--	dalek2:DisablePhysics()
	sylvia:DisableWalls()

--	intro_timeline:PauseAt(51.99)

	doctor:PlayAnimBlendOut(doc_idle3,0.5,0.5,0.5)
	amy:PlayAnimBlendOut(amy_idle3,0.5,0.5,0.5)
		
	Wait(1)
	--CUT SCENE 1.1
	--EXT. RUINED LONDON -- CONTINUOUS
	--EXTREME CLOSE-UP: The Doctor and Amy - can't believe what they're seeing.
		doctor::SID_0000:No. Impossible.
	Wait(5.8)
	--And we see ruined, burned-out London. It's Trafalgar Square. Devastated. 
	--Nelson's Column has crashed to the ground. There's rubble everywhere. And no sign of life.
		amy::SID_0003:Did you get this wrong? Maybe this is, like, 2963, or something?
	Wait(3.8)
	doctor:PlayAnimBlendOut(doc_idle1,0.5,0.5,0.5)
	amy:PlayAnimBlendOut(amy_idle2,0.5,0.5,0.5)
	--Dumbfounded reaffirmation
		doctor::SID_0001:There's no mistake. This is 1963.
	Wait(1.2)
		amy::SID_0006:But how? What or who could've done this? 
	Wait(0.3)

	sylvia:SetTarget(waypoint1)
	sylvia:SetMoveTime(3)
	sylvia:SetBehaviour("move")
	Wait(0.5)

	doctor:PlayAnimBlendOut(sid0002,1,0.5,0.5)
	--Thinking out loud explanation
		doctor::SID_0002:Something with the power to alter time. On a massive scale. 
	
	sylvia:SetTarget(waypoint3)
	sylvia:SetMoveTime(3.5)
	sylvia:SetBehaviour("move")
	Wait(0.3)
	amy:SetFocus(syl_ent)
	DRlight_DRB:Trigger()
	--And then - across the Square movement.  A woman, comes into view.  
	--Sylvia (20s, been living rough). Scared of something. 
		amy::SID_0005:Doctor! Look!
	Wait(0.8)
	
	doctor:PlayAnim(doc_leftlookin,0.9,0)
	doctor:SetCallback(script_node,"LookHold")
end

global function LookHold()
	local doctor = GetActor("doctor")
	local dalek = GetActor("dalek")
	local sylvia = GetActor("sylvia")
	local waypoint4 = FindNodeByName("waypoint4_locator")
	local detonator = FindNodeByName("detonator_locator")
	local doc_leftlookhold = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_LookOverShoulder_L")
	local sylvia_anims_script = FindNodeByName("sylvia_anims_script2")
	local turn_loc = FindNodeByName("doc_turn_locator")	
	local DRlight_DF = FindNodeByPartialName("EM_Light_CS_DR_Down_Forward:0")
	local DRlight_UL = FindNodeByPartialName("EM_Light_CS_DR_Up_Left:0")
	local DKlight_DLB = FindNodeByPartialName("EM_Light_CS_DK_Down_Left_Back:0")
	local DRlight_UR = FindNodeByPartialName("EM_Light_CS_DR_Up_Right:0")
	local DRlight_DRB = FindNodeByPartialName("EM_Light_CS_DR_Down_Right_Back:0")
	local syl_ent = FindNodeByShortName("EM_ENTITY_Sylvia:0")
	local intro_timeline = FindNodeByName("intro_time")
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

	doctor:PlayAnim(doc_leftlookhold,1,0)

	Wait(0.7)
	sylvia:Teleport(waypoint4)
	sylvia:SetTarget(detonator)
	sylvia:SetMoveTime(2.5)
	sylvia:SetBehaviour("move")
	
	Wait(0.2)
	sylvia:SetCallback(sylvia_anims_script,"IntoPlunge")
	
	Wait(2)
	doctor:SetFocus(syl_ent)
	
	DRlight_DRB:StopTrigger()
	dalek:GetTransform():Trigger()
	dalek:SetFocus(sylvia:GetTransform())

	DKlight_DLB:Trigger()
	Wait(0.5)
	--And almost in the same beat they see Sylvia - something else rolls into sight: a Dalek! 
		doctor::SID_0011:Get down!
	doctor:Teleport(turn_loc)
	Wait(1.5)
	DRlight_UR:Trigger()
	DRlight_UL:Trigger()

	--Sylvia sees the Dalek and they see her... 
		dalek::SID_0500:Human! Halt!
	
	--There's nowhere for Sylvia to run. The Dalek closes in on her.
		dalek::SID_0501:The last survivor of Earth will be exterminated!
	Wait(1)
	DRlight_UL:StopTrigger()
        DRlight_UR:StopTrigger()

	--As the Doctor and Amy look on, helpless and horrified the Dalek exclaims...
		dalek::SID_0502:EXTERMINATE!  
	
        OverlayManager:SetCallback(script_node, "TitlesOver")
        OverlayManager:ShowTitles()
       	intro_timeline:StopTrigger()
        DKlight_DLB:StopTrigger()
end

global function TitlesOver()
	local cutscene_2 = FindNodeByName("cutscene_2")
	cutscene_2:Trigger()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")	
	local dalek1 = GetActor("dalek1")
	local dalek2 = GetActor("dalek2")
	local da3 = FindNodeByName("da3")
	local waypoint1 = FindNodeByName("waypoint1_locator")
	local explosion = FindNodeByName("explosion_large")
	local dust_clouds = FindNodeByName("dust_clouds")
	local plungeprop = FindNodeByName("detonator_prop")
	local plunge_down = FindNodeByPartialName ("Detonator_Anim_DetonatorPlunge")
	local sylvia_run = FindNodeByPartialName("Anim_SYL_DetonateAndRun")
--	local run = FindNodeByPartialName("Anim_SYL_Run")
	
	SayPrep("skip", "")
	
	Wait(1)
	dalek1:GetTransform():Trigger()
	dalek2:GetTransform():Trigger()
	
	da3:Trigger()
	
	--TITLES
	--CUT SCENE 2
	--EXT. RUINED LONDON -- CONTINUOUS
	--As The Doctor and Amy stay out of sight, the Dalek closes on Sylvia - who stands, defiant.
--		dalek::SID_0503:Exterminate!
	plungeprop:PlayAnim(plunge_down,1,0)
	Wait(0.2)
	sylvia:PlayAnim(sylvia_run,1,0)
	
	Wait(0.3)
	--bang!
	explosion:Trigger()

	Wait(0.2)	
	dust_clouds:Trigger()
	--sylvia:PlayAnim(run,1,1)

	--As Sylvia grasps a detonator. Triggers it.
	--Explosives hidden in the nearby rubble explode - momentarily obscuring the Dalek with smoke and dust
	--Sylvia makes her getaway to a nearby manhole cover (which she lifts and disappears beneath). 
--		amy::SID_0008:We've got to talk to her!

	Wait(0.1)
	dalek:Teleport(waypoint1)
	
	Wait(0.7)
--		doctor::SID_0019:Wait!
	
	--2x Daleks move to start position
	--First Dalek adopts patrol and turns
	Wait(1)
	dust_clouds:StopTrigger()

	Wait(2)
	--And through the settling dust and smoke comes the undamaged pair of Daleks. 
	--They watch them move until they stop.
--		doctor::SID_0013:Now we've got to talk to her. Come on.
	--*NOTE 
	--This dialogue is from the Doctor.
--		amy::SID_0953:That woman has gone underground. We have to find a way to follow her.
end

global function Ending()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")	
	local dalek1 = GetActor("dalek1")
	local dalek2 = GetActor("dalek2")
	local explore_music = FindNodeByName("explore_music_def")
	local hints_script = FindNodeByName("hints_script")
	
	SayPrep("skip", "")
	doctor:EnableWalls()
	amy:EnableWalls()
	sylvia:EnableWalls()
	dalek:EnablePhysics()
	--dalek1:EnablePhysics()
	--dalek2:EnablePhysics()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy:SetMaxSpeed(6)
	sylvia:GetTransform():StopTrigger()
	dalek:SetBehaviour("patrol")
	dalek1:SetBehaviour("guard")
	dalek2:SetBehaviour("guard")

	hints_script.script.after_intro_hints = true

	PlayMusic(explore_music)
	HideLetterBox()
	AddGlobalObjective("Dalek_1_1")
end
