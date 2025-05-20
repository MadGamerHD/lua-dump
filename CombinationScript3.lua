--Opening the door to the drawing room.

local Console1Objects = FindNodeByName("Console1InteractableScript")
local Console2Objects = FindNodeByName("Console2InteractableScript")
local Console3Objects = FindNodeByName("Console3InteractableScript")
local Console4Objects = FindNodeByName("Console4InteractableScript")
local Console5Objects = FindNodeByName("Console5InteractableScript")
local Console6Objects = FindNodeByName("Console6InteractableScript")

global script_node
global IsActiveScript
IsActiveScript = 0
local TractorHeight
TractorHeight = 0
local TractorPos
TractorPos = 0
local tractorGunProp = FindNodeByName("TractorProp")

global function AnimDone()
	print("AnimDone","\n")

	if (TractorPos == 0) then
		if (TractorHeight == 0) then
			tractorGunProp:PlayAnim(FindNodeByTag("IdleLD"),1,0)
		else
			tractorGunProp:PlayAnim(FindNodeByTag("IdleLU"),1,0)
		end
	else
		if (TractorHeight == 0) then
			tractorGunProp:PlayAnim(FindNodeByTag("IdleRD"),1,0)
		else
			tractorGunProp:PlayAnim(FindNodeByTag("IdleRU"),1,0)
		end
	end
	--IdleRU
end

global function MoveDown()
	print("MoveDown","\n")

	tractorGunProp:SetCallback(script_node, "AnimDone")

	if (TractorHeight == 0) then
		tractorGunProp:PlayAnim(FindNodeByTag("RotatateRD"),1,0)
	else
		tractorGunProp:PlayAnim(FindNodeByTag("RotatateRU"),1,0)
	end

	TractorPos = 1	
end

global function MoveUp()
	print("MoveUp","\n")

	tractorGunProp:SetCallback(script_node, "AnimDone")

	if (TractorHeight == 0) then
		tractorGunProp:PlayAnim(FindNodeByTag("RotatateLD"),1,0)
	else
		tractorGunProp:PlayAnim(FindNodeByTag("RotatateLU"),1,0)
	end

	TractorPos = 0	
end

global function MoveLeft()
	print("MoveLeft","\n")
	
	tractorGunProp:SetCallback(script_node, "AnimDone")
	
	if (TractorPos == 0) then
		tractorGunProp:PlayAnim(FindNodeByTag("TurnRU"),1,0)
	else
		tractorGunProp:PlayAnim(FindNodeByTag("TurnLU"),1,0)
	end
	
	TractorHeight = 1
end

global function MoveRight()
	print("MoveRight","\n")
	
	tractorGunProp:SetCallback(script_node, "AnimDone")
	
	if (TractorPos == 0) then
		tractorGunProp:PlayAnim(FindNodeByTag("TurnRD"),1,0)
	else
		tractorGunProp:PlayAnim(FindNodeByTag("TurnLD"),1,0)
	end
	
	TractorHeight = 0
end

global function ActivateCutScene8()
	local Cut_8 = FindNodeByName("Cut_8")

	FindNodeByName("AllControlsScript").script.TurnOffControls()
	-- Opend the door, now we need the long direction instructions from the doctor to find the next room.
	IsActiveScript = 0

	Cut_8:Trigger()
end

--redundant???
--global function MinigameComplete()
--	Wait(0.1)
--	FindNodeByName("AllControlsScript").script.TurnOffControls()
--	FindNodeByName("AllControlsScript").script.ResetConsoles()
--end

global function CheckCombination()
	local amy = GetActor("amy")
	local hint = QueryObjective(1)   
	local laser =  FindNodeByName("LaserScrewdriverInvItem")
	
	--laser in place and mini game done
	if hint == "hint_1_4_1" then
		FindNodeByTag("ScrewWorld"):Show()
		amy:RemoveInventoryItem (laser)
		
		--Attach the Laser Screwdriver to the Fabrication Panel (done)
		SetGlobalObjectiveState("Objective_1_4_1", 3)
		--Aim the Tractor Beam with the controls and fire (active)
		SetGlobalObjectiveState("Objective_1_4_2", 2)	
	
		amy:SetBehaviour("pc")
		
		SaveCheckpoint()
		
		FindNodeByName("Console5InteractableScript").script.Interact()
	end
	
	--cs 8 ... end act
	if (	Console3Objects.script.Object1State == 1 and 
		Console3Objects.script.Object2State == 1 and 
		Console6Objects.script.Object1State == 1)  then
		
		ActivateCutScene8()
	end
	
	--when fire pressed!
	if (Console5Objects.script.Object4State == 1)  then
		Console5Objects.script.Object4State = 0
	
		if (	Console5Objects.script.Object2State == 1 and 
			Console5Objects.script.Object3State == 0) then
			ActivateCutScene8()
		else
			FindNodeByTag("Beam"):Show()
--			FindNodeByTag("BeamTemp"):Show()
			local amy = GetActor("amy")

			SayPrep("skip","async")
			
			--VO Amy tries to fire the tractor beam but misses
			amy::SID_1552:Missed! I need to align it with the controls here.
			
			if( Console5Objects.script.Object2State == 0 ) then
				--VO Amy tries to fire the tractor beam but misses, hints for getting it correct
				amy::SID_1766:I need to move it clockwise.
			elseif( Console5Objects.script.Object3State == 1  ) then
				--VO Amy tries to fire the tractor beam but misses, hints for getting it correct
				amy::SID_1767:I need to move it down.
			end
			
			Wait(1)
			FindNodeByTag("Beam"):Hide()
--			FindNodeByTag("BeamTemp"):Hide()
			FindNodeByName("AllControlsScript").script.TurnOnInterface()
		end
	end
end
