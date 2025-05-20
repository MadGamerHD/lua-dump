local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
global next_hint
global script_node

if (not IsLoadingSavedGame()) then
	next_hint = 1
end

global function NotTrigger()
	if next_hint == 1 then
		--OverlayManager:ShowHint("TITLE_MOVEMENT","HINT_MOVEMENT_01", "hint_movement_01.tga", 0, 0, 5)
	--	OverlayManager:ShowHint("TITLE_MOVEMENT","HINT_MOVEMENT_01")
		
		OverlayManager:ShowTutorial("OBSERVATION")
		WaitFrame()
		OverlayManager:ShowTutorial("MOVEMENT")
		WaitFrame()

		next_hint = next_hint + 2
	elseif next_hint == 2 then
		--OverlayManager:ShowHint("TITLE_OBSERVATION","HINT_OBSERVATION_01", "hint_observation_01.tga", 0, 0, 5)
		OverlayManager:ShowHint("TITLE_OBSERVATION","HINT_OBSERVATION_01")
		next_hint = next_hint + 1
	elseif next_hint == 3 then
		SayPrep("skip", "")
		OverlayManager:ShowTutorial("INTERACTION")
		--OverlayManager:ShowHint("TITLE_INTERACTION","HINT_INTERACTION_01 HINT_INTERACTION_02 HINT_INTERACTION_03", "hint_blank.tga hint_interaction_02.tga hint_interaction_03.tga",0, 0, 15)
		next_hint = next_hint + 1
	elseif next_hint == 4 then
		--OverlayManager:ShowHint("TITLE_INVENTORY","HINT_INVENTORY_01 HINT_INVENTORY_02 HINT_INVENTORY_03", "hint_blank.tga hint_inventory_01.tga hint_inventory_02.tga", 0, 0, 15)
		OverlayManager:ShowTutorial("INVENTORY")
		next_hint = next_hint + 1
	elseif next_hint == 5 then
		--OverlayManager:ShowHint("TITLE_STEALTH","HINT_STEALTH_01 HINT_STEALTH_02 HINT_STEALTH_03", "hint_stealth_01.tga hint_stealth_02.tga hint_blank.tga", 0, 0, 15)
		OverlayManager:ShowTutorial("HINTS")
		Wait(2)
		script_node:StopTrigger()
	end
end

global function Trigger()
	if next_hint == 1 then
		WaitFrame()
		OverlayManager:ShowTutorial("MOVEMENT")
		
		Wait(1)
		--adds new objective
		AddGlobalObjective("Cyber_1_1")
		--turns objective to complete
		SetGlobalObjectiveState("Cyber_1_1_1", 2) -- 2 is unlock, 3 is done
		next_hint = next_hint + 2  --!
	elseif next_hint == 2 then
		OverlayManager:ShowTutorial("OBSERVATION")
		next_hint = next_hint + 1
	elseif next_hint == 3 then
		OverlayManager:ShowTutorial("INTERACTION")
		next_hint = next_hint + 1
	elseif next_hint == 4 then
		OverlayManager:ShowTutorial("INVENTORY")
		next_hint = next_hint + 1
	elseif next_hint == 5 then
		OverlayManager:ShowTutorial("STEALTH")
		next_hint = next_hint + 1
	elseif next_hint == 6 then
		OverlayManager:ShowTutorial("HINTS")
		Wait(2)
		script_node:StopTrigger()
	end
end