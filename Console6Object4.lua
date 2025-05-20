local prop = FindNodeByName("Ob_6_4Prop")
global handlestate
handlestate = 0
global script_node
local interact_via_me
interact_via_me = false
local ResetHandle
ResetHandle = 0

global function Clear()
end

global function AnimDone()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local anim
	local ce3 = FindNodeByName("ce3")
	
	FindNodeByTag("Ob6_4Sound"):StopTrigger()

	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_6_4_Idle_Up")
	else
		anim = FindNodeByTag("Anim_6_4_Idle_Down")	
		ce3:Trigger()
	end

	prop:PlayAnim(anim, 1, 0)
	
--	SayPrep("skip","")
--	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
--		--New - Edit
--		-- VO Console Control Text Modified description to reflectr the plot slightly more, this is used to transfer/inspect power
--			doctor::Locking down mech- A handbrake to stop the TARDIS travelling in physical space. Don't forget the Time handbrake too, or she'll drift off in time.
--	else
--		--New
--		-- VO Console Control Text
--			amy::The Doctor always uses this after we've stopped. There's a time handbrake, maybe this is the normal handbrake?
--	end
	
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
	local anim = FindNodeByTag("Anim_6_4_Rotate_Up")

	handlestate = 1

	FindNodeByName("Console6InteractableScript").script.Object4State = handlestate
	FindNodeByTag("Ob6_4Sound"):Trigger()

	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function PlayDown()
	local anim = FindNodeByTag("Anim_6_4_Rotate_Down")

	handlestate = 0

	FindNodeByName("Console6InteractableScript").script.Object4State = handlestate
	FindNodeByTag("Ob6_4Sound"):Trigger()		
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
end

global function Interact()
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	interact_via_me = true
	FindNodeByName("Object6_5Script").script.Toggle()
	
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