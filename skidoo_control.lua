global got_satnav
got_satnav = false
global script_node
global model
local first = 1

global function Trigger()
	local amy = GetActor("amy")
	local SatNav = script_node:FindInventoryItem()
	amy:AddInventoryItem(SatNav )
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	if (got_satnav ~= true) then
	local way_point = FindNodeByName("loc_skidoo_control")
		ShowLetterBox()
		if (FindPlayer():GetName()==amy:GetName()) then
			
			amy:SetBehaviour("wait")
			amy:SetTarget(way_point)
			amy:SetMoveTime(1)
			amy:SetBehaviour("move")
			--amy:Face(2,"sine")
			Wait(1)
			--local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
			local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractLowBend")
			amy:PlayAnim(anim, 1, 0.1)
			Wait(1)
			model:Hide()
			SayPrep("skip", "")
			--VO
			-- investigating Skidoo controls
			amy::SID_0048: A Sat Nav. Maybe I should give it to the Doctor.
			got_satnav = true
			local SatNav = script_node:FindInventoryItem()
			amy:AddInventoryItem(SatNav )
			
			amy:SetBehaviour("pc")	

		else
			doctor:SetBehaviour("wait")
			doctor:SetTarget(way_point)
			doctor:SetMoveTime(1)
			doctor:SetBehaviour("move")
			--doctor:Face(2,"sine")
			Wait(1)
			SayPrep("skip", "")
			--VO
			--first interacting with the skidoo
			doctor::SID_1142: A Skidoo... I wonder what happened to the Rider? 
			
			local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractOnTable")
			--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow")
			doctor:PlayAnim(anim, 1, 0.1)
			Wait(2)
			model:Hide()
			--VO
			-- investigating Skidoo controls
			doctor::SID_0049: Let's see. Ah, a Sat Nav. Could come in handy...
			got_satnav = true
			local SatNav = script_node:FindInventoryItem()
			doctor:AddInventoryItem(SatNav )
			
			--explore the area
			SetGlobalObjectiveState("Cyber_1_1_2", 3) -- 2 is unlock, 3 is done
			--find a way down to the driver
			SetGlobalObjectiveState("Cyber_1_1_2", 2) -- 2 is unlock, 3 is done
			Wait(1)
			doctor:SetBehaviour("pc")
			local tutorial_script = FindNodeByName("script_act1_tutorials")			
			tutorial_script.script.Trigger()
			

		end
		model:StopTrigger()
		HideLetterBox()
	else
		if (FindPlayer():GetName()==amy:GetName()) then
			--amy:SetBehaviour("wait")
			--amy:SetTarget(model)
			--amy:Face(1,"sine")
			--Wait(1)
			--local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
			--amy:PlayAnim(anim, 1, 0.1)
			--Wait(1)
			SayPrep("skip", "")
			--VO
			-- investigating Skidoo controls more than once
			amy::SID_0050: The motor still seems to work.
		--	amy:SetBehaviour("pc")
		else
			--doctor:SetBehaviour("wait")
			--doctor:SetTarget(model)
			--doctor:Face(1,"sine")
			--Wait(1)
			--local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractLow")
			--doctor:PlayAnim(anim, 1, 0.1)
			--Wait(1)
			SayPrep("skip", "")
			if(first == 1) then
				--VO
				--investigating Skidoo controls more than once
				doctor::SID_1530:The track has come off the drive wheels.
				first = 2
			end
	--VO
			doctor::SID_0051: The motor still seems to work.
			--doctor:SetBehaviour("pc")
		end
	end	
end


