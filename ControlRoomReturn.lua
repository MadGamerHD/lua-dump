global script_node

local FirstTime = 0

global function StartCut()
	local amy = GetActor("amy")
	local ControlRoom = FindNodeByTag("ControlRoom")

	ShowLetterBox()
	amy:GetTransform():SetNodeParent(ControlRoom)
end

global function DocStartCut()
	local doctor = GetActor("doctor")
	local ControlRoom = FindNodeByTag("ControlRoom")

	ShowLetterBox()
	doctor:GetTransform():SetNodeParent(ControlRoom)
end

----

global function EndScene()
	local amy = GetActor("amy")

	HideLetterBox()

	amy:SetBehaviour("pc")
	amy:EnablePhysics()

	-- Reset the drawing room doors
	FindNodeByName("Door1Prop"):TeleportToOrigin()
	FindNodeByName("Door2Prop"):TeleportToOrigin()
end

global function DocEndScene()
	local doctor = GetActor("doctor")

	HideLetterBox()

	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()

	-- Reset the drawing room doors
	FindNodeByName("Door1Prop"):TeleportToOrigin()
	FindNodeByName("Door2Prop"):TeleportToOrigin()
end

