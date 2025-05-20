global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")		
	local doc_ladder = FindNodeByName("doc_ladder")
	local amy_ladder = FindNodeByName("amy_ladder")

	SayPrep("skip", "")

	doctor:SetBehaviour("wait")
	doctor:SetTarget(doc_ladder)
	doctor:SetMoveTime(3)
	doctor:SetBehaviour("move")

	amy:SetTarget(amy_ladder)
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")
	amy:SetCallback(script_node, "AtLoc")
end

global function AtLoc()
	local cutscene_7 = FindNodeByName("cutscene_7")
	
	cutscene_7:Trigger()
end