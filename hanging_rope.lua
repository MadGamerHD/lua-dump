--global chisholm_revived
global model
global wall
global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = FindNodeByName("chisholm_script")
	if(chisholm.script.chisholm_revived) then
		ShowLetterBox()
		doctor:SetBehaviour("wait")
		local waypoint = FindNodeByName("loc_go_towards_chisholm")
		doctor:SetTarget(waypoint)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		Wait(0.2)
		ShowFade()
		Wait(1)
		waypoint = FindNodeByName("loc_chisholm_out_of_sight")
		chisholm = GetActor("chisholm")
		chisholm:Teleport(waypoint)  -- move chisholm in case his extra model shows in the cutscene
		doctor:SetBehaviour("wait")
		WaitFrame()
		local cutscene = FindNodeByName("Cutscene_3")
		cutscene:Trigger()

		--model:StopTrigger()
	else
		SayPrep("skip", "async")
		--VO
		--The Doctor here interacts with the rope, but before he has revived Chisholm. He needs to wake up Chisholm before he can do anything to the rope, hence this hint.
		doctor::SID_0044:I need to revive the skidoo rider and find a way to hoist him out.
	end
	

end
