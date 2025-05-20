global script_node
local toggle
local toggle2

global function Interact()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	if(toggle == 1) then
		--VO
		--interact with control panel in the TARDIS
		doctor::SID_0399:The TARDIS should be able to help me fix the Sat Nav.
		toggle = 2	
	else
		--VO
		--interact with control panel in the TARDIS
		doctor::SID_0398:We need to know where Chisholm came from before we can go anywhere. 
		toggle = 1
	end
end
	
global function Use()
	local doctor = GetActor("doctor")
	local SatNav = FindNodeByName("SatNav")
	if doctor:IsUsingInventoryItem(SatNav) then
		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local NanoMinigame = MinigameManager:GetCircuitMiniGame()
		MinigameManager:SetCallback(script_node, "Run_cutscene")
		MinigameManager:StartMiniGame(NanoMinigame)
	else
		local common_scripts = FindNodeByName("common_scripts")
		common_scripts.script.RandomRefusal()
	end
end

global function Trigger()

		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local NanoMinigame = MinigameManager:GetCircuitMiniGame()
		MinigameManager:SetMiniGameID("MINI_WIRE01")	
		--MinigameManager:SetCallback(script_node, "Run_cutscene")
		MinigameManager:StartMiniGame(NanoMinigame)

end

global function Run_cutscene()
	local cutscene=FindNodeByName("Cutscene_5")
	cutscene:Trigger()
end
	
	
global function Leave_Tardis()
	local doctor=GetActor("doctor")
	if(toggle2 == 1) then
		--VO
		--interact with TARDIS door option 1
		doctor::SID_0400: I can't leave just yet.
		toggle2 = 2	
	else
		--VO
		--interact with TARDIS door option 2
		doctor::SID_0401: Tempting as it is, we need to stay until we've know what’s been going on here.
		toggle2 = 1
	end
end