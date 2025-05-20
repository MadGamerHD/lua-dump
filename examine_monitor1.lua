global function Interact()
	local doctor = GetActor("doctor")
	local beep = FindNodeByName("useMonitorControlBeep")
	SayPrep("skip", "")
	--VO
	--When examining monitor in factory corridor
	doctor::SID_0934:Ah, a Control Panel. It's not a good idea to stop production.
	beep:Trigger()
end

global function Use()
	local beep = FindNodeByName("useMonitorControlBeep")
		local RandomRef = FindNodeByName("RandomRefusalScript")
		RandomRef.script.RandomRefusal()
		beep:Trigger()
end
