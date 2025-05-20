global function run_cutscene_start()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cyberleader=GetActor("cyberleader")
	local chisholm=GetActor("chisholm")
	local doc_point = FindNodeByName("loc_cs13_doc1")
	local amy_point = FindNodeByName("loc_cs13_amy1")
	
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	chisholm:SetBehaviour("wait")
		
	SayPrep("skip", "")
	doctor:Teleport(doc_point)
	amy:Teleport(amy_point)
		
	--Get back to the control room
	SetGlobalObjectiveState("Cyber_3_6_1", 3) -- 2 is unlock, 3 is done

	--CUT SCENE 13
	--INT. CONTROL ROOM -- DAY
	--THE DOCTOR cautiously checks that the coast is clear before entering the control room with Amy - but the Cybermen are no longer there.
	--The Doctor rushes to the control panel. 
		amy::SID_0327:Isn't this dangerous? There must be Cybermen all over the place.
		doctor::SID_0328:Yes. But this is the only place we can stop them.
	--And he brings up monitor screens - showing masses of Cybermen striding across the arctic waste...
		amy::SID_0329:Where are they going?
		doctor::SID_0330:Fort Cecil. The only people for a hundred miles. They'll convert them and move on.  
		doctor::SID_1029:Snow and ice mean nothing to the Cybermen. Nothing will stop them.
		cyberleader::SID_0331:Including you, Doctor!
	--The Doctor and Amy swing around to see the CYBERLEADER flanked by two other CYBERMEN in the doorway.
		cyberleader::SID_0332:You will be deleted!
	--The Cybermen step forward, preparing to fire - The Doctor and Amy are trapped.
	-- Suddenly the Cybermen are struck down by their own weaponry
	-- Behind them, CHISHOLM appears in the doorway.  He's human again, but clutching a Cyber-gauntlet.
	--As the Cyberleader turns on him...
		chisholm::SID_0333:Delete this!
	--And Chisholm takes out the Cyberleader. 
		doctor::SID_0334:Feeling better, Mr. Chisholm?
		chisholm::SID_0335:I am now! 
	--Chisholm kicks one of the dead Cybermen with satisfaction.
		amy::SID_0336:But what about Fort Cecil? How do we stop the Cybermen?
		doctor::SID_0337:We turn their own bodies against them.
		amy::SID_0338:And you know exactly how to do that?
		doctor::SID_0339:Of course. I can reprogram the nanoforms in the Cybermen's body chemistry to attack them.  
		doctor::SID_1030:At least, I hope I can.

	HideLetterBox()
	doctor:SetBehaviour("pc")
end
