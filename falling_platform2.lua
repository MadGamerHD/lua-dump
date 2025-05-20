
global function Trigger()
	print("I did trigger, I did, I did.")
	local platform = FindNodeByTag("falling_platform2")
	platform:StopTrigger()
	local me = FindNodeByName("Trigger_falling_platform")
	me:StopTrigger()
end