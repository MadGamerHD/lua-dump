global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local doc_point1 = FindNodeByName("doc_loc1")
	local doc_point2 = FindNodeByName("loc_cutscene11_doc_end")
	local amy_point1 = FindNodeByName("amy_loc1")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractOnTable")
	local keyboard = FindNodeByName("audio_keyboard")
	
	doctor:Teleport(doc_point1)
	doctor:SetTarget(doc_point2)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	amy:Teleport(amy_point1)	

	Wait(2)
	doctor:PlayAnim(anim, 1, 0.1)
	
	Wait(1)
	keyboard:Trigger()
end

global function End()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local NanoMinigame = MinigameManager:GetNanoMiniGame()
	local miniscript = FindNodeByName("script_nano_minigame")
	local cyberman2 = FindNodeByTag("cyberman_2")
	local cyberman3 = FindNodeByTag("cyberman_3")
	local cyberman6 = FindNodeByTag("cyberman_6")	
	
	--way out gaurds
	cyberman2:StopTrigger()
	cyberman3:StopTrigger()
	cyberman6:StopTrigger()		
		
	HideLetterBox()
	
	--Get back to the control room
	SetGlobalObjectiveState("Cyber_3_6_1", 3) --tick
	--Reconfig controls
	SetGlobalObjectiveState("Cyber_3_6_1", 2) --white
	
	MinigameManager:SetMiniGameID("MINI_NANO03")
	NanoMinigame:Hard()
	NanoMinigame:SetEnvironment(1)
	
	NanoMinigame:ResetConditions()
	NanoMinigame:AddDoubleCondition(3,3,1,0,0)
	NanoMinigame:AddDoubleCondition(5,3,4,0,0)
	NanoMinigame:SetCatalystColour(0,3)
	NanoMinigame:SetCatalystActive(0,1)
	NanoMinigame:SetCatalystColour(1,0)
	NanoMinigame:SetCatalystActive(1,0)
	NanoMinigame:SetCatalystColour(2,1)
	NanoMinigame:SetCatalystActive(2,1)
	NanoMinigame:SetCatalystColour(4,4)
	NanoMinigame:SetCatalystActive(4,1)
	NanoMinigame:SetCatalystColour(3,5)
	NanoMinigame:SetCatalystActive(3,1)
	NanoMinigame:SetCatalystColour(5,0)
	NanoMinigame:SetCatalystActive(5,0)
	NanoMinigame:SetCatalystColour(6,0)
	NanoMinigame:SetCatalystActive(6,0)
	NanoMinigame:SetCatalystColour(7,0)
	NanoMinigame:SetCatalystActive(7,0)
	NanoMinigame:SetTargetColour(0,0,0)
	NanoMinigame:SetTargetActive(0,0,0)
	NanoMinigame:SetTargetVolatile(0,0,0)
	NanoMinigame:SetTargetColour(0,1,0)
	NanoMinigame:SetTargetActive(0,1,0)
	NanoMinigame:SetTargetVolatile(0,1,0)
	NanoMinigame:SetTargetColour(0,2,4)
	NanoMinigame:SetTargetActive(0,2,1)
	NanoMinigame:SetTargetVolatile(0,2,0)
	NanoMinigame:SetTargetColour(0,3,4)
	NanoMinigame:SetTargetActive(0,3,0)
	NanoMinigame:SetTargetVolatile(0,3,1)
	NanoMinigame:SetTargetColour(0,4,0)
	NanoMinigame:SetTargetActive(0,4,0)
	NanoMinigame:SetTargetVolatile(0,4,0)
	NanoMinigame:SetTargetColour(0,5,0)
	NanoMinigame:SetTargetActive(0,5,0)
	NanoMinigame:SetTargetVolatile(0,5,0)
	NanoMinigame:SetTargetColour(0,6,1)
	NanoMinigame:SetTargetActive(0,6,1)
	NanoMinigame:SetTargetVolatile(0,6,0)
	NanoMinigame:SetTargetColour(0,7,0)
	NanoMinigame:SetTargetActive(0,7,0)
	NanoMinigame:SetTargetVolatile(0,7,0)
	NanoMinigame:SetTargetColour(0,8,0)
	NanoMinigame:SetTargetActive(0,8,0)
	NanoMinigame:SetTargetVolatile(0,8,0)
	NanoMinigame:SetTargetColour(0,9,5)
	NanoMinigame:SetTargetActive(0,9,1)
	NanoMinigame:SetTargetVolatile(0,9,0)
	NanoMinigame:SetTargetColour(0,10,0)
	NanoMinigame:SetTargetActive(0,10,0)
	NanoMinigame:SetTargetVolatile(0,10,0)
	NanoMinigame:SetTargetColour(0,11,1)
	NanoMinigame:SetTargetActive(0,11,1)
	NanoMinigame:SetTargetVolatile(0,11,0)
	NanoMinigame:SetTargetSpeed(0,0.8)
	NanoMinigame:SetTargetColour(1,0,4)
	NanoMinigame:SetTargetActive(1,0,1)
	NanoMinigame:SetTargetVolatile(1,0,0)
	NanoMinigame:SetTargetColour(1,1,0)
	NanoMinigame:SetTargetActive(1,1,0)
	NanoMinigame:SetTargetVolatile(1,1,0)
	NanoMinigame:SetTargetColour(1,2,0)
	NanoMinigame:SetTargetActive(1,2,0)
	NanoMinigame:SetTargetVolatile(1,2,0)
	NanoMinigame:SetTargetColour(1,3,0)
	NanoMinigame:SetTargetActive(1,3,0)
	NanoMinigame:SetTargetVolatile(1,3,0)
	NanoMinigame:SetTargetColour(1,4,1)
	NanoMinigame:SetTargetActive(1,4,1)
	NanoMinigame:SetTargetVolatile(1,4,1)
	NanoMinigame:SetTargetColour(1,5,0)
	NanoMinigame:SetTargetActive(1,5,0)
	NanoMinigame:SetTargetVolatile(1,5,0)
	NanoMinigame:SetTargetColour(1,6,0)
	NanoMinigame:SetTargetActive(1,6,0)
	NanoMinigame:SetTargetVolatile(1,6,0)
	NanoMinigame:SetTargetColour(1,7,1)
	NanoMinigame:SetTargetActive(1,7,1)
	NanoMinigame:SetTargetVolatile(1,7,0)
	NanoMinigame:SetTargetColour(1,8,0)
	NanoMinigame:SetTargetActive(1,8,0)
	NanoMinigame:SetTargetVolatile(1,8,0)
	NanoMinigame:SetTargetColour(1,9,0)
	NanoMinigame:SetTargetActive(1,9,0)
	NanoMinigame:SetTargetVolatile(1,9,0)
	NanoMinigame:SetTargetColour(1,10,1)
	NanoMinigame:SetTargetActive(1,10,1)
	NanoMinigame:SetTargetVolatile(1,10,1)
	NanoMinigame:SetTargetColour(1,11,0)
	NanoMinigame:SetTargetActive(1,11,0)
	NanoMinigame:SetTargetVolatile(1,11,0)
	NanoMinigame:SetTargetSpeed(1,0.4)

	MinigameManager:StartMiniGame(NanoMinigame)
	MinigameManager:SetCallback(miniscript, "Run_cutscene_sabotage")
end