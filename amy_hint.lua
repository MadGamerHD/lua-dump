global script_node

global function Hint()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)                 
	
	print(hint)
	print("RunningText","\n")
       	SayPrep("skip", "")
	
        if amy:IsDetected() then
                --HINT
                --Talk Amy - detected in stealth mode.
		amy::SID_0977:Run!
        else

		if(hint == "hint_2111a") then
			--HINT
			--Talk Amy - Keep looking for items. 
			amy::SID_0600:Let's keep looking around. There must be something that can help us.
		elseif(hint == "hint_2111b") then
			--HINT
			--Talk Amy - if sensor not found after previous hint. 
			amy::SID_0601:Let's take a look at that Dalek Helmet.
		elseif(hint == "hint_2111c") then
			--*NEW
			--HINT
			--Talk Amy - if sensor not found after previous two hints. 
			amy::SID_1051:Maybe you could use the Sonic Screwdriver on something.
		elseif (hint == "hint_221") then
			--HINT
			--Talk Amy - inside room, trying to find production area
			amy::SID_0931:Didn't you say it was just around the corner or something?
		elseif (hint == "hint_222a") then
			--HINT
			--Finding the coil
			amy::SID_0628:That Coil is probably gathering dust in a corner somewhere, have you looked everywhere?
		elseif (hint == "hint_222b") then
			--HINT
			--How to find the Crystal
			amy::SID_0627:Perhaps the Crystal is somewhere secure. Maybe there is a secret way in?
		elseif (hint == "hint_222c") then
			--HINT
			--Talk Amy - no items: Go and find the items
			amy::SID_0626:You should get back to the Production Facility and look for those those items. 
		elseif (hint == "hint_231") then
			--HINT
			--Talk Amy - before entering Visualiser room
			amy::SID_0635:We need to get inside that Visualiser Room.
		elseif (hint == "hint_232") then
			--HINT
			--Inside the Visualiser room - avoiding the beam
			amy::SID_0646:We should wait for the beam to pass across before we make a move.
		elseif (hint == "hint_233") then
			--Talk Amy - Hacked 1 console
			amy::SID_0932:I'm sure that beam is faster now. Be careful. 
		elseif (hint == "hint_234") then          
			--Talk Amy - Hacked 2 consoles
			amy::SID_0933:Take your time, this is getting very dangerous now.
		elseif (hint == "hint_241a") then           
			--HINT
			--Encourage the player to take the lift after Cut Scene 12. First ask
			amy::SID_0663:We need to take the lift.
		elseif (hint == "hint_241b") then           
			--HINT
			--Encourage the player to take the lift after Cut Scene 12. Second ask
			amy::SID_0978:Wasn't there a lift near the TARDIS?
		end
	end
end


