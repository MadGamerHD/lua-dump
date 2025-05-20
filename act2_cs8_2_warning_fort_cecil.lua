global function run_cutscene()
	local amy = GetActor("amy")
	ShowLetterBox()
	amy:SetBehaviour("wait")

		local doctor=GetActor("doctor")
		local cecil=GetActor("cecil")
		
		local doc_cam=FindNodeByName("CutSceneCamera_1")

		local amy_point=FindNodeByName("loc_radio_console")
		amy:Teleport(amy_point)
		local doc_point=FindNodeByName("loc_cs8_2_doc1")
		doctor:Teleport(doc_point)


		SayPrep("skip", "async")

		
		--CUT SCENE 8.2
		--INT. RADIO ROOM  DAY
		--First two lines to herself, while fitting the new capacitor
		amy::SID_0268:Where was this supposed to go? Aah I see it... there.
		Wait(3)
		
		--Wait(0.1)
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractKeyboardTable") --2.3
		--amy:PlayAnimAndWait(anim, 1, 0.5)
		amy:PlayAnim(anim, 1, 0.5)
		Wait(1.5)
		local audio_fit_capacitor = FindNodeByName("audio_plug_in")
		audio_fit_capacitor:Trigger()
		Wait(1.0)
		
		SayPrep("skip", "")
		amy::SID_0269: Now let's see if we have a connection...
		amy:SetBehaviour("wait")
		--speaking into the radio
		amy::SID_0270: Erm... The GSO to Fort Cecil. Hello? Roger and all that.
		--radio voice of fort cecil
		cecil::SID_0271: GSO Zebra Bay, this is Fort Cecil, reading you. Are you confirming the delivery?
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable")
		amy:PlayAnim(anim, 1, 0.5)
		

		amy::SID_0272:No. We have... err... a situation here. We need you to hold off on that delivery.
		amy:SetBehaviour("wait")
		amy::SID_0273: Don't come anywhere near here until we give you the green light. Is that clear?
		Wait(1)
		cecil::SID_0274: Why? What is happening?
		amy::SID_0275: Erm... Polar flu. Really, really bad outbreak. We need to be quarantined just to be safe.
		cecil::SID_0276: Roger that. Let us know if we can help.
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable")
		amy:PlayAnim(anim, 1, 0.5)
		amy::SID_0277: Thanks. GSO out.
		cecil::SID_0278: Over and out.
		--she puts down the mic
		-- to herself
		amy:SetTarget(doctor)
		amy:Face(0.5, "sine")
		SayPrep("skip", "async")
		
		--she puts down the mic
		--to herself
		amy::SID_0279: They really say that? Now where did the Doctor get to?
		--amy:SetBehaviour("wait")
		Wait(3.2)
		
		ShowFade()
		Wait(1.5)
		doc_cam:CutTo()
		--doctor:SetBehaviour("pc")
		HideFade()
		Wait(1)
		--doctor:SetBehaviour("wait")
		SayPrep("skip", "")
		--CUT TO:
		--INT. MEADOWS LAB
		--The Doctor returns to the lab to find Meadows missing.
		doctor::SID_0445:Professor Meadows? Elizabeth? 
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPositive1") --4.3s
		--formal nodding
		doctor:PlayAnim(anim, 1, 0)
		--then to himself
		doctor::SID_1024: When I said stay here, I meant stay here. Why don't people do what I tell them?
		
		local stop_block = FindNodeByName("trigger_dont_leave_lab")
		stop_block:Trigger()
		doctor:SetBehaviour("wait")
		doctor::SID_0446:Well, let's see what I can do about this Serum.

		

end

global function end_cutscene()

	local doctor = GetActor("doctor")
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	--Replace the capacitor in the radio
	SetGlobalObjectiveState("Cyber_2_5_2", 3) -- 2 is unlock, 3 is done
	--Wanr Fort Cecil
	SetGlobalObjectiveState("Cyber_2_5_3", 3) -- 2 is unlock, 3 is done
	
	--Return to meadows/ create serum
	SetGlobalObjectiveState("Cyber_2_4_5", 2) -- 2 is unlock, 3 is done
end
