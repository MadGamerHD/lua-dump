global script_node

local doctor = script_node:FindActor()
local idle_time_facial = 0
local anim_playing_facial = false
local anims_facial =
	{
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Neutral",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Happy", 
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Determined",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_EXP_Shocked"
	}

local idle_time_base = 0
local anim_playing_base = false
local anims_base =
	{
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle02",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03", 
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle05",
		"EM_ANIMATOR_TheDoctor_Anim_DRW_Idle07"
	}

local function FacialIdle()

	if doctor:GetBehaviour() == "pc" then
	
		idle_time_facial = idle_time_facial - GetTimeStep()
		
		if idle_time_facial <= 0 then
			local random
			local anim
			
			random = Random(#anims_facial)
			anim = FindNodeByShortName(anims_facial[random])
			doctor:PlayAnimFacial(anim,1,0.5,0.5)
			idle_time_facial = Random(3) + 3
			anim_playing_facial = true
		end
	
	else
	
		if anim_playing_facial then
			anim_playing_facial = false
			doctor:StopAnimFacial(0.1)
		end
	
	end

end

local function BaseIdle()

	if doctor:GetBehaviour() == "pc" and doctor:IsStandingIdle() then
	
		if idle_time_base > 0 then
			idle_time_base = idle_time_base - GetTimeStep()

			if idle_time_base <= 0 then
				local random
				local anim
				
				random = Random(#anims_base)
				anim = FindNodeByShortName(anims_base[random])
				doctor:PlayAnimBase(anim,1,0.5,0.5)
				anim_playing_base = true
			end
		end
		
		if idle_time_base <= 0 then
			idle_time_base = Random(5) + 5
		end
	
	else
	
		if anim_playing_base then
			idle_time_base = 0
			anim_playing_base = false
			doctor:StopAnimBase(0.1)
		end

	end
	
end

global function Idle()

	FacialIdle()
	BaseIdle()

end
