global function Trigger()
	local doc_inout = FindNodeByName("Stairs2Doc")
	local amy_inout = FindNodeByName("Stairs2")

	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		doc_inout:Trigger()
	else
		amy_inout:Trigger()
	end
end
