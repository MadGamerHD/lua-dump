global script_node
global state
global first
state = "chair"

global function Comment()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	SayPrep("skip", "async")

	--VO
	--EDIT - used to be HINT (changed for continuity with other VO)
	--laser interact
		doctor::SID_0478:These lasers are used for making precision cuts on the victims.

	--REDUNDANT
	--laser interact
		--amy::SID_0479: Tell me about it. I was staring right into it.
end

global function Interact()
	local doctor = GetActor("doctor")
	
	if(first == nil) then
		first = 1
		local mirror1=FindNodeByName("script_laser1")
		local mirror2=FindNodeByName("script_laser2")
		mirror1.script.first=1
		mirror2.script.first=1
		Comment()
	end
	
	if(state == "chair") then
		local laser = script_node:FindProp()
		local loc = FindNodeByName("loc_laser0")
		laser:Move(loc, 1, "lerp")
		state = "correct"

	else
		local laser = script_node:FindProp()
		local loc = FindNodeByName("loc_laser0")
		laser:MoveToOrigin(1, "lerp")
		state = "chair"
	end
end
