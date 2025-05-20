global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local door_open =FindNodeByName("door_open")
	local tard_int = FindNodeByName("interact_tardis_end")

	SayPrep("skip", "")
	tard_int:StopTrigger()
	
	doctor:SetBehaviour("wait")
	doctor:SetTarget(door_open)
	doctor:SetMaxSpeed(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "AtLoc")
end

global function AtLoc()
	local timeline = FindNodeByName("cutscene_8")
	timeline:Trigger()
end