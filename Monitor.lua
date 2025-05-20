global script_node
global PlayedCut4
global first

PlayedCut4 = 0
first = 0

global function ReachedMonitor()
	local Cut_4 = FindNodeByName("Cut_4")
	Cut_4:Trigger()
end

global function Hint()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local waypoint = FindNodeByName("MonitorMoveTo")
	local hint = QueryObjective(0)                 
	local hint1 = QueryObjective(1)     
	local stairs = FindNodeByName("Stairs1CutSceneScript")

	SayPrep("skip","")

	--If player needs to use monitor and does, it incements the hint.
	if stairs.script.monitor_ready then
		--Speak to the Doctor on the Monitor (done)
		SetGlobalObjectiveState("Objective_1_2_1", 3)
		--note: next one added after cut scene 4
	end

	print(hint)
	print(hint1)

	if (hint == "hint_1_1") then
		--Hint 
		--Amy tries to get a hint from the doctor before the air bubble is extended
			amy::SID_1863:He can't breathe; I've got to be quick! I need to use the Red Levers on the console.
	elseif(hint == "hint_1_2_3") or (hint1 == "hint_1_2_3") then	
		--Hint 
		--Amy trys to talk to the doctor before she has discoverd she is stuck in the control room.
			doctor::SID_1511:What are you waiting for? You need to get upstairs to the Drawing Room.
	elseif(PlayedCut4 == 0 and hint == "hint_1_2") then
		PlayedCut4 = 1
		
		amy:SetTarget(waypoint)
		amy:SetMoveTime(1.5)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node,"ReachedMonitor")
	elseif (PlayedCut4 == 1 and hint == "hint_1_2")then
		--Hint 
		--Amy tries to get a hint for the lever puzzle.
			doctor::SID_1808:On the Mechanical Console: any levers and handles that you can move, make them point upwards.
	elseif( hint1 == "hint_1_3_1" ) or ( hint1 == "hint_1_3_2" )then
		--Hint 
		--Amy returns to the control room before finding the laser screwdriver
			doctor::SID_2419:Have you searched everything in the Drawing Room?
	elseif (hint1 == "hint_1_4_1" ) then
		--Amy speaks to the Doctor to find out what todo next after returning from the drawing room with the laser screwdriver
		if first == 0 then
			--Hint 
			--Amy is trying to to figure out what todo with the screwdriver
				amy::SID_2420:Doctor, I've found this Laser Screwdriver thingy, what do I do with it?
				doctor::SID_1784:Excellent, right, now you need to go to the console nearest the door, insert the Laser Screwdriver into the slot, and push the button.
			
			first = 1
		else
			--Hint about laser screw (second)
				amy::SID_2473:Doctor, tell me again, what do I do with this Laser Screwdriver?
				doctor::SID_2474:Just insert it into the console nearest the door, aim it and press fire.
		end
	elseif ( hint1 == "hint_1_4_2" ) then
		--Hint
		--Amy has inserted laser screwdriver into slot
			doctor::SID_1814:Make sure it's pointing in the right direction! We don't want anything else to go wrong...
	end
end

global function Interact()
	Hint()
end

global function Use()
end
