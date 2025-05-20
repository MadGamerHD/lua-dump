global DoneFirstTime

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local stop_time = FindNodeByName("stop_timeline")

	doctor:DisableStealth()
	amy:DisableStealth()
	if not DoneFirstTime then
		stop_time:Trigger()
		DoneFirstTime = true
	end
end