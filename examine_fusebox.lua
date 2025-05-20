global script_node
local CallbacksCount = 0

--global function Interact()
--	local doctor = GetActor("doctor")

--	print ("examine fusebox","\n")
--	SayPrep("skip", "")
	--VO
	--Examine fusebox
--		doctor::SID_0505:The Fusebox is controlling the power to the rails. I'll need to rewire it to reroute the power.
--end

global function Interact()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
--	local screwdriver = FindNodeByName("screwdriver")
	local doctor_fusebox_locator = FindNodeByName("doctor_fusebox_locator")
	
	SayPrep("skip", "async")	
	
--	if doctor:IsUsingInventoryItem(screwdriver) then
		--HINT
		--If the player uses the fusebox (NO SONIC)
			doctor::SID_0506:This is going to take some manual rewiring.
		
		SetSayCallback(script_node, "CallbacksDone")
		
		doctor:SetBehaviour("wait")
		doctor:SetTarget(doctor_fusebox_locator)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node, "AtLoc")
--	end
end

global function AtLoc()
	local doctor = GetActor("doctor")
	local use_anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")

--	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
--	local sonic_script = FindNodeByName("Sonic_Script:0")
	
--	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 1.25)
--	doctor:PlayAnimBlendOut(use_sonic,1,0.5,0.5)

	doctor:PlayAnimBlendOut(use_anim,1,0.5,0.5)
	doctor:SetCallback(script_node, "CallbacksDone")		
end

global function CallbacksDone()
	CallbacksCount = CallbacksCount+1

	if CallbacksCount == 2 then
		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local CircuitMinigame = MinigameManager:GetCircuitMiniGame()

		MinigameManager:SetMiniGameID("MINI_WIRE01")	
		CircuitMinigame:SetBoard(0)
		MinigameManager:StartMiniGame(CircuitMinigame)
		MinigameManager:SetCallback(script_node, "Rewired")
	end
end

global function Rewired()
	local broke_fusebox = FindNodeByName("use_fusebox_interact")
	local used_fusebox = FindNodeByName("used_fusebox")
	local trap_timeline = FindNodeByName("trap_timeline")
	local temp_wall = FindNodeByShortName("EM_ENTITY_temp:0")

	temp_wall:StopTrigger()
	broke_fusebox:StopTrigger()
	used_fusebox:Trigger()
	trap_timeline:Trigger()
	
	SetGlobalObjectiveState("Dalek_1_3_2", 3)
end
