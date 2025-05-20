global script_node
local actor = script_node:FindActor()
local head = script_node:FindNodeByTag("head_locator")
local particles = script_node:FindNodeByTag("breath_fx")
local first_time = true

global function Idle()
	if first_time then
		-- Wait on first time, so that everyone don't start breathing together
		Wait(Random(400)/100) -- random 0.01 to 4 seconds
		first_time = false
	end
	
	if actor:IsStandingIdle() then
		Wait(Random(100)/100) -- random 0.01 to 1 second
		head:SyncDataFromDef()
		particles:Trigger()

	
		Wait(4)
	--else
	--	Wait(2)
	end
end