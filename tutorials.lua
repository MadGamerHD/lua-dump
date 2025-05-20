local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
global after_intro_hints
global next_hint
global collections_hint
global script_node

if (not IsLoadingSavedGame()) then
	next_hint = 1
end

global function Idle()
	if after_intro_hints then
		if next_hint == 1 then
			SayPrep("skip", "")
			Wait(1)
			OverlayManager:ShowTutorial("MOVEMENT")
			next_hint = next_hint + 1
			
			Wait(1)
			AddGlobalObjective("POSEIDON_1_1");
			SetGlobalObjectiveState("POSEIDON_1_1_1", 0)
			SetGlobalObjectiveState("POSEIDON_1_1_2", 2)
			Wait(3)
		
		elseif next_hint == 2 then
			if GetInteractType() == "examine" or GetInteractType() == "climb" then
				SayPrep("skip", "")
				WaitFrame()
				WaitFrame()				
				OverlayManager:ShowTutorial("INVENTORY")
				next_hint = next_hint + 1
				Wait(4)
			end
		
		elseif next_hint == 3 then
			if GetInteractType() == "talk" then
				SayPrep("skip", "")
				Wait(1.0)
				OverlayManager:ShowTutorial("HINTS")
				next_hint = next_hint + 1
			end

		elseif next_hint == 4 and collections_hint then
			script_node:StopTrigger()
		end
		
		if not collections_hint and GetInteractType() == "collect" then
			SayPrep("skip", "")
			WaitFrame()
			WaitFrame()			
			OverlayManager:ShowTutorial("COLLECTIONS")
			collections_hint = true
		end
	end
end

global function Trigger()
	OverlayManager:ShowTutorial("INTERACTION")
end	