global script_node

global function run_cutscene()
	local doctor = GetActor("doctor")
	local meadows = GetActor("meadows")
	local doctor_point1 =FindNodeByName("loc_csd_doctor1")
	local doctor_point2 = FindNodeByName("loc_csd_doctor2")
		
	doctor:SetBehaviour("wait")

	SayPrep("skip", "")
	ShowFade()

	Wait(1)
	ShowLetterBox()
	doctor:Teleport(doctor_point1)	
	HideFade()
	
	--CUT SCENE 11
	--INT. CONTROL ROOM/CONVERSION CHAMBER  DAY
	--THE DOCTOR enters the control room - PROFESSOR MEADOWS is
	--there. Half in shadow. We see only one side of her face.
		doctor::SID_0347:Professor Meadows! I was afraid the Cybermats had got you. 
	--She turns to face him - and he sees that she is metal.
		doctor::SID_0348:Ah! I see...
	--And two more CYBERSLAVES emerge from the darkness, flanking her.
		meadows::SID_0349:I don't think so, Doctor. 
		doctor::SID_0350:You must spend hours in front of the mirror in the morning.
	--Meadows takes a menacing step towards him -
		meadows::SID_0351:Humour is a redundant application of intellect.
		doctor::SID_0352:I don't know, I find it comes in handy in a tight spot. So you were a Cyberslave from the start?
		meadows::SID_0353:And you answered the distress call I directed at your TARDIS.
		doctor::SID_0354:What do you want with me? And what have you done with my friend Amy? 
	--Meadows turns on a monitor - it shows AMY, struggling, but strapped to the table in a conversion chamber.
		doctor::SID_0355:That's a Cyber-conversion Chamber. Don't you dare touch her!
		meadows::SID_0356:Then comply with my demand. 
		doctor::SID_0357:Which is?
		meadows::SID_0358:This ship was caught in a temporal storm and crashed. The cryo-systems are too badly damaged for us to repair, to re-animate my Cyber-brethren.  
		meadows::SID_0359:But you, Doctor... You have the genius of a Time Lord. 
		doctor::SID_0360:You want me to wake a Cyberman invasion of Earth? You're mad!
	--On the monitor - the cyber-conversion lasers and cutters twitch and twist, threatening what they'll do if he doesn't agree...
		meadows::SID_0361:It is your choice, Doctor. Wake them, or your companion becomes the first of a new line of Cybermen. 
	--The cyber-conversion gear whizzes and hums.  Amy shrinks back from it.
	--The Doctor is cornered.
		doctor::SID_0362:All right! Yep, all right I'll do it!
	
	doctor:SetTarget(doctor_point2)
	doctor:SetBehaviour("move")
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local NanoMinigame = MinigameManager:GetNanoMiniGame()
	local script = FindNodeByName("script_nano_minigame")
	
	HideLetterBox()

	--Negotiate the gantries
	SetGlobalObjectiveState("Cyber_3_2_1", 3) -- 2 is unlock, 3 is done
	--Find out where AMy has been taken
	SetGlobalObjectiveState("Cyber_3_2_2", 3) -- 2 is unlock, 3 is done	
	--Wake the cybermen
	AddGlobalObjective("Cyber_3_3")

	NanoMinigame:Easy()
	MinigameManager:SetCallback(script, "Run_cutscene")
	MinigameManager:StartMiniGame(NanoMinigame)	
end
