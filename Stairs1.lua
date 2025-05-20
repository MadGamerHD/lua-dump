global function Trigger()
	local doc_stop = FindNodeByName("StopDoc")
	local amy_inout = FindNodeByName("Stairs1")

	--act 2 (before drawing room unlocked)
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		doc_stop:Trigger()
	--act 1 (before drawing room unlocked)
	else
		amy_inout:Trigger()
	end
end
