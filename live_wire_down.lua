global function Interact()
	local amy=GetActor("amy")
	SayPrep("skip", "async")
	
	local button = FindNodeByName("script_powerbutton")
	local power = button.script.state
	if(power == "off") then
		--VO. examining electric cable. power off
		amy::SID_0287:That Cable is lethal. Good thing the power is off.
	else
		--VO
		--examining electric cable. power on
		amy::SID_0851:Touch that Cable now, and you're smokin' dead, Amy Pond.
	end
end

global function Trigger()
	local cyberslave=GetActor("cyberslave")
	--HINT
	--cyberslave death
	--slave moans / screams as he is electrified
	cyberslave::SID_0807: MOANS
	--NEW
	--cyberslave death
	--slave moans / screams as he is hit by a jet of steam
	cyberslave::SID_0808: GROANS
end


global function Trigger()
	local amy=GetActor("amy")
	SayPrep("skip", "async")
	amy::[CYBERSLAVE WALKS INTO ELECTRICS AND DIES]
end
