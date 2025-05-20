global script_node
global function Interact()
	-- Quantum foam manipulators
	local amy = GetActor("amy")
	local EyeCut = FindNodeByName("CamShakeAndRumble")
		ShowLetterBox()
	Stop2dMode()	
	EyeCut:Trigger()
	Wait(4)
	Start2dMode()
	HideLetterBox()
	--Add sparks

	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1939:Quantum foam manipulators- During time travel, TARDIS passes through streams of quantum particles, or "quantum foam". These manipulators move it out of the way.
		-- VO Console Control Text
		doctor::SID_1940:The TARDIS contradicts several laws of quantum physics just by existing, let alone travelling through time. But hey, rules are made to be broken.
	else
		--VO Console Control Text
		amy::SID_1941:No idea what this is, but the Doctor's always messing around with it. I think he makes it up as he goes along.
	end


	FindNodeByName("AllControlsScript").script.InteractDone()

end

global function Use()
	
end

