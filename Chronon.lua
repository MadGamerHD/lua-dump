global script_node
global FirstExamine
global doctorFirstExamine
FirstExamine = 0
doctorFirstExamine = 0

global function Interact()
	local hint = QueryObjective(0) 
	local doctor = GetActor("doctor")
	local crystal = FindNodeByName("KontronCrystal")
	local CountScript = FindNodeByName("DrawingObjectiveScript")
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")	
	
	SayPrep("skip","")
	
	if ((hint == "hint_2_2_1" or hint == "hint_2_2_2") and not doctor:IsInventoryItem(crystal)) then
		if (doctorFirstExamine == 0) then
			doctorFirstExamine = 1
			--VO 
			--the doctor is examining the chronon blocker.
				doctor::SID_2425:The Chronon Blocker that I made for Amy. It contains a Kontron Crystal - exactly what I would need to focus and hold time.
		else
			--VO 
			--Doctor is trying to interact with the chronon blocker rather then use the screwdriver
				doctor::SID_1802:Perhaps a little Sonic would help disassemble it?
		end
	else
		OverlayManager:ShowFact("FACT_CHRONON_TITLE","FACT_CHRONON_DESC")
	end
	
	if (FirstExamine == 0) then
		FirstExamine = 1
		CountScript.script.AddToCount()
	end

	CountScript.script.CheckForCompletion()
end

global function Use()
	local hint = QueryObjective(0) 
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	local doc_helm_loc = FindNodeByName("DalekEyeLoc")

	if(doctor:IsUsingInventoryItem(screwdriver) )then
		doctor:SetBehaviour("wait")
		doctor:SetTarget(doc_helm_loc)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node, "AtLoc")
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

	SayPrep("skip","")
	
	MinigameManager:SetCallback(script_node, "MinigameComplete")
	MinigameManager:SetMiniGameID("MINI_ASSEMBLE03")
	Minigame:SetCurrentMaze(3)
	MinigameManager:StartMiniGame(Minigame)
end

global function TimeBandadgeComplete()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
end

global function MinigameComplete()
	local doctor = GetActor("doctor")
	local crystal = FindNodeByName("KontronCrystal")
	local watch =  FindNodeByName("FobWatch")

	doctor: AddInventoryItem (crystal)
	
	FindNodeByName("ChrononFactInteract"):Wake()
	FindNodeByName("Chronon_Interact"):Sleep()
	
	--Find something to focus and hold time in place (done)
	SetGlobalObjectiveState("Objective_2_2_2", 3)
	
	SayPrep("skip","async")
	
	if (not doctor:IsInventoryItem(watch)) then
		--VO
		--The doctor has just got the kontron crystal, is this too much of a spoiler?
			doctor::SID_1969:Now I just need something to keep track of time.
	else
		--VO
		--Doc has both objects fob and crystal
			doctor::SID_2499:Great that's everything I need. I should get back to the Control Room.

		--note:player has both objects
		--Assemble Tachyon Feedback Loop (active)
		SetGlobalObjectiveState("Objective_2_2_3", 2)
	end
	
	doctor:SetBehaviour("pc")
end

