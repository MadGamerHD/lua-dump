global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local entity = GetActor("amy")

	-- [ACT THREE]
	-- CUT SCENE 15
	-- INT. TARDIS CONTROL ROOM - DAY 
		amy::SID_2464:Cough.
	-- The Entity heads for the Doctor, who holds one hand up,
	-- palm out, and yells:
		doctor::SID_1198:STOP!
	--The Entity stops, hovering. The Doctor looks surprised.
		doctor::SID_1199:Ooh. That hardly ever works...
		amy::SID_1200:Fix now! Applause later!
		doctor::SID_1201:Now I know you understand me. Speak! The TARDIS translation circuits will allow us to hear you.
	--The Entity's voice comes through the TARDIS internal
	--speakers. Loud, deep, emotionless.
		entity::SID_1202:Then hear this: you will perish.
		doctor::SID_1203:Release Amy, right now. Or I'll lock you up again while you're busy finishing her off.
	--He takes another ornate bottle from a panel on the console.
		entity::SID_1204:No. You held me prisoner before.
		doctor::SID_1205:I had to. If you kept eating, there'd be nothing left. It'd get very boring. Now let her go.
		entity::SID_1206:But I must feed. On both of you.
		doctor::SID_1207:You don't need to do that.
		entity::SID_1208:I must feed!
		doctor::SID_1209:Yeah, yeah, yeah, you said that. Blimey, see why I kept it locked up? I've found a place you can feed safely. An all-you-can-eat buffet.
		entity::SID_1212:Where is this place?
		doctor::SID_1213:Let Amy go. Give her back her time, and I'll tell you. Your choice: feed forever, or keep Amy and starve in here.
	--He waves the ornate bottle threateningly. Pause. The Entity
		entity::SID_1815:You have so much time. I will feast on you instead.
	--It moves towards the Doctor, who quickly hits a button on the console. The Entity is sucked into the bottle.
		entity::SID_1816:No! I must feed!
		doctor::SID_1817:Stop hurting my friend! Now! Give her back her time, or I'll never let you eat again.
	--Pause. The Entity glows, and Amy goes back to normal.
		amy::SID_1214:Thank you.
		doctor::SID_1215:I've a good mind to just leave you in there. But I keep my word.
	--He throws open the TARDIS doors. Blue clouds of Chronomites
	--float about in the void.
		doctor::SID_1216:Chronomites. Four-dimensional void creatures, streaming through the time riptides for infinity.
		doctor::SID_1217:Eat their past, and they just circle back around again, unharmed. You can stuff your face! 
		doctor::SID_1818:If you have a face, I don't know... Now, are you going to behave yourself?
		entity::SID_1218:This is acceptable. Release me. 
	--It zips out through the doors, and the Doctor closes them.
		amy::SID_1219:You didn't mention the itching.
		doctor::SID_1220:No, completely slipped my mind.
		--doctor::SID_1785:Let's start the launch sequence and get out of here!
	
	-- CUT SCENE 16
	-- INT. TARDIS CONTROL ROOM - DAY 
	--The Doctor pilots the TARDIS, as they head off.
		doctor::SID_1221:Now, where were we? Oh yes, sightseeing. Somewhere nice.
		amy::SID_1222:And no trouble, this time?
		doctor::SID_1223:Where's the fun in that? Ooh, hang on - I know just the place. You'll love it, it's very quiet, peaceful, and perfectly safe...
	--INT. POSEIDON. SUB-AQUATIC TUNNEL 2 - NIGHT 
	--The glass Poseidon base tunnels. The TARDIS starts to materialise in the tunnel.
	-- THE DOCTOR (O.S.)
		doctor::SID_1225:Here we are. London after the Great Flood of the Twenty Third Century.
	--The TARDIS doors fly open. And The Doctor steps out.
	--Clocks his surroundings.
		doctor::SID_1226:Oh.	
end
