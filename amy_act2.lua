global model

global function Interact()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.

	SayPrep("skip", "async")
	
	if amy:IsDetected() then
	--HINT
	--Talk Amy - detected in stealth mode.
	--*NOTE: If detected and escaping Daleks no hint given.
		amy::SID_2025:Run!
	else
		amy:SetFocus(doctor)
		if(hint == "hint_211a") then
			--HINT
			--Amy's helpful hints Act2 - get in to base (a)
			amy::SID_0994:That Cyberslave knew how to get in and out of the base.
		elseif (hint == "hint_211b") then
			--HINT
			--Amy's helpful hints Act2 - get in to base (b)
			amy::SID_0995:Maybe the Cyberslave had a Key.
		elseif (hint == "hint_212a") then
			--HINT
			--Amy's helpful hints Act2 - get in to base (b)
			amy::SID_0996: You picked up the Keycard to the door, didn't you?
		elseif (hint == "hint_231a") then
			--HINT
			--Amy's helpful hints Act2 - get in to base (b)
			amy::SID_0997: Maybe there are more survivors than Chisholm. We just need to find them.
		elseif (hint == "hint_231b") then
			--HINT
			--Amy's helpful hints Act2 - get in to base (b)
			amy::SID_0998: Have we been through the whole base? There must be other people here.
		elseif (hint == "hint_241a") then
			--HINT
			--Amy's helpful hints Act2 - find nest
			amy::SID_0385:I think that Cybermat went into the ventilation system.
		elseif (hint == "hint_232a") then
			--HINT
			--Amy's helpful hints Act2 - find door code
			amy::SID_0386:Maybe this Meadows wrote the code down somewhere. I would.
		elseif (hint == "hint_232b") then
			--HINT
			--Amy's helpful hints Act2 - find door code
			amy::SID_0999: The code to the Lab door could be in a file on a Computer somewhere.
		elseif (hint == "hint_233a") then
			--HINT
			--Amy's helpful hints Act2 - open door
			amy::SID_1000:Let's go check if that code will open the lab door.
		elseif (hint == "hint_241b") then
			--HINT
			--Amy's helpful hints Act2 - find mat nest (a)
			amy::SID_1013: We need to find a way in to the ventilation system.
		elseif (hint == "hint_242a") then
			--HINT
			--Amy's helpful hints Act2 - find distress beacon (a)
			amy::SID_1002:We're looking for something to send a signal like the Sonic, right? Something that makes a noise.
		elseif (hint == "hint_242b") then
			--HINT
			--Amy's helpful hints Act2 - find distress beacon (b)
			amy::SID_1003: Maybe there is something we can use in the Storeroom.
		elseif (hint == "hint_243a") then
			--HINT
			--Amy's helpful hints Act2 - destroy nest
			amy::SID_1004:Time to plant that Beacon in the Cybermat nest.
		elseif (hint == "hint_261a") then
			--HINT
			--Amy's helpful hints Act2 - take serum to chisholm
			amy::SID_0387:We better get that Serum to Chisholm fast.
		else
			--HINT
			--Amy's helpful hints Act2 - general talk
			amy::SID_1005: Let's have a look around.
		end
		amy:ClearFocus()
	end
end
