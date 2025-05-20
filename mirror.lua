global script_node
global state
global first

state = "correct"

global function Comment()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "async")
	--VO
	--mirror
		doctor::SID_0477:These Mirrors can be turned to different angles.
end

global function Interact()
	local doctor = GetActor("doctor")
	local click_sound = FindNodeByName("audio_click")
	local mirror = FindNodeByName("prop_mirror0")
	local loc0 = FindNodeByName("loc_mirror0")
	local cutscene = FindNodeByName("show_mirror0")
	local mirror1=FindNodeByName("script_mirror1")
	local mirror2=FindNodeByName("script_mirror2")
	local move_sound = FindNodeByName("audio_move_mirror")  --0.38s
	
	Stop2dMode()
	click_sound:Trigger()
	
	if(first == nil) then
		first = 1
		mirror1.script.first=1
		mirror2.script.first=1
		Comment()
	end

	ShowLetterBox()
	cutscene:Trigger()

	if(state == "chair") then
		mirror:MoveToOrigin(1, "lerp")
		Wait(0.3)
		move_sound:Trigger()
		state = "correct"
		Wait(2.5)
	else
		mirror:Move(loc0, 1, "lerp")
		Wait(0.3)
		state = "chair"
		move_sound:Trigger()
		Wait(2.5)
	end

	HideLetterBox()
	Start2dMode()
end
