global script_node

local doctor = script_node:FindActor()
local idle_time = 0
local anims =
	{
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03", 
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle05",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle07"
	}

global function Idle()
	idle_time = idle_time - GetTimeStep()
	
	if idle_time <= 0 then
		local random
		local anim
			
		random = Random(#anims)
		anim = FindNodeByShortName(anims[random])
		doctor:PlayAnimBlendOut(anim,1,0.5,0.5)
		idle_time = Random(3) + 3
	end
end