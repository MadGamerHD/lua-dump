global script_node

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_ent  =FindNodeByShortName("doctor_head_locator_0")	
	local amy_ent  =FindNodeByShortName("amy_head_locator_0")
	local uselift = FindNodeByName("doc_uselift")
	local lifttop = FindNodeByName("amy_onlift_top")
	local platform_a = FindNodeByName("prop_pn_lift_a")
	local loc_platform_a = FindNodeByName("loc_pn_lift_a")
	local lift_start = FindNodeByName("audio_lift_start")  --0.49s
	local lift_end = FindNodeByName("audio_lift_end")  --1.54s
	local panel = FindNodeByShortName("EM_ENTITY_control_panel:0")

	ShowLetterBox()
	SayPrep("skip", "")
	
	doctor:SetTarget(uselift)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")

	amy:SetFocus(doc_ent)	
	--CUT SCENE 10.1
	--INT. EXCAVATION. ABOVE THE CYBERMAN SHIP  DAY
	--The Doctor leads Amy cautiously along a gantry towards the ship.
		doctor::SID_0463:Amy, come stand on here. I'll start the Lift.
		amy::SID_0464:What about you?
	--Amy moves
	doctor:SetFocus(amy_ent)	
		doctor::SID_0465:There must be another Lift up there that you can activate for me.
		amy::SID_0466:Why are we even trying to get up there?
	doctor:ClearFocus()	
		doctor::SID_0467:I need to get to the Control Room of that ship. I need to find out how close they are to waking the Cybermen.
	--Doctor turns left
		doctor::SID_0468:And I have to stop them.
		doctor::SID_0469:Just one animated Cyberman - that's all it could take to start converting the whole human race.
	--Doctor turns right
		amy::SID_0470:Ok. Let's do it.
	doctor:SetFocus(panel)
	amy:ClearFocus()
	
	--Lift goes up
	Wait(2.75)
	platform_a:Move(loc_platform_a, 1, "lerp")
	lift_start:Trigger()
	Wait(0.8)
	lift_end:Trigger()
	
	doctor:SetFocus(amy_ent)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local doc_idles = FindNodeByName("doc_idles")
	
	HideLetterBox()
	doctor:ClearFocus()	
	doctor:SetBehaviour("wait")
	doc_idles:Wake()
	amy:SetBehaviour("pc")
end
