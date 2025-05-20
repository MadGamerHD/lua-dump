global amy_in_chair

local function PlayChairIdle()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local chair_idle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_CChairIdle")
	local shocked = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_EXP_Shocked")
--	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor_2")
	local doctors_head_locator = doctor:FindNodeByTag("head_locator")

	amy:PlayAnim(chair_idle, 1, 0)
	amy:PlayAnimFacial(shocked,1,0.5,0.5)
	amy:SetFocus(doctors_head_locator)
end

global function Init()
	if amy_in_chair then
		PlayChairIdle()
	end
end

global function SetAmyInChair()
	local amy = GetActor("amy")

	amy_in_chair = true

	PlayChairIdle()
end

global function SetAmyOutOfChair()
	amy_in_chair = false
end