global function Interact()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	FindNodeByName("Ob_3_2SoundStart"):Trigger()
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1872:Bunsen burner- Used for heating or burning test samples, in the event of the scanner being unable to identify a substance.
		--VO Console Control Text
		doctor::SID_1936:Or for boiling water. Sometimes I just fancy a nice cup of tea and a jammy dodger.
	else
		--VO Console Control Text
		amy::SID_1873:A bunsen burner! Just like in Chemistry at school. I heated the wrong beaker, and smoked out the school for a day. It was brilliant.
	end
	FindNodeByName("Console3InteractableScript").script.Object2State = 1
	FindNodeByName("AllControlsScript").script.InteractDone()
end

global function Use()

end
