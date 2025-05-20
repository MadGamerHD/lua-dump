local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
global after_intro_hints
global next_hint
global collections_hint
global script_node
local hint_3_waited

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
			AddGlobalObjective("Dalek_1_1")
			Wait(4)
		
		elseif next_hint == 2 then
			if GetInteractType() == "examine" or GetInteractType() == "climb" then
				SayPrep("skip", "")
				OverlayManager:ShowTutorial("INTERACTION")
				next_hint = next_hint + 1
				Wait(4)
			end
		
		elseif next_hint == 3 then
			local hint1 = QueryObjective(1)  

			-- to fix issue of not being able to see objective on screen
			if not hint_3_waited then
				if hint1 == "hint_1_2_3" then
					Wait(5)
					hint_3_waited = true
				end
			end

			if GetInteractType() == "talk" then
				SayPrep("skip", "")
				OverlayManager:ShowTutorial("HINTS")
				next_hint = next_hint + 1
			end

		elseif next_hint == 4 and collections_hint then
			OverlayManager:TutorialsOff()
			script_node:StopTrigger()
		end
		
		if not collections_hint and GetInteractType() == "collect" then
			SayPrep("skip", "")
			OverlayManager:ShowTutorial("COLLECTIONS")
			collections_hint = true
		end
	end
end