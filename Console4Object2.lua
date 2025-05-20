global function Interact()
	
--Move To Date Item when it turns up.

	local hint = QueryObjective(0)   
	local doctor = GetActor("doctor")

	local amy = GetActor("amy")
	SayPrep("skip","")
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1998:Scanner/typewriter- This examines and analyses any substance in the vicinity. It's also a very good typewriter, when it's got a fresh ribbon.
	
	else
		--VO Console Control Text
		amy::SID_1999:This can't just be a typewriter, I've seen the Doctor scanning stuff with it before. Looks like it needs a new ribbon, too.
	end
	
	
	FindNodeByName("AllControlsScript").script.TurnOnInterface()
	FindNodeByName("Console4InteractableScript").script.Object2State = 1
	FindNodeByName("AllControlsScript").script.InteractDone()
end

global function Use()

end

global function ResetControl()
	FindNodeByName("Console4InteractableScript").script.Object2State = 0
end