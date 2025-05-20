global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")	
	--NEW
	--VO When the Doctor examines a screen in the research room that has no use or information relevant
		doctor::SID_1038:Lots of research files on here. Looks like Daleks are just as ruthless at administration as they are at killing...
end

global function Use()
	local docScript = FindNodeByName("DoctorScript_0")
	docScript.script.NoPoint()
end
