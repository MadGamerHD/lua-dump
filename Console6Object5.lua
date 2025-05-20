global script_node
global handlestate
handlestate = 1
local interact_via_me
interact_via_me = false
local ResetHandle
ResetHandle = 0
local prop = FindNodeByName("Ob_6_5Prop")

global function Clear()
end

global function AnimDone()
	local anim
	local ce9 = FindNodeByName("ce9")
	
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_6_5_Idle_Up")
	else
		anim = FindNodeByTag("Anim_6_5_Idle_Down")	
		ce9:Trigger()
	end

	prop:PlayAnim(anim, 1, 0)
	
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
	local anim = FindNodeByTag("Anim_6_5_Rotate_Up")

	handlestate = 1

	FindNodeByName("Console6InteractableScript").script.Object5State = handlestate
	FindNodeByName("Ob6_5SoundUp"):Trigger()

	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()
	local anim = FindNodeByTag("Anim_6_5_Rotate_Down")

	handlestate = 0

	FindNodeByName("Console6InteractableScript").script.Object5State = handlestate
	FindNodeByName("Ob6_5SoundDown"):Trigger()

	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function Interact()
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	interact_via_me = true
	FindNodeByName("Object6_6Script").script.Toggle()
	
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