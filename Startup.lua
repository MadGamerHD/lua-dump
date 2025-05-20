global is_floating

local function PlayFloat()
	local doctor = GetActor("doctor")
	local float = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_FloatInSpace")
	
	doctor:PlayAnim(float,1,0)
end

global function Init()
	if is_floating then
		PlayFloat()
	end
end

global function SetFloating()
	is_floating = true
	
	PlayFloat()
end
