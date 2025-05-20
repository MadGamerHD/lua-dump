global script_node

global function SetupCut()
	Wait(1)
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
end

global function StartMiniCut()
	ShowLetterBox()
end

global function Interact()
	local sensor = FindNodeByName("DalekSensor")
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	if (not doctor:IsInventoryItem(sensor)) then
		--VO
		--Examine dalek helmet (before or after lift)
			doctor::SID_0596:Aha, this should contain an Internal Sensor. Could be useful if I can find a way of accessing it. 
		
		SetGlobalObjectiveState("Dalek_2_1_1",3)
		SetGlobalObjectiveState("Dalek_2_1_2",2)
	else
		--NEW
		--VO
		--Sensor retrieved from helmet
			doctor::SID_1061:I have the Sensor now, so I can explore.
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local screwdriver = FindNodeByName("screwdriver")
	local sensor = FindNodeByName("DalekSensor")
	local docScript = FindNodeByName("DoctorScript_0")
	local doc_helm_loc = FindNodeByName("doc_helm_loc")
	
	SayPrep("skip", "")
	
	if doctor:IsInventoryItem(sensor) then
		docScript.script.NoPoint()
		--VO
		-- Using a wrong item on the helmet
		doctor::SID_0866:There is no point in doing that.
	else
		if doctor:IsUsingInventoryItem(screwdriver) then
			doctor:SetBehaviour("wait")
			doctor:SetTarget(doc_helm_loc)
			doctor:SetMoveTime(2)
			doctor:SetBehaviour("move")
			doctor:SetCallback(script_node, "AtLoc")
		end
	end
end

global function AtLoc()
	local doctor = GetActor("doctor")
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local Minigame = MinigameManager:GetAssembleMiniGame()
	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 1.25)
	doctor:PlayAnimAndWaitBlendOut(use_sonic,1,0.5,0.5)
		
	MinigameManager:SetCallback(script_node, "SensorComplete")
	MinigameManager:SetMiniGameID("MINI_ASSEMBLE01")
	Minigame:SetCurrentMaze(0)
	MinigameManager:StartMiniGame(Minigame)
end

global function DebugCut()
	local doctor = GetActor("doctor")
	local amy_script = FindNodeByName("amy_startup_0")
	local amy_interact = FindNodeByName("Amy_Interact")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")

	amy_script.script.AmyState  = 1

	doctor:SetBehaviour("pc")

	HideFade()
	HideLetterBox()

	amy_hint_interact:Sleep()
	amy_interact:Wake()
end

global function SensorComplete()
	local cutscene_10 = FindNodeByName("cutscene_10")
	
	SetGlobalObjectiveState("Dalek_2_1_1",3)
	SetGlobalObjectiveState("Dalek_2_1_2",3)

	cutscene_10:Trigger()
end
