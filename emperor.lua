global script_node

global function ReturnToIdle()
	local emperor = GetActor("emperor")
	local idle1 = FindNodeByTag("EmpIdle1")
	emperor:PlayAnim(idle1,1,0)
end