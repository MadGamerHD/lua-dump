global script_node

global function MovetoExamineAndSay()
	local doctor = GetActor("doctor")
	local voltprop = FindNodeByName("VoltProp")
	
	SetPOIPosAndLookZ(FindNodeByName("VoltmeterLookat"))
	BeginPOI(2, 400, 3, true, true)

	SayPrep("skip","async")

	Wait(2)
	FindNodeByName("VoltMeterStart"):Trigger()
	voltprop:PlayAnim(FindNodeByTag("VoltHigh"),1,0)
	--VO 
	--On the voltmeter, it shows that there's no power left. Then it shows full power. Then empty. Then full.
		doctor::SID_2304:It's caught between two possibilities. That's not good.
	
	Wait(1)
	FindNodeByName("VoltMeterStart"):Sleep()
	FindNodeByName("VoltLoop"):Trigger()
	voltprop:PlayAnim(FindNodeByTag("VoltLow"),1,0)
	
	Wait(1)
	voltprop:PlayAnim(FindNodeByTag("VoltHigh"),1,0)
	
	Wait(1)
	voltprop:PlayAnim(FindNodeByTag("VoltLow"),1,0)
	FindNodeByName("VoltLoop"):Sleep()
	FindNodeByName("VoltMeterStop"):Trigger()

	StopPOIWait()
	ResetPlayerCamera()

	Wait(1)
	FindNodeByName("Console6InteractableScript").script.Object3State = 1
	FindNodeByName("AllControlsScript").script.InteractDone()
	FindNodeByName("VoltMeterStop"):Sleep()
	FindNodeByName("Object_6_3"):Sleep()
	
	--Find the Voltmeter (done)
	SetGlobalObjectiveState("Objective_2_1_2", 3)
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local hint = QueryObjective(0)   
	local Osc = FindNodeByName("Oscillator")
	
	SayPrep("skip","")
	
	print(hint)
	
	if (hint == "hint_2_3_2") then
		--VO 
		--The player trys to use the voltmeters without an oscillator
			doctor::SID_2306:Without an Oscillator, I won't be able to project the Tachyon Feedback Loop into Amy's time.	
	elseif doctor:IsInventoryItem(Osc) then
		--VO 
		--The player trys to examine the voltmeters but has the oscillator in their inv
			doctor::SID_2305:Perhaps I should use the Oscillator?
	elseif (FindNodeByName("Console6InteractableScript").script.Object3State == 0 and (hint == "hint_2_1_1" or hint == "hint_2_1_2")) then
		ShowLetterBox()
			
		doctor:SetMoveTime(0.5)
		doctor:SetTarget(FindNodeByName("Stand6"))
		doctor:SetCallback(script_node, "MovetoExamineAndSay")
		doctor:SetBehaviour("move")
	end
end

global function MinigameComplete()
	FindNodeByName("Cut_13"):Trigger()
end

global function MoveAndUse()
	local doctor = GetActor("doctor")
	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
	local sonic_script = FindNodeByName("Sonic_Script:0")
        local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
        local BeaconMinigame = MinigameManager:GetBeaconMiniGame()	

	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 1.25)
        MinigameManager:SetMiniGameID("MINI_BEACON01")
        BeaconMinigame:GenerateNewWave()
        MinigameManager:StartMiniGame(BeaconMinigame)
        MinigameManager:SetCallback(script_node, "MinigameComplete")
end

global function Use()
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)   
	local Osc = FindNodeByName("Oscillator")

	SayPrep("skip","")

	if doctor:IsUsingInventoryItem(Osc) then
		doctor:SetMoveTime(0.5)
		doctor:SetTarget(FindNodeByName("Stand6"))
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node, "MoveAndUse")
	else
		FindNodeByName("CommonScripts").script.RandomRefusal()
	end
end
