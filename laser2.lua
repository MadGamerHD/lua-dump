global script_node
global state
global first

state = "chair"

global function Interact()
	local doctor = GetActor("doctor")
	local click_sound = FindNodeByName("audio_click")
	local mirror1=FindNodeByName("script_laser1")
	local mirror2=FindNodeByName("script_laser0")
	local laser = FindNodeByName("prop_laser2")
	local loc1 = FindNodeByName("loc_laser2")
	local loc0 = FindNodeByName("loc_laser2_origin")	
	local cutscene = FindNodeByName("show_laser2")
	local move_sound = FindNodeByName("audio_move_laser")  --1.23s
			
	click_sound:Trigger()
	Stop2dMode()
	
	if(first == nil) then
		first = 1
		mirror1.script.first=1
		mirror2.script.first=1
		mirror2.script.Comment()
	end

	ShowLetterBox()
	cutscene:Trigger()
	
	if(state == "chair") then
		laser:Move(loc1, 1, "lerp")
		Wait(0.3)
		move_sound:Trigger()
		state = "correct"
		Wait(2.5)
	else
		laser:Move(loc0, 1, "lerp")
		Wait(0.3)
		move_sound:Trigger()
		state = "chair"
		Wait(2.5)
	end

	HideLetterBox()
	Start2dMode()
end