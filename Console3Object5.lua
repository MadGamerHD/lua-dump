global script_node
global function Interact()
	-- Cooling
	local amy = GetActor("amy")
	local EyeCut = FindNodeByName("CamShakeAndRumble")
	ShowLetterBox()
	Stop2dMode()	
	EyeCut:Trigger()
	Wait(4)
	Start2dMode()
	HideLetterBox()
	--New
	--VO Amy uses the inertial dampers
	--amy::SID_1507:They seem quite important, don't want to shake this place apart!

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1942:Cooling systems- The engines generate a lot of heat when in use, and require a sophisticated cooling system to stop them overheating.
		doctor::SID_1943:Unfortunately, the sophisticated one broke, so I had to cobble something together myself. Still, hasn't exploded yet. Touch wood.
	else
		--VO Console Control Text
		amy::SID_1944:That looks like it keeps an eye on the engine temperature. Must stop things overheating.
	end
	FindNodeByName("AllControlsScript").script.InteractDone()

end

global function Use()
	
end

