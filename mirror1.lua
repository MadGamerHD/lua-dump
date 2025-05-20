global script_node
global state
global first

global function Init()
	state = "chair"
end

global function Interact()
	local doctor = GetActor("doctor")
	local click_sound = FindNodeByName("audio_click")
	local mirror = FindNodeByName("prop_mirror1")
	local cutscene = FindNodeByName("show_mirror1")
	local loc0 = FindNodeByName("loc_mirror1_origin")	
	local loc1 = FindNodeByName("loc_mirror1")
	local mirror1 = FindNodeByName("script_mirror0")
	local mirror2 = FindNodeByName("script_mirror2")	
	local move_sound = FindNodeByName("audio_move_mirror")  --0.38s
		
	Stop2dMode()
	click_sound:Trigger()

	if(first == nil) then
		first = 1
		mirror1.script.first=1
		mirror2.script.first=1
		mirror1.script.Comment()
	end

	ShowLetterBox()
	cutscene:Trigger()

	if(state == "chair") then
		state = "correct"
		mirror:Move(loc1, 1, "lerp")
		Wait(0.3)
		move_sound:Trigger()		
		Wait(2.5)
	else
		state = "chair"
		mirror:Move(loc0, 1, "lerp")
		Wait(0.3)
		move_sound:Trigger()
		Wait(2.5)
	end

	HideLetterBox()
	Start2dMode()
end