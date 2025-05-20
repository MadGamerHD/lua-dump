local AtLocCount = 0

global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local eye_stalk = FindNodeByName("eye_stalk")
	local beam_gun = FindNodeByName("beam_gun")
	local vis_disrupt = FindNodeByName("vis_disrupt")
	local hint = QueryObjective(0)  
	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy_0")
	local talkto = FindNodeByName("amy_talkto_loc")
	
	SayPrep("skip", "")		
	
	if amy:IsInventoryItem(eye_stalk) and amy:IsInventoryItem(beam_gun) then
	
		SayPrep("", "async")
		--HINT
		--Talk to Doctor - picked up gun and eye from Production Facility.
			doctor::SID_0754:Brilliant, you found both of them. Let's get to work.
		
		SetSayCallback(script_node, "AtLoc")
		
		doctor:SetFocus(amy_ent)		
		amy:SetBehaviour("wait")
		amy:SetTarget(talkto)
		amy:SetMaxSpeed(2)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node, "AtLoc")
	
	elseif amy:IsInventoryItem(eye_stalk) then
		--HINT
		--Picked up just the eye stalk from Production Facility
			doctor::SID_0752:This Eye Stalk contains the Ocular Cable that connects the Daleks eye and should connect the Receiver to the Distributor.

	elseif amy:IsInventoryItem(beam_gun) then
		--HINT
		--Talk to Doctor - picked up only gun from Production Facility
			doctor::SID_0753:Well done. This Beam Distributor is just what I need.
	
	elseif (hint == "hint_352a" or hint == "hint_352b") then
		--HINT
		--Talk Doctor  - outside chamber hint at get to emperor objective. First ask
			doctor::SID_0766:Get back in there and make your way to the Emperor. Only break cover when you feel yourself fading, but hurry.
	
--	elseif (hint == "hint_36b") then
--		--HINT
--		--Talk Doctor  - outside chamber hint at get to emperor objective. Second ask
--			doctor::SID_0979:Amy. I know it's dangerous but you must activate the Vision Disruptor.
	else
		--HINT
		--Talk to Doctor - picked up nothing from Production Facility
			doctor::SID_0751:Check in the corners where debris maybe have ended up, they must be in there somewhere.
	end
end

global function AtLoc()
	local MiniGameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local AssembleMiniGame = MiniGameManager:GetAssembleMiniGame()
	
	AtLocCount = AtLocCount+1
	
	if AtLocCount == 2 then	
		MiniGameManager:SetMiniGameID("MINI_ASSEMBLE03")
		AssembleMiniGame:SetCurrentMaze(2)
		MiniGameManager:StartMiniGame(AssembleMiniGame)
		MiniGameManager:SetCallback(script_node, "Assembled")
	end
end

global function Assembled()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local object_states = FindNodeByName("object_states_script")
	local doc_carapace = FindNodeByName("doc_carapace_interact")
	local obj_connected = FindNodeByShortName("EM_ENTITY_connected:0")
	local amy_carapace = FindNodeByName("amy_carapace_interact")
	local council_daleks = FindNodeByName("council_daleks")
	local reenter_council = FindNodeByName("reenter_council_trigger")
	local noback_trig = FindNodeByName("nobackdown_trigger")
	local cutscene_19 = FindNodeByName("cutscene_19")
	local eye_stalk = FindNodeByName("eye_stalk")
	local beam_gun = FindNodeByName("beam_gun")
	local vis_disrupt = FindNodeByName("vis_disrupt")
	
	object_states.script.DebrisState = 3
	object_states.script.GeneratorState = 3
	
	doc_carapace:StopTrigger()
	obj_connected:StopTrigger()
	amy_carapace:Trigger()
	council_daleks:Trigger()
	reenter_council:Trigger()
	noback_trig:Trigger()	

	amy:RemoveInventoryItem(eye_stalk)
	amy:RemoveInventoryItem(beam_gun)
	amy:AddInventoryItem(vis_disrupt)

	doctor:ClearFocus()
	
	SetGlobalObjectiveState("Dalek_3_4_4", 3)	
	SetGlobalObjectiveState("Dalek_3_4_5", 3)		

	cutscene_19:Trigger()
end
