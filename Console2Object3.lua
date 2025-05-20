global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1857:Directional pointer- Orients the TARDIS in space, letting you turn in any direction. Yeah, when it's working, of course.
	else
		--VO Console Control Text
		amy::SID_1858:This spins the TARDIS around, great - like it doesn't do enough of that! How do I know which way is up?
	end

	--Directional pointer
	local BoxObj = FindNodeByTag("TARDISBox")
	FindNodeByName("AllControlsScript").script.InteractDone()
end

global function Use()

end
