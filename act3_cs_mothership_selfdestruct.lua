global function run_cutscene_start()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	local mothership=GetActor("amy")
	local cyberslave = FindNodeByName("Cyberslave_0")
	local doc_point = FindNodeByName("loc_cs13_doc2")
	local amy_point = FindNodeByName("loc_cs13_amy2")
	local chisholm_point = FindNodeByName("loc_cs13_chisholm2")
	local lift_control = FindNodeByName("int_lift_control")
	
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	chisholm:SetBehaviour("wait")
	
	SayPrep("skip", "")
	
	--Reconfigure the computer
	SetGlobalObjectiveState("Cyber_3_6_2", 3) -- 2 is unlock, 3 is done
	
	--CUT SCENE 14
	--INT. CONTROL ROOM -- DAY
	--The coolant panel sparks and smokes, THE DOCTOR backs off, smiling...
		doctor::SID_0368:That should do the trick. And we should have about half an hour to get out of here before it blows.
	--As sirens start to scream and lights flash.
	--CYBERMAN COMPUTER VOICE
		mothership::SID_0369:Two minutes to critical mass. 
		amy::SID_0370:And there was me looking forward to a leisurely stroll.
		doctor::SID_0371:Sorry about that. Maybe we should run!
	-- And he's running out of there, followed by the others...
	
	--Get out of the base
	AddGlobalObjective("Cyber_3_7")
	-- Get back to the lift
	SetGlobalObjectiveState("Cyber_3_7_1", 2) -- 2 is unlock, 3 is done
	-- Speed up the lift
	SetGlobalObjectiveState("Cyber_3_7_2", 2) -- 2 is unlock, 3 is done

	ShowFade()
	Wait(1)
	HideLetterBox()
		
	chisholm:Teleport(chisholm_point)
	doctor:Teleport(doc_point)
	amy:Teleport(amy_point)
	
	Wait(1)
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	chisholm:SetTarget(doctor)
	chisholm:SetBehaviour("follow")
	cyberslave:StopTrigger()
	lift_control:Trigger()
	HideFade()
end
