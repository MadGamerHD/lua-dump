global amy_freed

global function Amy_Freed()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local fact = FindNodeByName("int_FACT_cyber_conversion")
	local chair_script = FindNodeByName("amy_chair_script")
	local up = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_GetOutOfChair")
	local amy_int = FindNodeByName("int_amy")
	local loc = FindNodeByName("loc_button_console_amy")

	amy:ClearFocus()
	amy_int:StopTrigger()
	fact:Trigger()
	doctor:SetBehaviour("pc")

	SayPrep("skip", "async")	
	--HINT
	--NEW
		amy::SID_1545: Thanks, Doctor. But what kept you?

	amy_freed = 1

	amy:PlayAnim(up, 1,0.5) -- 3.3 seconds
	chair_script.script.SetAmyOutOfChair() 
	Wait(2)
	amy:SetTarget(loc)
	amy:Face(1.0, "sine")
	Wait(1.3)

	amy:SetMoveTime(3)
	amy:SetBehaviour("move")
	Wait(1.5)
	amy:EnablePhysics()
	Wait(1.5)

	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy:EnablePhysics()

	amy_int:Trigger()

	--Release Amy from chair
	SetGlobalObjectiveState("Cyber_3_4_3", 3)	
	--adds new objective
	--Find a way out of the conversion chamber
	AddGlobalObjective("Cyber_3_5")
end


global function Trigger()
		local amy = GetActor("amy")
		local doctor = GetActor("doctor")
		
		doctor::[PANEL WALL CODE]
		--nod, hand on hip
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractPanelWallCode") --2.16s
		amy:PlayAnim(anim, 1, 0)
		
		Wait(10)
		
		doctor::[ LOW BEND]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractLowBend") -- 2.13s
		--nod
		amy:PlayAnim(anim, 1, 0)
		
			Wait(10)
		
		doctor::[ INTERACT TABLE]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractTable") -- 2.1s
		--pray
		amy:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[INTERACT HIGH]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractHigh") --2.3s
		--shake head
		amy:PlayAnim(anim, 1, 0)
		

end