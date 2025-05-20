global script_node

local amy = script_node:FindActor()
local idle_time = 3
local anims =
	{
		"EM_ANIMATOR_Amy_Anim_AMY_Idle2",
		"EM_ANIMATOR_Amy_Anim_AMY_Idle3", 
		"EM_ANIMATOR_Amy_Anim_AMY_Idle4", 
	}

local facial_anims =
	{
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Neutral",
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Happy", 
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Determined",
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Shocked"
	}

global function Idle()
	idle_time = idle_time - GetTimeStep()
	
	if idle_time <= 0 then
		local random
		local anim
			
		random = Random(#anims)
		anim = FindNodeByShortName(anims[random])
		amy:PlayAnimBlendOut(anim,1,1,1)

		random = Random(#facial_anims)
		anim = FindNodeByShortName(facial_anims[random])
		amy:PlayAnimFacial(anim,1,0.5,0.5)

		idle_time = Random(3) + 6
	end
end

global function End()
	amy:StopAnim(0.5)
	amy:StopAnimFacial(0.1)
	script_node:Sleep()
end