global model
global script_node
global first
global first_valve_hint

if(first==nil) then
   if not IsLoadingSavedGame() then
      local doctor = GetActor("doctor")
      local ScrewDriver = script_node:FindInventoryItem()
      doctor:AddInventoryItem(ScrewDriver )
   end
   first = 1
end

global function Use()
	local SatNav = FindNodeByName("SatNav")
	local doctor = GetActor("doctor")
	
	if doctor:IsUsingInventoryItem(SatNav) then
		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local NanoMinigame = MinigameManager:GetCircuitMiniGame()

		--NanoMinigame:GenerateNewWave()
		--local cutscene=FindNodeByName("script_leaving_for_base")
		MinigameManager:SetCallback(script_node, "Run_cutscene")
		MinigameManager:StartMiniGame(NanoMinigame)
	end
end

global function Run_cutscene()
	local cutscene=FindNodeByName("cs_leaving_for_base")
	cutscene:Trigger()
end

