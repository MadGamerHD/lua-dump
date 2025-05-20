global script_node
global tired_anim
local playing_tired_anim
local CallbacksCount = 0

local function StartMinigame()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local Idle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Idle1")
	local ChrononDoctor2Loc = FindNodeByName("ChrononDoctor2Loc")

	SetGlobalObjectiveState("Dalek_2_2_4", 3)
	
	doctor:SetBehaviour("wait")
	doctor:SetTarget(ChrononDoctor2Loc)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "CallbacksDone")

	amy:PlayAnim(Idle,1,2)

	SayPrep("skip", "async")
	--*NEW
	--HINT
	--The Doctor returns with both items
		amy::SID_0629:Doctor, please hurry, I'm fading away.
	
	SetSayCallback(script_node, "SpeechDone")
end

global function SpeechDone()
	local doctor = GetActor("doctor")

	--*NEW
	--HINT
	--The Doctor returns with both items (replys to Amy)
		doctor::SID_1291:Don't worry, Amy. I've got all the components I need now.

	SetSayCallback(script_node, "CallbacksDone")
end

global function CallbacksDone()
	CallbacksCount = CallbacksCount+1

	if CallbacksCount == 2 then
		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local Minigame = MinigameManager:GetAssembleMiniGame()

		MinigameManager:SetMiniGameID("MINI_ASSEMBLE02")
		Minigame:SetCurrentMaze(1)
		MinigameManager:StartMiniGame(Minigame)
		MinigameManager:SetCallback(script_node, "ReviveAmy")
	end
end

global function ReviveAmy()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_interact = FindNodeByName("Amy_Interact")
	local amy_script = FindNodeByName("amy_startup_0")
	local amy_alive = FindNodeByPartialName("AMY_ExhaustedToIdle")
	local dalekanium = FindNodeByName("DalekaniumCoilObj")
	local crystal = FindNodeByName("CrystalObj")
	local chronon = FindNodeByName("ChrononBlockerObj")
	local cutscene_11_1 = FindNodeByName("cutscene_11_1")
	
	doctor:RemoveInventoryItem(dalekanium)
	doctor:RemoveInventoryItem(crystal)
	amy:AddInventoryItem (chronon)
	amy_interact:Sleep()

	amy_script.script.AmyState  = 0

	SetGlobalObjectiveState("Dalek_2_2_4", 3)	
	SetGlobalObjectiveState("Dalek_2_2_5", 3)
	
	cutscene_11_1:Trigger()
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalekanium = FindNodeByName("DalekaniumCoilObj")
	local crystal = FindNodeByName("CrystalObj")
	local HintScript = FindNodeByName("AmyHintInteractScript")

	print("Use","\n")
	if (doctor:IsInventoryItem(dalekanium) and doctor:IsInventoryItem(crystal)) then
		if (doctor:IsUsingInventoryItem(dalekanium)) then
			StartMinigame()
		end
	
		if (doctor:IsUsingInventoryItem(crystal)) then
			StartMinigame()
		end
	else
		if (doctor:IsUsingInventoryItem(dalekanium)) then
			HintScript.script.Hint()
			--TALK
			--Talk Amy - crystal
			--amy::SID_0627:Perhaps the Crystal is in a secure location. Maybe with a secret way in?
		end

		if (doctor:IsUsingInventoryItem(crystal)) then
			HintScript.script.Hint()
			--TALK
			--Talk Amy - coil 
			--amy::SID_0628:That Coil is probably gathering dust in a corner somewhere, have you explored everywhere?
		end
	end
end

global function Interact()
--ReviveAmy()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalekanium = FindNodeByName("DalekaniumCoilObj")
	local crystal = FindNodeByName("CrystalObj")
	local HintScript = FindNodeByName("AmyHintInteractScript")

	print("Interact","\n")
	
	if (doctor:IsInventoryItem(dalekanium) and doctor:IsInventoryItem(crystal)) then
		StartMinigame()
	else
		HintScript.script.Hint()
	--TALK
	--Talk Amy - no items:
		--amy::SID_0626:You should get back to the Production Facility and look for those those items.
	end
end

global function Idle()
	if not playing_tired_anim then
		if tired_anim then
			local amy = GetActor("amy")
			local amy_anim = FindNodeByPartialName("Anim_AMY_Exhausted_Idle")
				
			playing_tired_anim = true
			
			amy:PlayAnim(amy_anim,1,0)
		end
	end
end
