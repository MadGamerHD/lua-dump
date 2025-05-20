global script_node
global state
global first

state = "chair"

global function Interact()
	local doctor = GetActor("doctor")
	if(first == nil) then
		first = 1
		local mirror1=FindNodeByName("script_mirror0")
		local mirror2=FindNodeByName("script_mirror1")
		mirror1.script.first=1
		mirror2.script.first=1
		mirror1.script.Comment()
	end
	
	if(state == "chair") then
		local laser = script_node:FindProp()
		local loc = FindNodeByName("loc_mirror2")
		laser:Move(loc, 1, "lerp")
		state = "correct"
		doctor::[SUCCESS SOUND]
	else
		local laser = script_node:FindProp()
		local loc = FindNodeByName("loc_mirror2")
		laser:MoveToOrigin(1, "lerp")
		state = "chair"
		
	end
end