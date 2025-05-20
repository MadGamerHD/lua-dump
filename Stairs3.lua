global function Trigger()
	local doc_inout = FindNodeByName("Stairs3Doc")
	local amy_inout = FindNodeByName("Stairs3")

	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		doc_inout:Trigger()
	else
		amy_inout:Trigger()
	end
end
