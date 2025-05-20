global function Temp()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")

	--[[ACT ONE]] 
	--CUT SCENE 1
	--INT.TARDIS
	--The Doctor is at the console, excited, pulling levers and pushing buttons as the TARDIS gets ready to materialize. He's really jazzed.
		doctor::SID_0556:1963. Such a good year! 
	--Amy joins him at the console, playful. 
		amy::SID_0557:That the year you bought that outfit, then?
	--The Doctor peers at her from around the pulsing time rotor.
		doctor::SID_0558:You know, we can go to see the Beatles play in 1963 - but the Ice Age is only a click away on the dial.
	--Amy beams. 	
		amy::SID_0559:Can I meet John Lennon?
		doctor::SID_0560:What? Not Ringo? Why doesn't anybody ever want to meet Ringo?
	--And the TARDIS is landing...
		amy::SID_0561:There's no such thing as a sexy drummer. 
	--The Doctor is heading for the doors and turns back abruptly 
		doctor::SID_0562:You know, I'd never considered that. Then again, why would I?
	--Then, heading for the doors again, as Amy joins him...
		doctor::SID_0563:1963. 
		doctor::SID_0821:The Beatles' first two albums, Sean Connery as James Bond, The Kinks, The Rolling Stones, Mary Quant, John Steed and Cathy Gale... 
		doctor::SID_0564:Right now, out there London is the coolest place not just on Earth, but the whole galaxy.
	-->And he pushes open the doors...
	
	--TITLES
	--CUT SCENE 2
	--EXT. RUINED LONDON -- CONTINUOUS
	--As The Doctor and Amy stay out of sight, the Dalek closes on Sylvia - who stands, defiant.
		dalek::SID_0503:Exterminate!
	--As Sylvia grasps a detonator. Triggers it.
	--Explosives hidden in the nearby rubble explode - momentarily obscuring the Dalek with smoke and dust
		dalek::SID_1278:Argh!
	--Sylvia makes her getaway to a nearby manhole cover (which she lifts and disappears beneath). 
		amy::SID_0008:We've got to talk to her!
		doctor::SID_0019:Wait!
	--And through the settling dust and smoke comes the undamaged pair of Daleks. 
	--They watch them move until they stop.
		doctor::SID_0013:Now we've got to talk to her. Come on.
	--*NOTE 
	--This dialogue is from the Doctor.
		amy::SID_0953:That woman has gone underground. We have to find a way to follow her.

	--CUT SCENE 3
	--EXT. RUINED LONDON -- DAY
	--Doctor assesses the taxi.
		doctor::SID_0018:This looks like it could smash through that barrier.
		doctor::SID_0009:Amy, can you give me a hand?
		amy::SID_0007:Sure
		--doctor::SID_0015:1...
		--doctor::SID_0016:2...
		--doctor::SID_0017:3...
	
	--As The Doctor and Amy stand clear, the taxi rolls down the slope and crashes through the barricade.	
		doctor::SID_0012:Well, not exactly elegant. But it did the job.
	--As they approache the opening. Darkness beyond.
		amy::SID_0004:It's dark down there. When I said I wanted to meet the Beatles I meant the band, not the bugs.
		
		--doctor::SID_0010:Or you can stay up here and meet the Daleks. But they're more heavy metal.
	--CUT TO:
	--INT. UNDERGROUND TUNNEL -- DAY
		--doctor::SID_0499:The platform must be up ahead. But we're going to have to get through that gate to get to it.
	
	--CUT SCENE 4
	--INT. UNDERGROUND TUNNEL -- DAY
	--The Doctor uses the Sonic on a grill door and it opens.	
		doctor::SID_0507:Be careful down here. You never know what you're gonna to find on the Underground. Rats, dinosaurs, yetis...

	--They proceed onto the platform.
		doctor::SID_0509:The woman we saw must be around here somewhere...
	--Camera cuts to Sylvia view.
	--Sylvia brandishes a pipe.
		sylvia::SID_0510:Don't move!
	--The Doctor and Amy turn to see Sylvia, as defiant as the moment she blew up the Dalek.
		doctor::SID_0511:Ah - there you are. Hello.
	
	--CUTSCENE 5
	--CUT TO:
	--EXT. LONDON SKY (MATTE) -- DAY
	--A portal opens in the sky. It's like a tear in the fabric of reality.
		sylvia::SID_0523:Legions of Daleks flying out of it. So many they turned the sky dark.
	--Legions of DALEKS flying out of the portal, across the sky...
		sylvia::SID_0524:Thousands and thousands of them. Thousands!
	--A CLOSE-UP of one of the hovering  Daleks - coming right into camera.
	--It fires. A flash of blinding, deadly light.
		dalek::SID_0856:Exterminate!	
		
	--CUT SCENE 5.2
	--Cut to Dalek shadow camera
	--Noise heard, then Daleks appear.
		amy::SID_0537:What was that? 
	--As Daleks appear further down the tunnel. The Doctor and Amy pull back behind cover.
		doctor::SID_0955:I think it just got even more dangerous.
	--CUT TO:
	--INT. UNDERGROUND TUNNEL -- CONTINUOUS
	--Sylvia has run to fuse box, player follows but approaching Dalek blocks their path.
		doctor::SID_0539:Sylvia is safe, the Daleks can't see her. But we're going to have to be very careful if we're going to get to her.

	--CUT SCENE 7 (see "escape")

	--CUT SCENE 8
	--INT. TARDIS
	--Once inside Amy collapses. 
		amy::SID_1158:Coughs.
		amy::SID_0571:Doctor! 
		doctor::SID_0572:Amy?
		--amy::SID_1159:Weeps.
		
	--The Doctor and Amy move towards the control console.
		doctor::SID_0573:It's all right, Amy. You're going to be all right. 
	--And she's starting to recover...
		amy::SID_0574:I felt so weird...
	--The Doctor regards her with a grave concern that doesn't let her see, then sets about operating the TARDIS instrumentation.
	--(Doctor move to console, grave expression, interact anim)
		doctor::SID_0575:It's going to be all right, Amy. I promise you. If I can analyse the time and the place that the Daleks altered the timeline...
		amy::SID_0577:But I don't get it. If humanity is destroyed in 1963 - how am I still here?
		doctor::SID_0578:The TARDIS protects you. 
	--He glances at her for a second, as he works the instruments feverishly.
		doctor::SID_0579:But we have to act quickly.
	--He hits a button with a triumphant flourish.
		doctor::SID_0580:Gotcha! 
	--But the triumph soon slips off his face as he reads the results. 
		amy::SID_0581:What is it?
		doctor::SID_0582:The source of the Daleks' time-meddling. It's Skaro. The planet of the Daleks!
	
	--CUT SCENE 8.1
	--CUT TO:
	--EXT. RUINED LONDON 
	--And the TARDIS de-materializes.
	--*NEW
		doctor::SID_1050:Co-ordinates set - we're going back to where it all began. And we're going to save the human race.


end
