global function SmokeOn()
	local fence_crash = FindNodeByName("fence_crash")
	fence_crash:Trigger()
end

global function SmokeOff()
	local fence_crash = FindNodeByName("fence_crash")
	fence_crash:StopTrigger()
end