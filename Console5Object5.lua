global script_node
global handlestate
handlestate = 0
local ResetHandle
ResetHandle = 0
local prop = FindNodeByName("Ob_5_5Prop")

global function Clear()
end

global function AnimDone()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local anim
	local hint = QueryObjective(0)   	
	local controls = FindNodeByName("AllControlsScript")
	local drum = FindNodeByName("drum")
	
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_5_5_Idle_Up")
		drum:Trigger()
	else
		anim = FindNodeByTag("Anim_5_5_Idle_Down")	
	end

	prop:PlayAnim(anim, 1, 0)
	
	SayPrep("skip","")
	
	print(hint)
	
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	FindNodeByName("Console5InteractableScript").script.Object5State = 1
	FindNodeByName("CombinationScriptControl").script.Run_1_1_Text()
	FindNodeByName("AllControlsScript").script.InteractDone()
	FindNodeByName("AllControlsScript").script.TurnOffControls()
end

global function PlayUp()
	local anim = FindNodeByTag("Anim_5_5_Rotate_Up")
	
	handlestate = 1
	
	FindNodeByName("Ob5_5SoundUp"):Trigger()
	
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()
	local anim = FindNodeByTag("Anim_5_5_Rotate_Down")
	
	handlestate = 0
	
	if (ResetHandle == 0) then
		FindNodeByName("Ob5_5SoundDown"):Trigger()
	end
	
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function Interact()
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	
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
