global function Interact()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1855:Time and space forward/back control: Forwards or backwards, pretty self explanatory really. I think that's what it's for, anyway.
	else
		--VO Console Control Text
		amy::SID_1856:Only moves forwards or backwards. That must be all it does. Doesn't this thing have gears?
	end

	-- Time/space forward/back
	local amy = GetActor("amy")
		--VO Amy uses the Time/Space control
	amy::SID_1505:I guess we need to be moving for that to do anything.
	FindNodeByName("AllControlsScript").script.InteractDone()
end

global function Use()

end
