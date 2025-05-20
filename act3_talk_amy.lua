global function Interact()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.

	SayPrep("skip", "")
	
	if(hint == "hint_311a") then
	--HINT
	--Talk Amy - At start of act three first hint.
		amy::SID_0980:Even though the place is in ruins there could be something useful here.
	elseif (hint == "hint_311b") then
	--*NEW
	--HINT
	--Talk Amy - At start of act three if player hasn't made a battery yet. Second ask
		amy::SID_0981:What about that Debris and Wiring on the floor?
	elseif (hint == "hint_311c") then
	--HINT
	--Talk Amy - At start of act three if player hasn't made a battery yet. Third ask
		amy::SID_0718:You know, I've got a GCSE in chemistry. You can make a battery from metal and acid.
	elseif (hint == "hint_312a") then
	--HINT
	--Talk Amy - how to activate the trap? First ask
		amy::SID_0982:Can you activate the trap from that Console now? The Daleks will be here soon - hurry!
	elseif (hint == "hint_312b") then
	--HINT
	--Talk Amy - how to activate the trap? Second ask
		amy::SID_0937:Can't you just zap it with the Sonic Screwdriver?
	elseif (hint == "hint_321a") then
	--HINT
	--Talk Amy - before the hole in the floor is found.
		amy::SID_0938:The lift won't work any more. Let's look for another way down.
	elseif (hint == "hint_321b") then
	--HINT
	--Talk Amy - before the hole in the floor is found.
		amy::SID_0983:Perhaps there's a hole in the floor somewhere?
	elseif (hint == "hint_322a") then
	--HINT
	--Talk Amy - visualiser hint if player hasn't used visuliser yet.
		amy::SID_0732:Let's check out that Visualiser again.
	elseif (hint == "hint_322b") then
	--HINT
	--Talk Amy - visualiser hint if player hasn't used visuliser yet.
		amy::SID_0984:Can the Sonic boost it back to life?
	elseif (hint == "hint_33") then
	--HINT
	--Talk Amy - before the player picks up the vis reciever.
		amy::SID_0939:What's that thing dangling out of the Visualiser?
	elseif (hint == "hint_36a") then
	--HINT
	--Talk Amy - by Emperor hint for get to generators. First ask
		amy::SID_0772:Take out those Generators. I'm so weak...
	elseif (hint == "hint_36b") then
	--HINT
	--Talk Amy - by Emperor hint for get to generators. Second ask
		amy::SID_0985:Try using the Sonic to operate that Console, Doctor. I'm fading away.
	else 
	--play final cut scene
		print("GAME OVER")	
	end
end
