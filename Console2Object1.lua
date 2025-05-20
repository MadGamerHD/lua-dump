global function Interact()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1853:Atom accelerator- This provides the energy for travelling through time and space. It's supposed to be powered up before using the Space/Time Throttle.
		doctor::SID_1935:Although... I have been doing it the wrong way round for a while. No wonder the takeoff is a bit bumpy.
	else
		--VO Console Control Text
		amy::SID_1854:No idea what this is, but when I turn it, I can hear something powering up. Must be important.
	end
	--Atom accelerator, play power wind up + down, then sparks.
	FindNodeByName("AllControlsScript").script.InteractDone()
	

	
end

global function Use()

end
