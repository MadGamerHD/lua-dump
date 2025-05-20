global script_node
global function Interact()

--	local EyeCut = FindNodeByName("EyepieceTimeline")
--	StopPOIWait()
--	ResetPlayerCamera()
--	ShowLetterBox()
--	Stop2dMode()	
--	EyeCut:Trigger()
--	Wait(4)
--	Start2dMode()
--	HideLetterBox()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1847:Steering mechanism: This moves the TARDIS around during flight, both on the X and the Y axis.
		doctor::SID_1931:Left, right, up, down, it's hard to keep track of which way is up sometimes...
	else
		--VO Console Control Text
		amy::SID_2303:Looks like the steering thingy. That must mean left and right, AND up and down. Hope so, anyway...
	end
		
	FindNodeByName("AllControlsScript").script.InteractDone()

end

global function Use()
	
end

global function CutsceneEnd()

end
