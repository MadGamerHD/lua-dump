global script_node
global function Interact()

	local prop = script_node:FindProp()
	local open = script_node:FindNodeByTag("open")
	local int = script_node:FindNodeByTag("int")
	
	prop:Move(open,1,"sine")
	int:StopTrigger()

end