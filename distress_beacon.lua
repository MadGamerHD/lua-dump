global script_node
global model
global first

global function run_minigame()
	local doctor=GetActor("doctor")
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local BeaconMinigame = MinigameManager:GetBeaconMiniGame()
	MinigameManager:SetMiniGameID("MINI_BEACON01")
	BeaconMinigame:GenerateNewWave()
	MinigameManager:SetCallback(script_node, "run_success_cutscene")
	MinigameManager:StartMiniGame(BeaconMinigame)
	doctor:SetBehaviour("pc")
end

global function Interact()
	local doctor=GetActor("doctor")
	local loc_doc = FindNodeByName("loc_cs7_1_doc1")
	doctor:SetTarget(loc_doc)
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
	local int_node = FindNodeByName("int_distress_beacon")
	int_node:StopTrigger()
	
	Wait(1)
	if(first == nil)	 then 
		local cutscene = FindNodeByName("found_handheld_beacon_cs7_1")
		first = 1
		cutscene:Trigger()
	else
		run_minigame()
	end
end

global function run_success_cutscene()

	local cutscene = FindNodeByName("modified_beacon_cs7_2")
	cutscene:Trigger()
	model:StopTrigger()

end

global function Use()
	local doctor=GetActor("doctor")
	local screwdriver = FindNodeByName("Screwdriver")
	if doctor:IsUsingInventoryItem(screwdriver) then
		Interact()
	else
		FindNodeByName("common_scripts").script.RandomRefusal()	 
	end
end

global function Trigger()
	local doctor=GetActor("doctor")
	doctor:AddInventoryItem(script_node:FindInventoryItem())
end

global function OldTrigger()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local BeaconMinigame = MinigameManager:GetBeaconMiniGame()
	MinigameManager:SetMiniGameID("MINI_BEACON01")
	BeaconMinigame:GenerateNewWave()
	--MinigameManager:SetCallback(script_node, "run_success_cutscene")
	MinigameManager:StartMiniGame(BeaconMinigame)
end
