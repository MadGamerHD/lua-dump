--act 2/3 unique script

global function Trigger()
	local amy = GetActor("amy")
	local Waypoint1 = FindNodeByName("DrawingRoomMoveToLoc")
	local Waypoint2 = FindNodeByName("DrawingRoomEntryLoc")
	local DrawingRoom = FindNodeByTag("DrawingRoom")

	amy:SetTarget(Waypoint1)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")

	ShowFade()

	Wait(1)
	amy:SetBehaviour("wait")
	amy:GetTransform():SetNodeParent(DrawingRoom)
	amy:Teleport(Waypoint2)

	Wait(1)
	HideFade()

	if GetAct() == 2 then
		amy:FadeGlowDown(0)
	end

	amy:SetBehaviour("pc")
end
