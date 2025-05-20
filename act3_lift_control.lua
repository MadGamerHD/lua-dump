global cutscene_14_played

global function Interact()
	local doctor = GetActor("doctor")
	local cutscene15 = FindNodeByName("Cutscene_15")
	local destruct = FindNodeByName("self_destruct_time")

	if cutscene_14_played then
		destruct:StopTrigger()
		cutscene15:Trigger()
	else
		--VO
		--Main lift panel
			doctor::SID_2217:I'm not going back up just yet.
	end	
end
