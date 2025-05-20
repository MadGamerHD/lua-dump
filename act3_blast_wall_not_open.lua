global played

played = 1

global function Start()
	local doctor = GetActor("doctor")	
	local ControlScript = FindNodeByName("Laser_puzzle_scripts")
	local laser_sound = FindNodeByName("audio_laser_hum")  --2.02s

	ControlScript.script.TurnOffAllControls()
	
	ShowLetterBox()
	
	laser_sound:Trigger()

	SayPrep("skip", "")
	
	if played == 1 then
		played = 2
		--VO
		--laser started 1
			doctor::SID_0480:Woah, this thing is powerful.
	elseif played == 2 then
		played = 3
		--VO
		--laser started 2
			doctor::SID_2308:That's not quite right.
	elseif played == 3 then
		played = 2
		--VO
		--laser started 3
			doctor::SID_2309:I need to align both lasers and both mirrors.
	end
end
			
global function End()
	local ButtonsScript = FindNodeByName("script_button_console")
	local red_button = FindNodeByName("script_red_button")
	local int_amy = FindNodeByName("int_amy")

	int_amy:Trigger()

	HideLetterBox()

	red_button.script.TurnOffAllLasers()
	RunAsync(ButtonsScript, "ZoomIn")
end
