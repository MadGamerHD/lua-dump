global script_node
global state
global first

state = "chair"

global function Interact()
	local doctor = GetActor("doctor")
	local click_sound = FindNodeByName("audio_click")
	local laser = FindNodeByName("prop_laser3")
	local loc = FindNodeByName("loc_laser3")
	local cutscene = FindNodeByName("show_laser3")
	local mirror1=FindNodeByName("script_laser0")
	local mirror2=FindNodeByName("script_laser2")
	local move_sound = FindNodeByName("audio_move_laser")  --1.23s
				
	click_sound:Trigger()
	Stop2dMode()

	if(first == nil) then
		first = 1
		mirror1.script.first=1
		mirror2.script.first=1
		mirror1.script.Comment()
	end

	ShowLetterBox()
	cutscene:Trigger()
	
	if(state == "correct") then
		laser:MoveToOrigin(1, "lerp")
		Wait(0.3)
		move_sound:Trigger()
		state = "chair"
		Wait(2.5)
	else
		laser:Move(loc, 1, "lerp")
		Wait(0.3)
		state = "correct"
		move_sound:Trigger()
		Wait(2.5)
	end

	HideLetterBox()
	Start2dMode()
end