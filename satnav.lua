global model

global function Interact()
	SayPrep("skip", "")
	local doctor=GetActor("doctor")
	local waypoint = FindNodeByName("loc_sat_nav")
	ShowLetterBox()
	doctor:SetTarget(waypoint)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	Wait(1)

	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")

	doctor:PlayAnim(anim, 1, 0.1)

	SayPrep("skip", "async")
	--VO
	--finding sat nav on the ground.
	doctor::SID_0095:Hello. A Sat Nav has fallen out of the Skidoo. This will tell me where Chisholm came from.
	Wait(3)
	model:Hide()
	Wait(1)
	local SatNav = FindNodeByName("SatNav")
	doctor:AddInventoryItem(SatNav )
	SayPrep("", "")
	--VO
	doctor::SID_1287: If I hook this up to the TARDIS, I will be able to re-wire it in no time.
	
	--Find the sat nav
	SetGlobalObjectiveState("Cyber_1_6_1", 3) -- 2 is unlock, 3 is done
	--connect the Sat Nav to the TARDIS
	SetGlobalObjectiveState("Cyber_1_6_2", 2) -- 2 is unlock, 3 is done
	--ShowFade()
	--Wait(1)
	local jump = FindNodeByName("Lua_Teleport_2_Tardis")
	jump:Trigger()
	
	model:StopTrigger()
end
