global function Interact()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.

	SayPrep("skip", "")
	
	if amy:IsDetected() then
	--HINT
	--Talk Amy - detected in stealth mode.
	--*NOTE: If detected and escaping Daleks no hint given.
		amy::SID_0569:Run!
	else
		if(hint == "hint_111a") then
		--HINT
		--Talk Amy (hint1) First ask of help from The Doctor above ground in Trafalgar.
			amy::SID_0565:That woman escaped down a manhole. We need to find her.
		elseif (hint == "hint_111b") then
		--*NEW
		--HINT
		--Talk Amy (hint2) Second ask.
			amy::SID_0566:Perhaps we can smash the barrier and get to the Underground.
		elseif (hint == "hint_111c") then
		--HINT
		--Talk Amy (hint3) Third ask.
			amy::SID_0567:Perhaps that Taxi could smash through the barrier.
		elseif (hint == "hint_113a") then
		--HINT
		--Open the Platform Gate. First ask
			amy::SID_0568:We need to open the platform gate somehow.
		elseif (hint == "hint_113b") then
		--HINT
		--Open the Platform Gate. Second ask
			amy::SID_0970:Doesn't your Sonic open any lock?
		elseif (hint == "hint_131a") then
		--HINT
		--Talk Amy - in tube tunnel (stealth). First ask
			amy::SID_0915:We need to catch up with Sylvia.
		elseif (hint == "hint_131b") then
		--HINT
		--Talk Amy - in tube tunnel (stealth). Second ask
			amy::SID_0971:Why don't we hide behind these sandbags?
		elseif (hint == "hint_132a") then
		--HINT
		--Talk Amy - after tunnel hint. First ask
			amy::SID_0972:There must be something nearby we can use.
		elseif (hint == "hint_132b") then
		--HINT
		--Talk Amy - after tunnel hint. Seocnd ask
			amy::SID_0916:Perhaps that Fusebox is controlling the power to the tracks.
		elseif (hint == "hint_133a") then
		--HINT
		--Where to go to after fusebox hint. First ask
			amy::SID_0973:I'm ok, lets keep going. 
		elseif (hint == "hint_133b") then
		--HINT
		--Where to go to after fusebox hint. Second ask
			amy::SID_0917:There has to be a maintenance exit somewhere along here. 
		elseif (hint == "hint_14a") then
		--HINT
		--Talk Amy - back above ground when players need to return to TARDIS. First ask
			amy::SID_0974:Come on Doctor. Before more Daleks turn up.
		elseif (hint == "hint_14b") then
		--HINT
		--Talk Amy - back above ground when players need to return to TARDIS. Second ask
			amy::SID_0570:What is it? Let's get to the TARDIS.
		end
	end
end
