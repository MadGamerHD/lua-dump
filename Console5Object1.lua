--Fabricated dispensor
global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local hint = QueryObjective(0)          
	local PanelScript = FindNodeByName("Console5InteractableScript")
	
	SayPrep("skip","")
	
	if (PanelScript.script.Object1State == 0 and hint == "hint_1_4") then 
--		No need to call InteractDone since won't be zoomed in 2D mode

		--VO
		--Examin screwdriver slot
			amy::SID_2448:I need to use the Screwdriver on it.
	elseif (hint == "hint_1_4") then
		FindNodeByName("AllControlsScript").script.InteractDone()
	else
		if(FindNodeByName("CommonScripts").script.DoctorIsPlayer()) then
			--New
			-- VO Console Control Text
				doctor::SID_1960:Fabricated Dispenser: The TARDIS can create devices of its own, like a new Sonic Screwdriver. It takes a lot of time and energy, though.		
		else
			--New
			-- VO Console Control Text
				amy::SID_1961:I saw the Doctor make a new Sonic Screwdriver out of this. I'm going to call it the Makey Uppy Thingy.
		end
		
		PanelScript.script.Object1State = 1
		FindNodeByName("AllControlsScript").script.InteractDone()
	end
end

global function Use()
	local amy = GetActor("amy")
	local PanelScript = FindNodeByName("Console5InteractableScript")
	local hint = QueryObjective(0)  
	local waypoint = FindNodeByName("Stand5")
	local int = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractLowBend") --2.13
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local CircuitMinigame = MinigameManager:GetCircuitMiniGame()
	
	SayPrep("skip","async")
	
	if (PanelScript.script.Object1State == 0 and hint == "hint_1_4") then 
		--VO
		--Amy inserts the laser screwdrvier into the console for objective 1_4
			amy::SID_1127:I'll just insert the Laser Screwdriver in here. Oh, all the wires have been shaken loose. I'd better put them back in.

		amy:SetTarget(waypoint)
		amy:SetMoveTime(1)
		amy:SetBehaviour("move")
		
		Wait(1)
		amy:PlayAnim(int,1,0.1)
		
		Wait(2)
		PanelScript.script.Object1State = 1
		FindNodeByName("AllControlsScript").script.TurnOffInterface()

		SayPrep("skip","")
			
		MinigameManager:SetMiniGameID("MINI_WIRE01")	
		CircuitMinigame:SetBoard(0)
		MinigameManager:StartMiniGame(CircuitMinigame)
		MinigameManager:SetCallback(FindNodeByName("CombinationScript3"), "CheckCombination")
	end
end
