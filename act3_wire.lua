--local camcut = FindNodeByName("CutSceneCamera_1")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_loc = FindNodeByName("doc_wire_loc")
	local amy_loc = FindNodeByName("amy_wire_loc")
	local doc_ent = FindNodeByShortName("EM_ENTITY_TheDoctor_0")
--	local amy_ent = FindNodeByShortName("EM_ENTITY_Amy_0")

--	doctor:SetFocus(amy_ent)	

	SayPrep("skip", "")		
	
	doctor:SetBehaviour("wait")
	doctor:Teleport(doc_loc)

	amy:SetBehaviour("wait")
	amy:Teleport(amy_loc)

	ShowLetterBox()

	amy:SetFocus(doc_ent)	
	--CUT SCENE 16.1
	--Use dalekanium wires with dalekanium debris
		doctor::SID_0709:These wires should connect this debris to the generators and with a zap of the Sonic, we should have our trap set.
--	camcut:CutTo()	
	amy:ClearFocus()
	Wait(0.5)
		doctor::SID_0710:Then all we'll need is a Dalek. Or two. 
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local gens_off = FindNodeByName("gens_off")
	local gens_on = FindNodeByName("gens_on")
	local controls_off = FindNodeByShortName("EM_ENTITY_unit_off:0")
	local controls_on = FindNodeByShortName("EM_ENTITY_unit_on:0")
	local connected = FindNodeByShortName("EM_ENTITY_connected:0")
	local electric = FindNodeByShortName("EM_ENTITY_Connective_Electric:0")

	gens_on:Trigger()
	gens_off:StopTrigger()
	controls_off:StopTrigger()
	controls_on:Trigger()
	connected:Trigger()
	electric:Trigger()

	doctor:SetBehaviour("pc")
	amy:SetBehaviour("follow")
	HideLetterBox()	
end
