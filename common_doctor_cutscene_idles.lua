global script_node

local doctor = script_node:FindActor()
local idle_time = 2
local anims =
	{
		--"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03", 
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle05",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle07"
	}

local facial_anims =
	{
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Neutral",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Happy", 
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Determined",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Shocked"
	}

global function Idle()
	idle_time = idle_time - GetTimeStep()
	
	if idle_time <= 0 then
		local random
		local anim
			
		random = Random(#anims)
		anim = FindNodeByShortName(anims[random])
		doctor:PlayAnimBlendOut(anim,1,1,1)
		
		random = Random(#facial_anims)
		anim = FindNodeByShortName(facial_anims[random])
		doctor:PlayAnimFacial(anim,1,0.5,0.5)
		
		idle_time = Random(3) + 5
	end
end

global function End()
	doctor:StopAnim(0.5)
	doctor:StopAnimFacial(0.1)
	script_node:Sleep()
end