global model

global function Interact()
	local amy = GetActor("amy")
	if (FindPlayer()==amy) then
	--	amy:SetBehaviour("wait")
	--	amy:SetTarget(model)
	--	amy:Face(2,"sine")
	--	Wait(1)
		--VO
		--interacting with winch
		amy::SID_0052: There's a Winch attached to the Skidoo.
	--	amy:SetBehaviour("pc")
	else
		local doctor = GetActor("doctor")
	--	doctor:SetBehaviour("wait")
	--	doctor:SetTarget(model)
	--	doctor:Face(2,"sine")
	--	Wait(1)
		--VO
		--interacting with winch
		doctor::SID_0053: The Skidoo has a Winch attachment.
	--	doctor:SetBehaviour("pc")
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	print("printing amy and current player")	
	print(amy)
	print(FindPlayer())
	if (FindPlayer():GetName()==amy:GetName()) then
		local rope = FindNodeByName("Rope")
		local amy = GetActor("amy")
		

		if (amy:IsUsingInventoryItem(rope)) then
			amy:SetBehaviour("wait")
			local winch_point = FindNodeByName("loc_winch")
			amy:SetTarget(winch_point)
			amy:SetMoveTime(1)
			--amy:Face(2,"sine")
			amy:SetBehaviour("move")
			Wait(1)
			local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractLowBend")
			amy:PlayAnim(anim, 1, 0.1)
			Wait(1)
			SayPrep("skip", "")
			--HINT
			--shouting down to the doctor in chasm
			amy::SID_0054:I'll tie the Rope to the Skidoo's Winch, Doctor. Let me know when to start the motor!
			
			amy:RemoveInventoryItem(rope)
			doctor:SetBehaviour("pc")
			--tie the rope to the skidoo
			SetGlobalObjectiveState("Cyber_1_3_1", 3) -- 2 is unlock, 3 is done
			--Use the rope to hoist Chisholm
			--SetGlobalObjectiveState("Cyber_1_3_2", 2) -- 2 is unlock, 3 is done
			local hanging_rope = FindNodeByTag("rope_model")
			hanging_rope:Trigger()
			

		else
			--VO
			-- Using wrong item on winch
			amy::SID_0055: That won't work
		end
	else
		
		--VO
		-- Using wrong item on winch
		doctor::SID_0056: Can't use that with the Winch.
	end
end
