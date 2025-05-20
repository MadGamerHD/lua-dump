global script_node
local only_use_sonic_once = 1

global function UseSonic(locator)
	local doctor = GetActor("doctor")
	local sonic_script = FindNodeByName("Sonic_Script_0")
	
	-- First move the doctor into position
	doctor:SetTarget(locator)
	doctor:SetMoveTime(1.0)
	doctor:SetBehaviour("move")
	Wait(1.0)
	
	-- Now fire the sonic
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
	doctor:PlayAnim(anim, 1, 0.1)
	Wait(4.4)
	
	doctor:SetBehaviour("pc")
end

global function NoPoint()
	
end


			
global function UseSonicOnce(locator)
	local doctor = GetActor("doctor")
	local sonic_script = FindNodeByName("Sonic_Script_0")
	
	-- First move the doctor into position
	doctor:SetTarget(locator)
	doctor:SetMoveTime(1.0)
	doctor:SetBehaviour("move")
	Wait(1.0)
	
	if(only_use_sonic_once == 1) then
		only_use_sonic_once = 2
		-- Now fire the sonic
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
		doctor:PlayAnim(anim, 1, 0.1)
		Wait(4.4)
	end
	
	doctor:SetBehaviour("pc")
end