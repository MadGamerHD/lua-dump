global script_node
global handlestate
handlestate = 0
local ResetHandle
ResetHandle = 0
local prop = FindNodeByName("Ob_3_3Prop")

global function Clear()
end

global function AnimDone()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local hint = QueryObjective(0)   
	local anim
	
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_3_3_Idle_Up")
	else
		anim = FindNodeByTag("Anim_3_3_Idle_Down")	
	end

	prop:PlayAnim(anim, 1, 0)
	
	SayPrep("skip","")

	print(hint)

	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	FindNodeByName("Console3InteractableScript").script.Object3State = 1
	FindNodeByName("CombinationScriptControl").script.Run_1_1_Text()
	FindNodeByName("AllControlsScript").script.InteractDone()
	FindNodeByName("AllControlsScript").script.TurnOffControls()
end

global function PlayUp()
	local anim = FindNodeByTag("Anim_3_3_Rotate_Up")
	
	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 1
	
	FindNodeByTag("Ob3_3Sound"):Trigger()
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()
	local anim = FindNodeByTag("Anim_3_3_Rotate_Down")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 0

	FindNodeByTag("Ob3_3Sound"):Trigger()
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
