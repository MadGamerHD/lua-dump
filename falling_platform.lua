global model
global script_node

global function Drift()
	local doctor = GetActor("doctor")
	local prop = script_node:FindProp()
	local endpos = FindNodeByName("falling_platform1_end")
	local chisholm = GetActor("chisholm")
	local loc_node = FindNodeByName("loc_chisholm2")
	local chisholm_script = FindNodeByName("chisholm_script")

	doctor:SetBehaviour("pc")
	prop:WaterBob(0.1);
	prop:Move(endpos, 4, "sine")
	--Wait(1)
	--chisholm_script.script.UnlockLocator(2)
	Wait(3)
	-- teleport is to work around the fact that the move doesn't work
	--chisholm:Teleport(loc_node)
	chisholm_script.script.UnlockLocator(3)
	chisholm_script.script.UnlockLocator(4)
end

local function BreakOff()
	local prop = script_node:FindProp()
	local droppos = FindNodeByName("falling_platform1_drop")

	prop:SetCallback(script_node, "Drift")
	prop:Move(droppos, 2, "sine")
end

global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "async")
	--VO
	-- interacting with loose ice block
	doctor::SID_0045: This block of ice looks like it could fall at any moment. Maybe I can help it along.
end

global function Use()

	
	local screwdriver = FindNodeByName("screwdriver")
 	local doctor = GetActor("doctor")
 	local int_node = FindNodeByTag("int")
	SayPrep("skip", "async")
	
	if (doctor:IsUsingInventoryItem(screwdriver)) then
		doctor:SetBehaviour("wait")
		local camera=FindNodeByName("falling_platform1_camera_line")
		camera:Trigger()
		--VO
		-- using screwdriver to melt the ice block loose
		doctor::SID_0046: Let's see if we can't help this floe on its way.
		Wait(2)
		BreakOff()

		int_node:StopTrigger()
	else
		--VO
		-- Using wrong items on ice floe
		doctor::SID_0047:No, that won't work.
	end

end

-- Trigger for testing

global function Trigger()
	local prop = script_node:FindProp()
	
	prop:TeleportToOrigin()
	BreakOff()
end

