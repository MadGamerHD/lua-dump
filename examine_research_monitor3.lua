global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	--NEW
	--VO When the Doctor examines a second screen in the research room that has no use or information relevant
		doctor::SID_1054:This research goes back for years. They've been doing this for a long time.
end

global function Use()
	local docScript = FindNodeByName("DoctorScript_0")
	docScript.script.NoPoint()
end
