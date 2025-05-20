global function run_cutscene()
end

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local jump = FindNodeByName("int_jump1")

	ShowLetterBox()
	doctor:SetBehaviour("wait")
	
	local loc = FindNodeByName("loc_edge_doc")
--	doctor:Teleport(loc)
	doctor:SetTarget(loc)
	doctor:SetMaxSpeed(1.5)
	doctor:SetBehaviour("move")	
	
	Wait(1)
	local cam_pos = FindNodeByName("spline_new_POI_Node")
	SetPOIPosAndLookZ(cam_pos)
	BeginPOI(4.0, 12.0, 3.0, true, true)

	--explore the area
	SetGlobalObjectiveState("Cyber_1_1_1", 3) -- 2 is unlock, 3 is done

	
	local amy_locator = FindNodeByName("loc_jump1_amy")
	FindNodeByName("lua_amy_cutscene_idles"):Sleep()
	amy:SetTarget(amy_locator)
	amy:SetMaxSpeed(1.5)
	amy:SetBehaviour("move")	
	--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_BendandLook")
	--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Crouch_InteractSS")
	--doctor:PlayAnim(anim ,1,0)
	--doctor:DisableAnimLoop()
	
	Wait(2)
	SayPrep("skip","")
	--VO
	--spotting the rider down the chasm
	 doctor::SID_2017:So that's where the rider ended up.
	 SayPrep("skip","async")
	 --VO
	 --spotting the rider down the chasm
	 doctor::SID_2018:I need to get to him before he dies of exposure.
	 Wait(2)
	StopPOIWait()
	--ResetPlayerCamera()
	
	jump:Trigger()
	
	HideLetterBox()
	doctor:SetBehaviour("pc")
	SayPrep("skip","")
	--find a way down to the driver
	SetGlobalObjectiveState("Cyber_1_1_2", 2) -- 2 is unlock, 3 is done
end


