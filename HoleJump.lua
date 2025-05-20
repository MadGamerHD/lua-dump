global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local Waypoint = FindNodeByName("ClimbHoleLoc")

	doctor:DisableWalls()
	doctor:DisablePhysics()
	doctor:DisableStickToFloor()
	doctor:SetCallback(script_node,"StartCutscene")
	doctor:SetTarget(Waypoint)
	doctor:SetBehaviour("move")
end

global function StartCutscene()
	local doctor = GetActor("doctor")
	local theScript = FindNodeByName("ClimbAndDropCut")

	doctor:SetBehaviour("wait")
	theScript:Trigger()
end


global function StartScene()
end


global function StopScene()
	local doctor = GetActor("doctor")
	local waypoint = FindNodeByName("FinalTeleport")

	doctor:Teleport(waypoint)
	doctor:SetBehaviour("pc")
	doctor:EnableWalls()
	doctor:EnablePhysics()
	doctor:EnableStickToFloor()
end