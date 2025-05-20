global script_node
global handlestate
handlestate = 0
local ResetHandle
ResetHandle = 0
local prop = FindNodeByName("Ob_1_4Prop")


global function Clear()

end
global function AnimDone()

	local anim
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_1_4_Idle_Up")
			prop:PlayAnim(anim, 1, 0)
	else
--		anim = FindNodeByTag("Anim_1_2_Idle_Down")	
	end
--	prop:SetCallback(script_node, "Clear")

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local controls = FindNodeByName("AllControlsScript")
	if (controls.script.ConsoleDV == 1 and controls.script.ControlDV == 4 ) then
		doctor:SetBehaviour("wait")
	else
		local doctor = GetActor("doctor")
		local amy = GetActor("amy")
		SayPrep("skip","")
		if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
			--VO Console Control Text
			doctor::SID_1861:Time rotor handbrake- Immediately stops the TARDIS from travelling through time. Unless you're going too fast, then you'll skid for a bit. Er, apparently...
		else
			--VO Console Control Text
			amy::SID_1862:This has to be the handbrake, it looks like one anyway. Only one way to find out.
		end
		--Handbrake
		--New
		--VO Amy uses the handbrake at any point
		-- Amy::Well done, we were stopped, and now were stopped more.


	end
	
		-- Play animation and grinding of gears sound.
		FindNodeByName("Console1InteractableScript").script.Object2State = 1
		FindNodeByName("AllControlsScript").script.InteractDone()
		FindNodeByName("AllControlsScript").script.TurnOnInterface()
		
	if (ResetHandle == 0) then
	--Locking down mech
		FindNodeByName("AllControlsScript").script.InteractDone()
	else
		ResetHandle = 0
	end	
end

global function PlayUp()

	local anim = FindNodeByTag("Anim_1_4_Rotate_Up")
	handlestate = 1
	FindNodeByName("Ob1_4SoundUp"):Trigger()
	
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
	
end

global function PlayDown()

	local anim = FindNodeByTag("Anim_1_4_Rotate_Down")
	handlestate = 0
	if (ResetHandle == 0) then
		FindNodeByName("Ob1_4SoundDown"):Trigger()
	end
	
	prop:PlayAnim(anim, 1, 0)
	prop:SetCallback(script_node, "AnimDone")
	
end

global function Interact()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
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
