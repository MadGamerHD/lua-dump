global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	--CUT SCENE 11
	--INT. TARDIS DRAWING ROOM - DAY 
	--The Doctor notices the broken bottle under the chair.
		doctor::SID_1181:No no no, that's impossible. It had a triple-deadlock forcefield. That means The Entity has escaped!
		
	--CUT SCENE 13
	--INT. TARDIS CONTROL ROOM - DAY
	--The console lights up. The Doctor put the time bandage in
	--a panel, sets a timer on the monitor, and starts recording.
		doctor::SID_1184:Amy! It's me. Well, a recording of me...
	-- INT. TARDIS CONTROL ROOM - DAY 
	-- A thousand years from now, in Amy's time zone. She paces
	-- around the room, scared, wondering what to do.
	-- POV: the Entity stalks her. Amy turns but the Entity hides.
		amy::SID_1185:Hello? Doctor, is that you?
	--The Entity lurks just out of her field of vision. Until
	--suddenly it attacks, darting at her repeatedly. Amy falls
	--to her knees, glowing the same colour as The Entity.
		amy::SID_1186:Get off me!
	--She swipes at it, sending it flying backwards temporarily.
		amy::SID_2475:Argh!
	--Just then, an alarm blares on the console. The Doctor's
	--face appears on the monitor screen.
		doctor::SID_1187:Amy! It's me. Well, a recording of me... but that's neither here nor there. Unlike us, who are both here and there... in a sense.
		amy::SID_1189:Stop rambling!
		doctor::SID_1190:Anyway, I'm rambling. The time riptide has destabilised a forcefield which was trapping a sort of glowy, blobby thing called The Entity. 
		doctor::SID_1191:It's not aftershave, it's a hungry lifeform. And it wants to eat the time energy from your past. 
		amy::SID_1192:It's bad, I get it! Talk faster!
		doctor::SID_1193:There's a lesion in time, separating us by a thousand years. You're in my future, so I've set this alarm for you. 
		doctor::SID_1194:You need to answer some questions, to prove who you are. If someone else finds this before you, it'll stop them unlocking the code.

	--CUT SCENE 14
	--INT. TARDIS CONTROL ROOM - DAY 
	--New feedback for player
		doctor::SID_2479:Excellent, you're hearing me say this, so you must have answered the questions correctly.
		doctor::SID_2480:Unless you didn't, in which case, you can't, and I'm talking to myself. Again.
	--Amy gets the Time Bandage. The Doctor talks on the monitor.
		doctor::SID_1195:It needs to be activated at both ends of the time lesion. Just press the button, and it'll sync up with the one in my timezone!
	--Suddenly, the Entity darts at Amy, making her go liquidy
	--and weak (effect to be determined).
		amy::SID_2462:Cough.
		amy::SID_1525:No! No, what have you done to me?
	--She staggers around, growing weaker, and just about manages to press. 
	-- The TARDIS is thrown around
	--violently, the gears of time scraping and grinding.
	--Everything goes into double vision, before resolving
	--normally. The Doctor and Amy are in the same room again.
		doctor::SID_1196:Amy! You did it!
		amy::SID_1197:Yay, go me. Still feeling a bit wobbly though...
	--She's changing again, worse this time. And now the Entity
	--heads straight for Amy and The Doctor.
end
