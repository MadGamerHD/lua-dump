global script_node

local tube_state
tube_state = 0

global function Trigger()
	
	print("Crack the tube! ", "\n")
	
	if(tube_state == 0)then
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")
		local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
		tube_state = 1
	end
	if(tube_state == 1)then
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")
		local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
		tube_state = 2
	end
	if(tube_state == 2)then
		local doorOpenAnim = FindNodeByTag("Green_Door_Open")
		local doorProp = script_node:FindNodeByTag("Green_Door_Prop")
		doorProp:PlayAnim(doorOpenAnim, 1, 0.01)
		tube_state = 3
	end
end
