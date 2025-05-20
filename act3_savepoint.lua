global function Trigger()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local flicker_script = FindNodeByName("FlickeringLightGameplayScript_0")
	doctor:SetBehaviour("wait")
	flicker_script.script.player_in_darkness = false
	flicker_script.script.area = 0
	--amy:SetFollowDistance(5)
	SayPrep("skip", "async")
	--VO
	--out of the shadows
	doctor::SID_2712: Phew. Safe again.
	--Stay in the light
	SetGlobalObjectiveState("POSEIDON_3_1_1", 3) -- 2 is unlock, 3 is done
	WaitFrame()

	local stop_back = FindNodeByName("no_go_back_darkness")
	stop_back:Trigger()
	
	--Wait(1.5)
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	doctor:SetBehaviour("pc")
	SaveCheckpoint()
end
