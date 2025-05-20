global function Interact()
	local amy=GetActor("amy")
	--VO
	-- interact with cybermat nest
	amy::SID_0261: They’re all here. I can hear them in there.

end

global function Use()
	local amy=GetActor("amy")
	--VO
	-- use beacon with cybermat nest
	amy::SID_0262: Flick the switch and in it goes.
	--VO
	-- use beacon with cybermat nest
	amy::SID_0263: I hope the Doctor was right about this thing, because in a second they're going to be in a right old mood...

	local mdb=FindNodeByName("modified_distress_beacon")
	amy:RemoveInvetoryItem(mdb)
end
