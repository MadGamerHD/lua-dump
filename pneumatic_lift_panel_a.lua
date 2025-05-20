

global function Interact()
	local step_trigger = FindNodeByName("stealthoff_amymove")
	if(step_trigger.script.checking_danger_state) then
		local doctor = GetActor("doctor")
		SayPrep("skip", "")
		--VO
		--trying to use panel while being chased
		doctor::SID_2468: I better loose that Cyberslave before I investigate the panel.
	else
		local cutscene = FindNodeByName("Cutscene_10_1")
		cutscene:Trigger()
	end
end

global function Use()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	--VO
	--Use Sonic on panel.
	doctor::SID_2031:The lift controls are working so there is no need for the Sonic.
end
