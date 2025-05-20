local locator_names =
	{
		"loc_chisholm1",
		"loc_chisholm2", 
		"loc_chisholm3",
		"loc_chisholm4",
		"loc_chisholm5",
		"loc_chisholm6",
		"loc_chisholm7",
		"loc_chisholm8",
		"loc_chisholm9",
		"loc_chisholm10",
		"loc_chisholm11",
		"loc_chisholm12",
		"loc_chisholm13",
		"loc_chisholm14"
	}

global locators_unlocked
global current_locator
global chisholm_revived
global chisholm_down_again
global chisholm_pos
global model
global script_node
global first
local cycle = 1

--[[
	note that initialising the locators_unlocked array isn't required
	since lua treats nil as false.
	See page 10 & 21 of programming is lua for reference.
 --]]

locators_unlocked = {}
current_locator = 0
chisholm_pos = 0
chisholm_revived = false
chisholm_down_again = false 




global function Init()
	if IsLoadingSavedGame() then
		if chisholm_revived then
			if(chisholm_down_again) then
				local chisholm = GetActor("chisholm")
				local anim = FindNodeByTag("Chisholm_Anim_Unconcious")
				chisholm:PlayAnim(anim ,1,0)
			else
			
				if current_locator > 0 then
					local chisholm = GetActor("chisholm")
					local locator_node = FindNodeByName(locator_names[current_locator])
				
					chisholm:SetTarget(locator_node)
					chisholm:SetCallback(script_node, "ArrivedAtLocator")
					chisholm:SetMaxSpeed(1.0)
					chisholm:SetBehaviour("move")
					chisholm:EnableMoveWalls()
				end
			end
		else
			local chisholm = GetActor("chisholm")
			local anim = FindNodeByTag("Chisholm_Anim_Unconcious")
			chisholm:PlayAnim(anim ,1,0)
			--chisholm:DisableAnimLoop()
		end
	end
end


global function Interact()
	SayPrep("skip", "")
	if (chisholm_revived) then
		if(chisholm_down_again) then
			local doctor = GetActor("doctor")	
			--VO
			--interacting with unconcious Chisholm
			doctor::SID_2016:Poor chap. He's had a hard day.
		else
			local chisholm = GetActor("chisholm")

			if(cycle == 1) then
				cycle = 2
				--HINT
				--interacting with concious Chisholm
				chisholm::SID_0023:My ankle's not good. But I think I can make it.
				
			else
				cycle = 1
				--HINT
				--interacting with concious Chisholm
				chisholm::SID_1527:I'm doing fine, thanks.
				
			end
		end
	else
		local doctor = GetActor("doctor")
		--doctor:SetBehaviour("wait")
		if(first == nil or first == 1) then
			if(first == nil) then
				--VO
				--interacting with unconcious Chisholm, First time
				doctor::SID_1136: The name 'Chisholm' is printed on his jacket.
			end
			first = 2
			--VO
			--interacting with unconcious Chisholm
			doctor::SID_0024:Poor chap's out cold. If I don't do something to revive him soon, he's going to freeze to death.
		

			
		elseif(first == 2) then
			first = 3
			--VO
			--interacting with unconcious Chisholm, second time
			doctor::SID_1137: He's unconscious. I've got to find a way to revive him.
			
		else
			--VO
			--interacting with unconcious Chisholm, thrid time and there after
			doctor::SID_1138: I need to find him some Water.
		end
		--doctor:SetBehaviour("pc")
	end
end

global function Use()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	local FullMessCaddie = FindNodeByName("FullMessCaddie")
	local MessCaddie = FindNodeByName("MessCaddie")
	SayPrep("skip", "")
	if (chisholm_revived) then
		local chisholm = GetActor("chisholm")
		--HINT
		--using wrong objects on concious Chisholm
		chisholm::SID_0025:That's not going to help much. Think-think-think
	else
--		if(first == nil) then
--			--*NEW
--			--VO
--			--interacting with unconcious Chisholm, First time
--			doctor::SID_1139: Chisholm - his name is printed on his jacket.
--			first = 1
--		end
		if (doctor:IsUsingInventoryItem(FullMessCaddie)) then
			chisholm_revived = true
			doctor:RemoveInventoryItem(FullMessCaddie)
			local cutscene = FindNodeByName("waking_chisholm")
			cutscene:Trigger()
		elseif (doctor:IsUsingInventoryItem(MessCaddie)) then	
			SayPrep("skip", "async")
			--VO
			--using empty caddie on Chisholm (has to be full with warm water)
			doctor::SID_0026: I need to fill the Caddie with something warm to give him...
		else
			SayPrep("skip", "async")
			--VO
			--using wrong objects on unconcious Chisholm
			doctor::SID_0027: That might do more harm than good.
		end
	end
	doctor:SetBehaviour("pc")
end

local function MoveIfUnlocked()
	local next_locator = current_locator + 1

	print("next_locator ", next_locator)

	if locators_unlocked[next_locator] then
		local chisholm = GetActor("chisholm")
		local locator_node = FindNodeByName(locator_names[next_locator])
		
		current_locator = next_locator
		chisholm:SetTarget(locator_node)
		chisholm:SetCallback(script_node, "ArrivedAtLocator")
		chisholm:SetMaxSpeed(1.0)
		chisholm:SetBehaviour("move")
		chisholm:EnableMoveWalls()
	end
end

global function UnlockLocator(locator_index)
	local chisholm = GetActor("chisholm")

	locators_unlocked[locator_index] = true
	
	if chisholm:GetBehaviour() ~= "move" then
		MoveIfUnlocked()
	end
end

global function ArrivedAtLocator()
	print("ArrivedAtLocator")
	local chisholm = GetActor("chisholm")								--
	local locator_node = FindNodeByName(locator_names[current_locator])		-- TEMPORARY HACK
	chisholm:Teleport(locator_node)									--
	MoveIfUnlocked()
end

-- Trigger for testing

global function Trigger()
	UnlockLocator(1)
	UnlockLocator(2)
	UnlockLocator(3)
	UnlockLocator(4)
end
