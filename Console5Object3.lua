global script_node

local prop = FindNodeByName("Ob_5_3Prop")
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
	local ce6 = FindNodeByName("ce6")
	
	ce6:Trigger()	
	
	FindNodeByName("Ob_5_3Sound"):StopTrigger()

	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_5_3_Idle_Up")
	else
		anim = FindNodeByTag("Anim_5_3_Idle_Down")	
	end

	prop:PlayAnim(anim, 1, 0)
	
	SayPrep("skip","async")

	if (handlestate == 1)then
		--VO 
		--Amy uses a lever, hint for tractor beam control direction
			amy::SID_2422:That seems to have moved it up.
	else
		--VO 
		--Amy uses a lever, hint for tractor beam control direction
			amy::SID_2423:That seems to have moved it down.
	end
	
	FindNodeByName("Console5InteractableScript").script.Object3State = handlestate	
	
	if (ResetHandle == 0) then
		FindNodeByName("AllControlsScript").script.TurnOnInterface()

		--Locking down mech
		FindNodeByName("AllControlsScript").script.InteractDone()
	else
		ResetHandle = 0
	end
end

global function PlayUp()
	local anim = FindNodeByTag("Anim_5_3_Right")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 1

	FindNodeByName("CombinationScript3").script.MoveDown()
	FindNodeByName("Ob_5_3Sound"):Trigger()
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
	print("PlayClock anim","\n")
end

global function PlayDown()
	local anim = FindNodeByTag("Anim_5_3_Anti")

	FindNodeByName("AllControlsScript").script.TurnOffInterface()

	handlestate = 0
	
	FindNodeByName("CombinationScript3").script.MoveUp()
	FindNodeByName("Ob_5_3Sound"):Trigger()		
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
