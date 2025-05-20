global script_node

global function xPerformCutscene1()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	--ACT ONE
	--PER-TITLE SEQUENCE
	--CUT SCENE 1
	--INT. POSEIDON. SUB-AQUATIC TUNNEL 1 -- NIGHT
	--CRASH INTO THE ACTION.
	--ALARMS roaring. RED EMERGENCY LIGHTS flashing
	--As THE DOCTOR and AMY run for their lives.
	--They're in a giant transparent tube that runs along the ocean floor. Beyond the glass walls - the ocean and the seabed. Out there are cultivated prairies and heavy-duty agricultural gear - but we'll only catch the briefest glimpse of all this...
	--As Amy throws a panicked look outside -
		amy::SID_1587:It's coming at us again!
	--What gets our attention out there is the huge shadowy creature that's headed like a gigantic torpedo for the glass tube.
		doctor::SID_1588:That glass won't take much more punishment!
	--And the gigantic shadow is hurtling closer - and now we can see what it is.
	--A 50ft long SHARK MONSTER. Terrifying, armour plated, with two tails and snapping savage jaws, not of this world - this thing would eat the Amity shark for dinner. 
	--And it's got its eye on the Doctor and Amy.
	--As it hits the glass like a torpedo.
	--The tube shakes.
		amy::SID_1589:Doctor!
	-- - A crack in the glass.
		doctor::SID_1590:Quickly!
	--As they reach an airlock door.
	--Outside, with a flick of its tail, the shark monster moves off - 
	--The Doctor hits the OPEN button on the airlock - 
	--And the shark monster is turning - heading for the tunnel again. Another attack.
	-- - The airlock doesn't open. 
	--The Doctor sees the shark monster hurtling towards them again.
		doctor::SID_1591:Just when I thought it was safe to go back in the water!
	--And the shark monster is looming large.
	--The Doctor has the SONIC SCREWDRIVER out. 
	--Zaps the lock. The airlock opens.
	--The shark monster hits the glass again. 
	--The crack starts to spread. The glass fracturing. About to give.
	--The Doctor and Amy leap through the airlock door. Slam it shut behind them.
		doctor::SID_2687:Argh!
		amy::SID_2688:Argh!
	--Behind them - the sound of the tunnel imploding, filling with water.
	--But the Doctor and Amy have their backs to the airlock door. 
	--They look at each other - and laugh. Total relief.
		doctor::SID_2689:Ha ha ha.
		amy::SID_2702:Ha ha ha.
	--As they slide down the door into a sitting position - alongside them, glass tubes along the airlock door filling with water as the devastated tunnel is swamped by the ocean. The Doctor notes, grim.
		doctor::SID_1592:Oh, that is not good.
		amy::SID_1593:What?
	--And we see that they are in another length of glass tunnel, just like that they've just escaped.
	--Outside they see debris from the smashed tunnel floats past outside. 
		doctor::SID_1594:The tunnel. I'm afraid it isn't there any more. Which means...
		amy::SID_1595:We can't get back to the TARDIS.
	-- - and then they see the SHARK MONSTER slides past outside, its eye on them.
	--CUT TO:
	--TITLES

end

