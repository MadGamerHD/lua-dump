global model

global function Interact()
	local amy=GetActor("amy")
	amy:SetBehaviour("wait")
	local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractHigh") --2.3s
	SayPrep("skip", "async")
	--VO
	--examining the live wire, and getting the idea that it could be a weapong against the oncoming cyberslave.
	amy::SID_0286: That Cable looks dangerous. Ooh and kinda useful.

	local straight_wire = FindNodeByTag("straight_wire")
	local button = FindNodeByName("script_powerbutton")
	local waypoint = FindNodeByName("loc_looped_wire")
	amy:SetTarget(waypoint)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	Wait(1)
	if amy:GetBehaviour() ~= "dead" then
		amy:PlayAnim(anim_amy, 1, 0.1)
		Wait(1.5)
		
		button.script.wire_down = true
		straight_wire:Trigger()
		model:Hide()
		Wait(0.8)
		amy:SetBehaviour("pc")
		model:StopTrigger()
	end
	
end
