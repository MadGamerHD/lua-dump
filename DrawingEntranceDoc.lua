--act 2/3 unique script

global function Trigger()
	local doctor = GetActor("doctor")
	local Waypoint1 = FindNodeByName("DrawingRoomMoveToLoc")
	local Waypoint2 = FindNodeByName("DrawingRoomEntryLoc")
	local DrawingRoom = FindNodeByTag("DrawingRoom")

	doctor:SetTarget(Waypoint1)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")

	ShowFade()
	
	Wait(1)
	doctor:GetTransform():SetNodeParent(DrawingRoom)
	doctor:SetBehaviour("wait")
	doctor:Teleport(Waypoint2)
	
	Wait(1)
	HideFade()
	doctor:SetBehaviour("pc")
end
