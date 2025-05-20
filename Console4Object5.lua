global function Interact()
	--Radio waves detector
	local doctor = GetActor("doctor")

	local amy = GetActor("amy")
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_2542:Analogue radio waves detect/monitor/change- For receiving and transmitting radio waves. It can also alter them without the sender realising it.
		doctor::SID_2543:Great for playing pranks - unless they're on Marconi. No sense of humour, that man.

	else
		--VO Console Control Text
		amy::SID_2544:Sounds like some sort of radio thingy. You know, for such a new TARDIS, it's got a lot of old junk.
	end
	
	FindNodeByName("AllControlsScript").script.InteractDone()
	FindNodeByName("AllControlsScript").script.TurnOnInterface()
end

global function Use()

end

global function ResetControl()

end
