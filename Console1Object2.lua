

global script_node
global handlestate
handlestate = 0
local ResetHandle
ResetHandle = 0
local prop = FindNodeByName("Ob_6_5Prop")


global function Clear()

end
global function AnimDone()

	local anim
--	FindNodeByTag("Ob6_5Sound"):StopTrigger()
	if (handlestate == 1) then
		anim = FindNodeByTag("Anim_1_2_Idle_Up")
	else
		anim = FindNodeByTag("Anim_1_2_Idle_Down")	
	end
	--prop:SetCallback(script_node, "Clear")
	prop:PlayAnim(anim, 1, 0)
	
	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip","")
	if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
		--VO Console Control Text
		doctor::SID_1849:This adjusts the speed of travel through space and time, either separately or simultaneously.
		doctor::SID_1932:Supposed to move them slowly for a smooth flight. But where's the fun in that??
	else
		--VO Console Control Text
		amy::SID_1850:Looks like the throttle on a plane. I went on a simulator once, it was brilliant. I can use this to go faster or slower.
	end
	
	-- Play animation and grinding of gears sound.
		
	FindNodeByName("Console1InteractableScript").script.Object2State = handlestate
	FindNodeByName("AllControlsScript").script.TurnOnInterface()
	if (ResetHandle == 0) then
	--Locking down mech
		FindNodeByName("AllControlsScript").script.InteractDone()
	else
		ResetHandle = 0
	end	
end

global function PlayUp()

	local anim = FindNodeByTag("Anim_1_2_Rotate_Up")
	handlestate = 1
	FindNodeByName("Ob1_2SoundUp"):Trigger()
	prop:SetCallback(script_node, "AnimDone")
	prop:PlayAnim(anim, 1, 0)
	
end

global function PlayDown()

	local anim = FindNodeByTag("Anim_1_2_Rotate_Down")
	handlestate = 0

	FindNodeByName("Ob1_2SoundDown"):Trigger()
	prop:SetCallback(script_node, "AnimDone")
	prop:PlayAnim(anim, 1, 0)
	
end

global function Interact()
	
	FindNodeByName("AllControlsScript").script.TurnOffInterface()

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