global function xPerformCutscene2()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	--CUT SCENE 2
	--INT. POSEIDON. SUB-AQUATIC TUNNEL 2 -- NIGHT
	--CLOSE-UP ON THE TARDIS MATERIALIZING.
	--ON SCREEN CAPTION - FIVE MINUTES EARLIER
	--THE DOCTOR (O.S.)
		doctor::SID_1596:Here we are. London after the Great Flood of the Twenty Third Century.
	--The TARDIS doors fly open. And The Doctor steps out. Clocks his surroundings.
		doctor::SID_1597:Oh.
	--The TARDIS has materialized in the glass tunnel. Around them the ocean. Above them fathoms and fathoms of water. The ocean floor.
	--Amy joins him. Bewildered and amused.
		amy::SID_1598:It is definitely an umbrella day.
		doctor::SID_1599:Maybe a few miles to the left of London. 
	--Amy is fascinated. Touches the side of the glass tunnel.
		amy::SID_1600:How many, exactly?
	--The Doctor takes it all in, equally fascinated.
		doctor::SID_1601:After the ice caps melted London became an island all on its own. I'd say about a thousand miles to the left. And south. A bit. 
		amy::SID_1602:How long have you been running around in that TARDIS? And you still can't fly straight!
		doctor::SID_1603:Flying a TARDIS isn't like riding a bike, you know. There are more pedals, for a start!
	--And the Doctor heads off down the tunnel - it stretches on and on, and interconnects with other tunnels. 
	--Amy is taking in the wonders. Then sees the Doctor is on the move. She runs after him.
		amy::SID_1604:So what is this place?
	--The Doctor turns back to her smiles.
		doctor::SID_1605:Sub-aquatic community.
	--Raises his arms, expansively.
		doctor::SID_1606:Isn't it amazing?!

	--CUT TO:
	--EXT. POSEIDON COMMUNITY -- NIGHT
	--Elevated shot (MATTE) of the Poseideon Community - an extended ocean floor base of large glass installations surrounded by a network of glass tunnels (the Doctor and Amy are in one of them). Poseidon works the marine prairies around it and the mineral mine that is also in evidence. The Poseidon illuminations give the whole place an eerie beauty. But there is no sign of life in the fields or around the machinery.
	--As the CAMERA closes on the community...
	--THE DOCTOR (V.O.)
		doctor::SID_1607:When the oceans rose 75 per cent of Earth's landmass drowned. Humanity built its own new islands, and moved on to the ocean bottom to farm and mine for minerals. 
	--And the CAMERA closes on one specific installation - Poseidon 8.

	--CUT TO:
	--INT. POSEIDON. SUB-AQUATIC TUNNEL 2 -- NIGHT
	--THE DOCTOR and AMY have come to an intersection of tunnels - each one with an airlock.
		doctor::SID_1608:You're a resourceful lot, you humans. That's why I love you! You'll move in anywhere. A bit like hermit crabs. 
		amy::SID_1609:Crabs? Yeah, thanks a lot.
	--The Doctor is studying a plan on the wall. Headed POSEIDON, it shows the layout of the whole community.
		doctor::SID_1610:Poseidon Eight. That's the closest. Come on. Be rude not to say hello.
	--The Doctor pushes a button on the airlock. It opens and they go though.
end

global function xPerformCutscene3()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local flanagan = GetActor("flanagan")

	--CUT SCENE 3
	--INT. POSEIDON. SUB AQUATIC TUNNEL 1 -- NIGHT
	--The SHARK MONSTER is hurtling towards the tunnel again - as THE DOCTOR and AMY rush to the next airlock.
		amy::SID_1611:What is that thing? It's not like any shark I ever saw.
		doctor::SID_1612:Of course not. It's not a shark... and it's not from Earth.
	--As he pulls out the SONIC SCREWDRIVER. Zaps the airlock.
	--As the creature hits the glass. As the shark monster comes around for another attack - 
	--And the airlock door suddenly flies open - revealing a man - MARTIN FLANAGAN - young and scared.
		flanagan::SID_1613:Quick! Inside!
	--They dive through the airlock -
	--As the shark monster hits the glass again.
	--CUT TO:
	--INT. POSEIDON. ANTE-CHAMBER -- CONTINUOUS
	--The airlock shuts behind THE DOCTOR, AMY and FLANAGAN.
	--THE DOCTOR(indicating)
		doctor::SID_1614:The Doctor. Amy. You?
		flanagan::SID_1615:Martin Flanagan. Doctor? Then there's a hospital ship up top? You came down in a bathysphere? 
		amy::SID_1616:Is that like some newfangled 23rd Century corner bath, only no corners?
		doctor::SID_1617:She's still getting used to the pressure. 
		flanagan::SID_1618:Oswald must've got an SOS out. Maybe Jones will let me into Poseidon now there's medical help.
	--The Doctor is intrigued...
		doctor::SID_1619:Who needs medical help?
		flanagan::SID_1620:The sickness. It's taken everyone on the base. Oswald has put the place on lock-down. That's why Jones won't let me in.
		flanagan::SID_1621:I was working a harvester out on the prairie. That creature attacked us... killed Pat, the base leader. I'm the only survivor.
		flanagan::SID_1622:And then Jones wouldn't let me in. Because of the quarantine. The creature had knocked out communications. I've been stuck here two days.
		amy::SID_1623:What kind of idiot is this Jones?
		flanagan::SID_1624:It's a computer.
end

global function PerformCutscene3_1()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local flanagan = GetActor("flanagan")
	local jones = GetActor("jones")

	--CUT SCENE 3.1
	--INT. POSEIDON. ANTE-CHAMBER -- NIGHT
	--The airlock door opens before THE DOCTOR, FLANAGAN and AMY.
		doctor::SID_1625:Open Sesame. Thanks for your help, Jones.
		jones::SID_1626:It's been a relief to talk to someone who understands me, Doctor.
	--Amy grins at the Doctor.
		amy::SID_1627:Oh, boy. I think you've pulled.
	--The Doctor gives her a wink.
		doctor::SID_1628:Well, I can see the attraction.
end
