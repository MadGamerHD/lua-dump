global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy = GetActor("amy")
	ShowLetterBox()
	doctor:DisableStealth()
	amy:DisableStealth()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	
	
	
	--local doctor_point=FindNodeByName("loc_vent_interact")
	local doctor_point=FindNodeByName("loc_cs7_4_doc1")
	doctor:Teleport(doctor_point)
	local amy_point=FindNodeByName("loc_cs7_4_amy1")
	amy:Teleport(amy_point)
	
--	Wait(1)
--	doctor_point=FindNodeByName("loc_cs7_4_doc1")
--	doctor:SetTarget(doctor_point)
--	doctor:SetMaxSpeed(1.0)
--	doctor:SetBehaviour("move")
	local audio_bleep = FindNodeByName("audio_beacon_beep")
--	audio_bleep:Trigger()

	Wait(0.5)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkDefensive2") --4.1s
		--shy? hands folded in front. Looking at ground
		doctor:PlayAnim(anim, 1, 0)
	amy:SetFocus(doctor)
	SayPrep("skip", "async")
	--CUT SCENE 7.4
	--mini cutscene - get Amy to climb to the nest with instructions
	doctor::SID_0234:Take the Beacon. Climb up there, and while I keep the Cybermats occupied with the Sonic, see if you can open the Vent up there.
	--doctor::SID_0235: Then turn the beacon on and drop it into the nest.  You see? Simple. Oh, then it might be a good idea to cover your ears.
	Wait(4.1)
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
		--right hand out, left hand out
		doctor:PlayAnim(anim, 1, 0)
		Wait(2.6)
	doctor:SetBehaviour("wait")
	
	SayPrep("skip", "")
	amy::SID_0236:Ok. I think I can manage that.
	amy:ClearFocus()
	local mdb=FindNodeByName("modified_distress_beacon")
	doctor:RemoveInventoryItem(mdb)
	--amy:AddInventoryItem(mdb)
	local vent_hatch = FindNodeByName("script_vent_hatch")
	vent_hatch.script.Amy_In_Place()
	--local amy_point=FindNodeByName("loc_bunk_up_mezzanine")
	--amy:Teleport(amy_point)
	SayPrep("skip", "async")
	doctor::SID_0237:And try to avoid any Cybermats while you're up there.
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk negative 1") -- 1.7s
	--arms out in helpless shrug, shaking head
	doctor:PlayAnim(anim, 1, 0)
	Wait(2)
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180") --2.03s
	doctor:PlayAnim(anim, 1, 0)
--	Wait(1)
--	doctor_point=FindNodeByName("loc_cs7_4_doc2")
--	doctor:SetTarget(doctor_point)
--	doctor:SetMoveTime(1)
--	doctor:SetBehaviour("move")
	Wait(1)
	amy::SID_0238:Thanks. Doctor of the flaming obvious now are you?
	Wait(1)
	doctor:SetBehaviour("wait")
	Wait(2)
	doctor_point=FindNodeByName("loc_cs7_3_focus_doc")
	
	doctor:SetFocus(doctor_point)
	
	doctor_point=FindNodeByName("loc_cs7_4_doc3")
	doctor:SetTarget(doctor_point)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	
	
	doctor::SID_0239:I mean it. They're dangerous. You know what they can do.
	Wait(1)
	doctor_point=FindNodeByName("loc_amy_climb_to_nest3")
	amy:SetTarget(doctor_point)
	amy:SetMoveTime(1.1)
	amy:SetBehaviour("move")
	
	
	Wait(2)
	local amy_climb = FindNodeByPartialName("amy_Anim_AMY_Interact1m") --1.97s
	amy:PlayAnim(amy_climb,1,0)
	Wait(1)
	local audio_vent_noises = FindNodeByName("audio_open_vent")
	audio_vent_noises:Trigger()
	Wait(1)
	local second_hatch = FindNodeByTag("vent_hatch2")
	second_hatch:StopTrigger()
	
	
	amy_climb = FindNodeByPartialName("amy_Anim_AMY_ClimbUp1m")
	amy:PlayAnimAndWait(amy_climb,1,0)
	
	amy_point=FindNodeByName("loc_cs7_4_amy_OOS")
	amy:Teleport(amy_point)
	
	
	
	--local sonic_script = FindNodeByName("Sonic_Script:0")
	--sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicOutOfPocket") --1.5
	doctor:PlayAnimAndWait(anim, 1, 0.1)
	
	audio_vent_noises = FindNodeByName("audio_vent_clamber")
	audio_vent_noises:Trigger()

	
	local audio_sonic = FindNodeByName("Sonic_Audio:0")
	audio_sonic:Trigger()
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_PointSonic") --0.86
	doctor:PlayAnim(anim, 1, 0.1)
	

	
	
	Wait(1)
	doctor:PlayAnim(anim, 1, 0.1)
	--HINT
	--Said as the Doctor holds out the sonic and Amy is about to drop the beacon
	--doctor::SID_2202:Alright Amy, drop it in the nest.
	amy::SID_2203:Doctor, I see the nest! I'm setting off the beacon.
	doctor:PlayAnim(anim, 1, 0.1)
	audio_sonic:StopTrigger()
	audio_sonic:Trigger()
	Wait(1)
	doctor:PlayAnim(anim, 1, 0.1)

	Wait(1)
	doctor:PlayAnim(anim, 1, 0.1)

	Wait(1)
	doctor:PlayAnim(anim, 1, 0.1)
	audio_sonic:StopTrigger()
	audio_sonic:Trigger()
	
	

--	Wait(4)
	Wait(0.5)
	
	Wait(0.5)
	doctor:PlayAnim(anim, 1, 0.1)
	audio_bleep:StopTrigger()
	audio_bleep = FindNodeByName("audio_beacon_beep_fast")
	audio_bleep:Trigger()
	Wait(1)
	doctor:PlayAnim(anim, 1, 0.1)
	--audio_bleep:Trigger()
	Wait(0.5)
	--audio_bleep:Trigger()
	Wait(0.5)
	doctor:PlayAnim(anim, 1, 0.1)
		
	audio_sonic:StopTrigger()
	audio_sonic:Trigger()
	--audio_bleep:Trigger()
		doctor:ClearFocus()
	amy:ClearFocus()
	ShowFade()
	Wait(1)
	audio_sonic:StopTrigger()
	
	local mat_sounds = FindNodeByName("mat_sounds")
	mat_sounds:StopTrigger()
	local audio_boom = FindNodeByName("audio_beacon_blow")
	audio_boom:Trigger()
	Wait(3)
	amy:EnablePhysics()
	HideFade()


	
	--amy:SetBehaviour("pc")
end

global function ExtraBits()
	local doctor=GetActor("doctor")
	local amy = GetActor("amy")
	

end
