global script_node

global PlayedCut4

PlayedCut4 = 0

global function Hint()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)                 
	local hint1 = QueryObjective(1)    
	
	SayPrep("skip","")
	
	if (hint == "hint_1_1") then
		--VO 
		--Amy tries to get a hint from the doctor before the air bubble is extended
			amy::SID_2161:He can't breathe, I need to help him quick! I need to pull the red levers on the console.
	elseif(hint == "hint_1_2"  or hint1 == "hint_1_3_3" or hint1 == "hint_1_4_1") then	
		--VO 
		--Amy trys to talk to the doctor before she has discoverd she is stuck in the control room.
			amy::SID_2163:I need to rescue the Doctor before the TARDIS slips into another riptide pocket.
	else
		--VO
		--Amy looks out the door while trying to solve the lever puzzle
			amy::SID_2162:Yup, he's still there. Come on Amy, hurry up!
	end
end

global function Interact()
	Hint()
end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end

