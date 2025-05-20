global model
global script_node
global first
global first_valve_hint

if(first==nil) then
   if not IsLoadingSavedGame() then
      local doctor = GetActor("doctor")
      local ScrewDriver = script_node:FindInventoryItem()
      doctor:AddInventoryItem(ScrewDriver )
   end
   first = 1
end

global function Use()
	local SatNav = FindNodeByName("SatNav")
	local doctor = GetActor("doctor")
	
	if doctor:IsUsingInventoryItem(SatNav) then
		local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
		local NanoMinigame = MinigameManager:GetCircuitMiniGame()

		--NanoMinigame:GenerateNewWave()
		--local cutscene=FindNodeByName("script_leaving_for_base")
		MinigameManager:SetCallback(script_node, "Run_cutscene")
		MinigameManager:StartMiniGame(NanoMinigame)
	end
end

global function Run_cutscene()
	local cutscene=FindNodeByName("cs_leaving_for_base")
	cutscene:Trigger()
end

global function Talk()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	SayPrep("skip", "")
	
	
	local key_card = FindNodeByName("key_card")
	if(doctor:IsInventoryItem(key_card)) then  -- then we're not in the first cyberslave chase - hint about radio part
		amy:SetBehaviour("wait")
		--TALK
		--small exchange: amy talks to doctor when he's trying to create the cure
		doctor::SID_0437: Did you fix the radio?
		--TALK
		amy::SID_0438: No, but...
		--TALK
		doctor::SID_0439: Then you really need to let me concentrate on this.
		--TALK
		doctor::SID_0440: I've got to reprogram this synthesizer to reverse what's happening to Chisholm.
	
		local capacitor = FindNodeByName("capacitor")
		if(amy:IsInventoryItem(capacitor)) then
			--TALK
			--small exchange: amy talks to doctor when he's trying to create the cure
			amy::SID_0441: But I haven't got a clue where to find this radio part.
			--TALK
			doctor::SID_0442: Hmm. A place like this must have spares in some sort of store room.
			--TALK
			doctor::SID_0443: Maybe Chisholm can help you.
			--TALK
			amy::SID_0444: If he's still human. I suppose I can go and see. Maybe he can help.
		end
		amy:SetBehaviour("pc")
	else		-- being chased by slave. steam hint.
		if(first_valve_hint == nil) then
			--*NEW. hint about steam vents
			--shouted as the doc is staying in front of the cyberslave lumbering after him.
			doctor::SID_0879: Maybe the machinery over there can be useful in dispatching this guy.
			first_valve_hint = 1
		else
			doctor::SID_0880: I'll lure him past the vents. Blast him with a burst of steam!
		end
	end
end
