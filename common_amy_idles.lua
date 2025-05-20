global script_node

local amy = script_node:FindActor()
local doctor = GetActor("doctor")
local doctors_head_locator = doctor:FindNodeByTag("head_locator")
local idle_time_facial = 0
local anim_playing_facial = false
local anims_facial =
	{
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Neutral",
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Happy", 
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Determined",
		"EM_ANIMATOR_Amy_Anim_AMY_EXP_Shocked"
	}
	
local looked_at_doc = false
local idle_time_base = 0
local anim_playing_base = false
local anims_base =
	{
--		"EM_ANIMATOR_Amy_Anim_Amy_Into_Exhausted",
		"EM_ANIMATOR_Amy_Anim_AMY_Idle2",
		"EM_ANIMATOR_Amy_Anim_AMY_Idle3", 
		"EM_ANIMATOR_Amy_Anim_AMY_Idle4", 
	}
local anims_base_turn =
	{
		"EM_ANIMATOR_Amy_Anim_AMY_TurnRight90",
		"EM_ANIMATOR_Amy_Anim_AMY_TurnLeft90",
		"EM_ANIMATOR_Amy_Anim_AMY_TurnLeft180",
		"EM_ANIMATOR_Amy_Anim_AMY_TurnRight180",
	}

local function FacialIdle()
	local amy_behaviour = amy:GetBehaviour()

	if amy_behaviour == "follow"  or amy_behaviour == "pc" then
	
		idle_time_facial = idle_time_facial - GetTimeStep()
		
		if idle_time_facial <= 0 then
			local random
			local anim
			
			random = Random(#anims_facial)
			anim = FindNodeByShortName(anims_facial[random])
			amy:PlayAnimFacial(anim,1,0.5,0.5)
			idle_time_facial = Random(3) + 3
			anim_playing_facial = true
		end
	
	else
	
		if anim_playing_facial then
			anim_playing_facial = false
			amy:StopAnimFacial(0.1)
		end
	
	end

end

local function GetRandomBaseAnim()
	if GetEpisode() == 2 and GetAct() ~= 1 and Random(#anims_base + 1) == 1 then
		return FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Into_Exhausted")
	else
		local random

		random = Random(#anims_base)
		return FindNodeByShortName(anims_base[random])
	end
end

local function BaseIdle()
	local amy_behaviour = amy:GetBehaviour()

	if (amy_behaviour == "follow"  or amy_behaviour == "pc") and amy:IsStandingIdle() then
	
		if not looked_at_doc and amy_behaviour == "follow" then
			looked_at_doc = true
			doctors_head_locator:SyncDataFromDef()
			amy:SetFocus(doctors_head_locator)
			idle_time_base = Random(10) + 10
		end
	
		if idle_time_base > 0 then
			idle_time_base = idle_time_base - GetTimeStep()

			if idle_time_base <= 0 then
				local anim
				
				if amy_behaviour == "follow" then

					if Random(2) == 1 then
						anim = GetRandomBaseAnim()
					else
						local random

						random = Random(#anims_base_turn)
						anim = FindNodeByShortName(anims_base_turn[random])
					end
				
				else
					anim = GetRandomBaseAnim()
				end
				
				amy:ClearFocus()
				amy:PlayAnimBase(anim,1,0.5,0.5)
				anim_playing_base = true
			end
		end
		
		if idle_time_base <= 0 then
			idle_time_base = Random(5) + 5
		end
	
	else

		if looked_at_doc then
			looked_at_doc = false
			amy:ClearFocus()
		end
	
		if anim_playing_base then
			idle_time_base = 0
			anim_playing_base = false
			amy:StopAnimBase(0.1)
		end

	end
	
end
	
global function Idle()
	FacialIdle()
	BaseIdle()
end
