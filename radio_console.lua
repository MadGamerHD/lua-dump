global script_node
global radio_fixed
global different_reply
global first_time
local locator = FindNodeByName("loc_radio_console")

local mode
local current_player




global function InteractMoveFinished()
	if(current_player == 1) then
		local doctor=GetActor("doctor")
		local anim = FindNodeByTag("TheDoctor_Anim_Interact_1m")
		doctor:SetCallback(script_node, "InteractAnimFinished")
		doctor:PlayAnim(anim, 1, 0.1)
		doctor:DisableAnimLoop()
	else
		local amy = GetActor("amy")
		local anim = FindNodeByPartialName("amy_Anim_AMY_Interact1m")
		amy:SetCallback(script_node, "InteractAnimFinished")
		amy:PlayAnim(anim, 1, 0.1)
		amy:DisableAnimLoop()
	end
end

global function Interact()
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
		SayPrep("skip", "async")

		if (FindPlayer():GetName()==amy:GetName()) then
			--if(radio_fixed) then
			local capacitor=FindNodeByName("capacitor")
			local have_part=amy:IsInventoryItem(capacitor)
			if(have_part) then
				--VO
				-- interact with radio if already found the capacitor
				amy::SID_0264: Now I just need to put the Capacitor in the Radio.
			else
				--VO
				-- interact with radio if NOT found the capacitor
				amy::SID_0265: The Radio needs a new Capacitor. I need to find one.
			end
			amy:SetBehaviour("pc")
		else
			if(radio_fixed) then
				if(different_reply == 1) then 
					--VO
					-- interact with fixed radio option 1
					doctor::SID_0266: No need to call Fort Cecil again. They might come looking to help and cause more problems.
					different_reply = 2
				else
					--HINT
					--interact with fixed radio option 2
					doctor::SID_0267:Good job on the Radio, Amy.
					different_reply = 1
				end
				doctor:SetBehaviour("pc")
			else
				--VO
				--nteract with the radio before it is fixed
				doctor::SID_1288:Looks like a radio.
				
				local mat_part = FindNodeByName("cybermat_part")
				local have_part=doctor:IsInventoryItem(mat_part)
				if(have_part) then
					Wait(2)
					first_time = 1
					--disable trigger that plays same cutscene
					local trigger_sphere = FindNodeByName("trigger_radio_speak")
					trigger_sphere:StopTrigger()
					--local cutscene = FindNodeByName("cs8_2_fort_cecil_calling")
					doctor:SetBehaviour("wait")
					local cutscene = FindNodeByName("Cutscene_8_3")
					cutscene:Trigger()
				else
					doctor:SetBehaviour("pc")
				end
			end
				
		
		end	

end
	
global function Use()
	local amy=GetActor("amy")

	if (FindPlayer():GetName()==amy:GetName()) then
		local capacitor = FindNodeByName("capacitor")
		if amy:IsUsingInventoryItem(capacitor) then
			amy:RemoveInventoryItem(capacitor)
			radio_fixed = true
			amy:SetTarget(locator)
			amy:SetMoveTime(1)
			amy:SetBehaviour("move")
			Wait(1)
			local cutscene = FindNodeByName("warning_fort_cecil_CS8_2")
			cutscene:Trigger()
					
		else
			FindNodeByName("common_scripts").script.RandomRefusal()	

		end
	else
		FindNodeByName("common_scripts").script.RandomRefusal()	
	end
end




