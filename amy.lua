global model
global function Interact()

	local amy = GetActor("amy")
	SayPrep("skip", "async")
	--TALK
	--interact with Amy by the TARDIS
	amy::SID_0021: I'm going to start getting cold soon.
end

global function Trigger()
	local amy = GetActor("amy")
	SayPrep("skip", "async")
	--VO
	--if player tries to get Amy to climb down the chasm
	amy::SID_0022: I'm not going down there. I’ll never get back up in these shoes.
	amy:Teleport(FindNodeByName("loc_doctor_investigate"))
end




global function Talk() --act2
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	SayPrep("skip", "async")
	
	if(1 == 1) then
	amy:: [HELPFUL HINT HERE]
	
	else
	--TALK
	--Amy's helpful hints Act1 - Explore plateau
	amy:: I'm cold. What are we looking for?
	
	--TALK
	--Amy's helpful hints Act1 - Find a way down to the driver (a)
	amy:: There must be a way down to that driver.
	
	--TALK
	--Amy's helpful hints Act1 - Find a way down to the driver (b)
	amy:: I'll stay here while you climb down there.
	
	--TALK
	--Amy's helpful hints Act1 - find SatNav
	amy::SID_0381:Have you figured out where Chisholm came from yet?
	doctor::SID_0382:No, and he's out cold.
	--TALK
	--Amy's helpful hints Act1 - find SatNav
	amy::SID_0383: Look around where the skidoo crashed. Maybe there's a clue there somewhere.
	doctor::SID_0384:Thanks, Amy.
	
	--Amy's helpful hints Act1 - Use satnav with TARDIS
	amy::Can the TARDIS use the Sat Nav?
	
	
	--TALK
	--Amy's helpful hints Act2 - get in to base (a)
	amy::That slave knew how to get in at out of the base.
	--TALK
	--Amy's helpful hints Act2 - get in to base (b)
	amy::Maybe the cyberslave had a key.
	--TALK
	--Amy's helpful hints Act2 - find nest
	amy::SID_0385:I think that cybermat went into the ventilation system.
	--TALK
	--Amy's helpful hints Act2 - find door code
	amy::SID_0386:Maybe this Meadows wrote the code down somewhere. I would.
	--TALK
	--Amy's helpful hints Act2 - take serum to chisholm
	amy::SID_0387:We better get that serum to Chisholm fast.
	--TALK
	--Amy's helpful hints Act3 - stealth section
	amy::SID_0388:All these cyberslaves look like they're patrolling. I bet we can slip past.
	doctor::SID_0389:Yes, but let me lead.
	amy::SID_0390: Are you asking me to dance?
	doctor::SID_0391: In a way, yes. Come on.
	--TALK
	--Amy's helpful hints Act3 - pneumatic lifts
	amy::SID_0392: These lifts won't hold both of us.
	--TALK
	--Amy's helpful hints Act3 - open cuffs
	amy::SID_0393: Get these cuffs off me.
	--TALK
	--Amy's helpful hints Act3 - open cuffs
	amy::SID_0394: You must be able to open them somehow. The screwdriver?
	--TALK
	--Amy's helpful hints Act3 - blast the wall
	doctor::SID_0395:We can't go through the door, they'll catch us instantly.
	--TALK
	--Amy's helpful hints Act3 - blast the wall
	amy::SID_0396:Then we'll have to go through the wall.
	--TALK
	--Amy's helpful hints Act3 - blast the wall
	amy::SID_0397: Can't we use the lasers somehow?
	end
end