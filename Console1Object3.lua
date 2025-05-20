global script_node
global function Interact()
	-- Steering mechanism
	local amy = GetActor("amy")
	local EyeCut = FindNodeByName("CamShakeAndRumble")
	ShowLetterBox()
	Stop2dMode()	
	EyeCut:Trigger()
	Wait(4)
	Start2dMode()
	HideLetterBox()
	
	
	
		local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1933:Eyepiece- If the external scanners aren't working, the Eyepiece works as an optical viewfinder, with a much more limited view than the scanners.
	else
		--VO Console Control Text
		amy::SID_1934:Ooh, I can see outside. It's a bit like the viewfinder on a cheap camera.
	end
	
	--New
	--VO Amy messes with the steering mechanism
	--amy::SID_1504:I guess it dosent like being steered while not moving.

	FindNodeByName("AllControlsScript").script.InteractDone()

end

global function Use()
	
end

