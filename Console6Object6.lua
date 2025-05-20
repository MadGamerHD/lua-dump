local prop = FindNodeByName("Ob_6_6Prop")
local handlestate
handlestate = 0
global script_node
local interact_via_me
interact_via_me = false
local ResetHandle
ResetHandle = 0

global function Clear()
end

global function AnimDone()
	local anim
	local ce6 = FindNodeByName("ce6")
	
	FindNodeByTag("Ob6_6Sound"):StopTrigger()
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_6_6_Idle_Up")
		ce6:Trigger()
	else
		anim = FindNodeByTag("Anim_6_6_Idle_Down")	
	end
	--prop:SetCallback(script_node, "Clear")
	prop:PlayAnim(anim, 1, 0)
	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")

	if (ResetHandle == 0) then

		if interact_via_me then
			FindNodeByName("AllControlsScript").script.TurnOnInterface()
			interact_via_me = false

			--Locking down mech
			FindNodeByName("AllControlsScript").script.InteractDone()
		end

	else
		ResetHandle = 0
	end

end

global function PlayUp()
	local anim = FindNodeByTag("Anim_6_6_Rotate_Up")

	handlestate = 1

	FindNodeByName("Console6InteractableScript").script.Object6State = handlestate
	FindNodeByTag("Ob6_6Sound"):Trigger()
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()

	local anim = FindNodeByTag("Anim_6_6_Rotate_Down")
	handlestate = 0
	FindNodeByName("Console6InteractableScript").script.Object6State = handlestate
	FindNodeByTag("Ob6_6Sound"):Trigger()		
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")	
end

global function Interact()
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	interact_via_me = true
	FindNodeByName("Object6_5Script").script.Toggle()
	FindNodeByName("Object6_4Script").script.Toggle()
	if (handlestate == 0) then
		PlayUp()
	else
		PlayDown()
	end
end

global function Toggle()
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