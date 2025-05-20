global Console1Used
Console1Used = false
global Console2Used
Console2Used = false
global Console3Used
Console3Used = false
global script_node

local function DisableEye()
	print("Doctor eye disabled!","\n")
--	local Eye = FindNodeByName("EM_ENTITY_VisEye:0")
	local EyeProp = FindNodeByName("VisEye_Prop:0")
	local EyeSound = FindNodeByName("VisuliserAmbient_1")
	local cutscene_12 = FindNodeByName("cutscene_12")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	doctor:DisableStealth()
	amy:DisableStealth()
--	Eye:Sleep()
	EyeSound:Sleep()
	EyeProp:Sleep()
	cutscene_12:Trigger()
	
	SetGlobalObjectiveState("Dalek_2_3", 3)
end

global function HackNextConsoleSpeech()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "async")
	
	if (Console3Used == false) then
		if (Console2Used == false) then
			if (Console1Used == false) then
				--VO
				--Use sonic with first console:
					doctor::SID_0641:The controls are encrypted. I need to reconfigure the Console.
			else	
				--VO
				--Use sonic with second console:
					doctor::SID_0642:I bet the security system will be tougher to crack now.
			end
		else
			--VO
			--Use sonic with final console:
				doctor::SID_0643:This encryption is even more complex. I need to concentrate.	
		end
	end
end

global function HackNextConsole()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local Minigame = MinigameManager:GetHackingMiniGame()
 	
	if (Console3Used == false) then
		if (Console2Used == false) then
			if (Console1Used == false) then
				--Use sonic with first console:
				Console1Used = true
				
				MinigameManager:SetMiniGameID("MINI_HACK01")
				Minigame:SetNumGlyphs(8)
				Minigame:SetMinDelay(4)
				Minigame:SetMaxDelay(6)	
			else	
				--Use sonic with second console:
				Console2Used = true	
				
				MinigameManager:SetMiniGameID("MINI_HACK02")
				Minigame:SetNumGlyphs(9)
				Minigame:SetMinDelay(3)
				Minigame:SetMaxDelay(5)	
			end
		else
			--Use sonic with final console:
			Console3Used = true
			
			MinigameManager:SetMiniGameID("MINI_HACK03")
			Minigame:SetNumGlyphs(10)
			Minigame:SetMinDelay(2)
			Minigame:SetMaxDelay(4)	
		end

		MinigameManager:SetCallback(script_node, "HackConsoleComplete")
		MinigameManager:StartMiniGame(Minigame)
	end
end

global function CheckDisableEye()
--DisableEye()
	if (Console1Used == true) then
		if (Console2Used == true) then
			if (Console3Used == true) then
				DisableEye()
			end
		end
	end
end

global function HackConsoleComplete()
	local Eye = FindNodeByName("VisEye_Prop:0")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	if (Console3Used == false) then
		if (Console2Used == false) then
			Eye:SetLevel(1)
			--HINT
			--Completion of first mini-game
				doctor::SID_0644:Brilliant. The security beam has narrowed. We had better be careful though, the rate of its scan sweep has speeded up.
			Wait(1)			
			SetGlobalObjectiveState("Dalek_2_3_2", 3)
			doctor:SetBehaviour("pc")
			amy:SetTarget(doctor)
			amy:SetBehaviour("follow")
			CheckDisableEye()
			SaveCheckpoint()
		else
			Eye:SetLevel(2)
			--HINT
			--Completion of second game:
				doctor::SID_0645:Just one to go now. That beam is moving pretty fast.	
			Wait(1)
			SetGlobalObjectiveState("Dalek_2_3_3", 3)
			doctor:SetBehaviour("pc")
			amy:SetTarget(doctor)
			amy:SetBehaviour("follow")	
			CheckDisableEye()					
			SaveCheckpoint()
		end
	else			
		SetGlobalObjectiveState("Dalek_2_3_4", 3)
		CheckDisableEye()	
	end
end


