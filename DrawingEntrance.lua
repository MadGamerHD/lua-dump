global script_node
global FirstTime 

FirstTime = 0

global function Trigger()
	local amy = GetActor("amy")
	local DrawingRoom = FindNodeByTag("DrawingRoom")
	local Waypoint1 = FindNodeByName("DrawingRoomMoveToLoc")
	local Waypoint2 = FindNodeByName("DrawingRoomEntryLoc")
	local Vo_Cut = FindNodeByName("DR_Intro")

	amy:SetTarget(Waypoint1)
	amy:SetBehaviour("move")
	
	ShowFade()

	Wait(1)
	amy:SetBehaviour("wait")
	amy:GetTransform():SetNodeParent(DrawingRoom)	

	if (FirstTime == 0) then
		FirstTime = 1
		
		Wait(1)
		HideFade()
		Vo_Cut:Trigger()
	else
		amy:Teleport(Waypoint2)
		
		Wait(1)
		HideFade()
		amy:SetBehaviour("pc")
	end
end
