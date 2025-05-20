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
	local hint = QueryObjective(0) 
	local kontron = FindNodeByName("KontronCrystal")
	local fob = FindNodeByName("FobWatch")

	HideLetterBox()

	print("DocEndScene","\n")
	print(hint,"\n")
	
	if (hint == "hint_2_2_3"  )then
		FindNodeByName("Cut_12"):Trigger()
	end

	SayPrep("skip","async")

	if (doctor:IsInventoryItem(kontron) == true) and (doctor:IsInventoryItem(fob) == false) then
		--VO
		--Return to DR hint.
			doctor::SID_2545:I'm sure there was something else I needed in the Drawing Room.
	elseif (doctor:IsInventoryItem(fob) == true) and (doctor:IsInventoryItem(kontron) == false) then
		--VO
		--Return to DR hint.
			doctor::SID_2546:I think I've forgotten something in the Drawing Room.
	end

	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()

	-- Reset the drawing room doors
	FindNodeByName("Door1Prop"):TeleportToOrigin()
	FindNodeByName("Door2Prop"):TeleportToOrigin()
end

