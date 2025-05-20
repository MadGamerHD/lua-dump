global script_node

local prop = FindNodeByName("Ob_5_2Prop")
local handlestate
local ResetHandle

handlestate = 0
ResetHandle = 0

global function Clear()
end

--Heisenberg focusing device
--Play random noise
global function AnimDone()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local anim
	local ce2 = FindNodeByName("ce2")
	
	ce2:Trigger()	
	
	FindNodeByName("Ob_5_2Sound"):StopTrigger()

	if (handlestate == 1) then
		anim = FindNodeByShortName("EM_ANIMATOR_Heisenberg_Anim_Panel05_Heisenberg_Left_Idle")
	else
		anim = FindNodeByShortName("EM_ANIMATOR_Heisenberg_Anim_Panel05_Heisenberg_Right_Idle")
	end

	prop:PlayAnim(anim, 1, 0.25)
	
	SayPrep("skip","async")
	
	if (handlestate == 1) then
		--VO 
		--Amy uses the horesontal controls for the tractor beam 1
			amy::SID_1566:That seems to have moved it clockwise.
	else
		--VO
		--Amy uses the horesontal controls for the tractor beam 1
			amy::SID_1567:That seems to have moved it anti-clockwise.
	end

	FindNodeByName("Console5InteractableScript").script.Object2State = handlestate
	
	if (ResetHandle == 0) then
		FindNodeByName("AllControlsScript").script.TurnOnInterface()

		--Locking down mech
		FindNodeByName("AllControlsScript").script.InteractDone()
	else
		ResetHandle = 0
	end
end

global function PlayUp()
	local anim = FindNodeByShortName("EM_ANIMATOR_Heisenberg_Anim_Panel05_Heisenberg_Right_To_Idle")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 1
		
	FindNodeByName("CombinationScript3").script.MoveLeft()
	FindNodeByName("Ob_5_2Sound"):Trigger()
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "PlayUpB")
end

global function PlayUpB()
	local anim = FindNodeByShortName("EM_ANIMATOR_Heisenberg_Anim_Panel05_Heisenberg_Left")

	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()
	local anim = FindNodeByShortName("EM_ANIMATOR_Heisenberg_Anim_Panel05_Heisenberg_Right")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 0
	
	FindNodeByName("CombinationScript3").script.MoveRight()
	FindNodeByName("Ob_5_2Sound"):Trigger()		
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function Interact()
	if (handlestate == 0) then
		PlayUp()
	else
		PlayDown()
	end
end

global function ResetControl()
	if (handlestate == 1)then
		ResetHandle = 1
		PlayDown()
	end
end

global function Use()
end
