global DisablePreview

global function Trigger()

	local openscript = FindNodeByName("sub_door1_script")
	local timeline = FindNodeByName("door_trigger_time")
	local preview = FindNodeByName("preview_tripwire1")

	openscript.script.Interact()

	if not DisablePreview then
		local doctor = GetActor("doctor")
		
		doctor:SetBehaviour("wait")
		ShowLetterBox()
		timeline:Trigger()	
		Wait(1)
--		doctor::Watch out!
--		doctor::Tripwires and explosives we need to be careful.
		doctor:SetBehaviour("pc")
		HideLetterBox()
		
		preview:StopTrigger()
	end
end

