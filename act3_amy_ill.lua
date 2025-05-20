global is_ill

local function PlayIll()
	local amy = GetActor("amy")
	local ill = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Exhausted_Idle")

	amy:PlayAnim(ill,1,1)
end

global function Init()
	if is_ill then
		PlayIll()
	end
end

--global function SetWell()
--	is_ill = false
--end

global function SetIll()
	is_ill = true
	
	PlayIll()
end

