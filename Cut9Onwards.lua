global function Cut9()
end

global function Cut11()
end

global function Cut12()
end

global function Cut13()
end

global function Cut14()
end

global function Cut15()
end
	
global function Cut16()
end

global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	SayPrep("skip","")

	--ACT ONE
	--CUT SCENE 1
	--INT. TARDIS CONTROL ROOM - DAY - The TARDIS is mid-flight, the Doctor operating the console.
		doctor::SID_1095:That's not true!
		amy::SID_1096:Okay then, name one of your holidays that didn't end up in a big, mad disaster.
		doctor::SID_1097:Well, there was Brighton beach - actually no, that didn't end well... Had a lovely time in Paris - no, that all went a bit wrong...
		amy::SID_1098:Still waiting...
		doctor::SID_1099:Trouble seems to follow me around.
		amy::SID_1100:Hmm, I've noticed. And it's never your fault, of course.
		doctor::SID_1101:Well, not always. Sometimes things go wrong all by themselves.
	--Suddenly loud sirens and alarms wail, and the TARDIS is thrown around. They hang on as a series of loud bangs and scrapes hit the outside walls. They shout to be heard.
		amy::SID_1102:BIT LIKE NOW, THEN!
		doctor::SID_1103:WE'RE STILL IN THE WRONG TIME VORTEX! SOMETHING'S WRONG!
		amy::SID_1105:REALLY? WHAT GAVE IT AWAY?
	--The TARDIS is yanked sideways. The doors fly open and air rushes out, pulling the Doctor and Amy towards the open doors. They cling to the console. Outside is a swirling void. The Doctor loses his grip, and is pulled outside!
		amy::SID_1106:Doctor!
	
	--CUT SCENE 2
	--INT. TARDIS CONTROL ROOM - DAY
	--The TARDIS stabilises. All is calm. Amy looks out the
	--open doors, and sees the Doctor floating a few yards away.
	--The Doctor yells - but no sound comes out. He's surrounded
	--by a cloud of tiny blue particles. He gasps for air, unable
	--to breathe. He waves at Amy frantically.
	--Amy sees the Doctor shouting, but not making a sound.
		amy::SID_1080:I can't hear you! Speak up!
	--He points at his throat, frantically. Amy gets it.
		amy::SID_1812:Oh! You can't breathe! Okay. What do I do? How do I fix it? Quick!
	--The Doctor thinks, then holds up two fingers.	
		amy::SID_1081:Oh great, we're both terrible at Charades... Okay! Two words.
	--The Doctor holds up one finger.
		amy::SID_1082:First word. Hurry up!
	--The Doctor touches his ear.
		amy::SID_1083:Sounds like.
	--The Doctor points to his chest - as Amy tries to guess,
	--he keeps pointing at his chest, then beats it like a
	--gorilla, and scratches under his arms like a chimp.
		amy::SID_1084:You. The Doctor. Heart. Two hearts. Monkey? Gorilla? King Kong? Tarzan? Ribs? Chest? Chest!
	--The Doctor nods and points - finally...
		amy::SID_1085:Sounds like "chest". Guest? Best?
	--The Doctor mimes pressing something.
		amy::SID_1086:Press?
	--He nods and points.
		amy::SID_1087:Press doesn't rhyme with chest!
	--The Doctor shrugs - who cares?! Holds up two fingers.
		amy::SID_1088:Second word. Sounds like.
	--The Doctor touches his head until Amy figures it out.
		amy::SID_1089:Face. Hair. Head. Head! Sounds like "head". Bed? Dead? Red? Red! 
	--He nods! That's it!
	--(looks at the panel)
		amy::SID_1090:Press red! Okay! Which one? There are loads of red things on here.
	--The Doctor makes a big circle with his hands.
		amy::SID_1092:All of the red things? Okay then...

	--CUT SCENE 3
	--Amy can now hear the Doctor's voice.
		doctor::SID_1062:King Kong? Why would I tell you to "press King Kong"? Never mind, I'm just glad I can breathe again: the TARDIS reset has automatically extended the airshell.
		doctor::SID_1811:Right, so, here's the thing: we're caught in a riptide in the fabric of space/time.
		doctor::SID_1063:We're stuck in one of the "pockets", and we don't have long until the TARDIS gets dragged to the next one.
		doctor::SID_1064:You'll have to find something you can use as a Tractor Beam, and attach it to the console. You should find what you need in the Drawing Room.
		doctor::SID_1065:Hurry, before the TARDIS gets dragged away - I'll be trapped here with no way back
	--Extra line for the following conversation to make more sense
		amy::SID_1828:And how, exactly, am I supposed to find the Drawing Room? I've never been there before!
	
	--CUT SCENE 3_B - Orignally cut 5, but moved to the end of cut 3
		doctor::SID_1071:Right, it's very simple: take the corridor for about half a mile. Turn left, then right, then right again, and then it's your third next right.
		doctor::SID_1073:Go past the weird swirly thing, left, then your other left, through the sun room, careful not to trip over the sun lounger, then you'll see a green door. Don't go in there! 
		doctor::SID_1075:Go right, follow the wall until it gets a bit slimy, then take the lift to the third floor. Drawing Room's straight ahead. You can't miss it. Easy peasy.
		doctor::SID_1077:Now, that is my private study, so don't mess about with anything. And nobody sits in my chair but me! Good luck.
	--Amys question because she cant get out of the control room currently.
		amy::SID_1066:Doctor, I can't get out of this room! Everything's gone all weird!
	--CUT SCENE 4 - VOICEOVER 1.2 - INT. TARDIS CONTROL ROOM - DAY - Doctor's voiceover.
		doctor::SID_1067:That'll be the time riptide, messing around with the internal structure of the TARDIS.
		doctor::SID_1068:You can fix it by aligning the levers on the Mechanical board - make them all point upwards.
		doctor::SID_2489:You should have remembered that from the last time you were stuck in there on your own. Actually, maybe I forgot to tell you about that one... Well, now you know.
		doctor::SID_1069:And be quick - these blue things are Chronomites, four-dimensional creatures that live in the void.
		doctor::SID_1819:Mostly harmless, but Blimey O'Reilly they're itchy...
	
	--CUT SCENE 7
	--Drawing Room
		amy::SID_2398:A Laser Screwdriver - the laser might just work as a Tractor Beam thingy.
		amy::SID_1132:Well if there wasn't so much junk everywhere, that wouldn't have happened...

	--CUT SCENE 8
	--INT. TARDIS CONTROL ROOM - DAY
	--Amy aims the laser screwdriver with the gyroscope, and presses the button. The tractor beam shoots out and grabs
	--the Doctor, yanking him around as Amy struggles to control the beam. She pulls him in, and switches off the beam.
		doctor::SID_1110:Oh, that's a relief. Did I mention just how itchy those things are?
		amy::SID_1111:Once or twice... By the way, you really need to tidy that Drawing Room. And I owe you a new thingy of aftershave.
		doctor::SID_1113:Aftershave? I don't have any...
	--The doors slam shut, and the TARDIS lurches to the side.
	--Alarms go off, and the grinding and clanking starts again.
		doctor::SID_1114:We're sliding onto the next pocket!	
	--Now the Cloister Bell starts ringing.
		amy::SID_1115:Oh good, a bell! Because the other alarms weren't loud enough!
		doctor::SID_1116:That's the Cloister Bell! It means something is very, very wrong! And I don't know how to...
	--Suddenly everything stops, as the Doctor is mid-sentence.
		doctor::SID_1117: ...fix it! That's weird.
	--All is quiet. The alarms have all stopped, the TARDIS has
	--stopped moving. The lights are down low, emergency power.
	--And Amy has vanished.
		doctor::SID_1118:Amy?
	--INT. TARDIS CONTROL ROOM - DAY
	--Amy is on her own, and the TARDIS lights are even lower.
	--Dust coats the surfaces. The TARDIS seems dead or dying.
		amy::SID_1135:Doctor? Where's he gone now? Oh, great. Would anything else like to go wrong? Anything at all?
end
