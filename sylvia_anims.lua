global script_node

global function IntoPlunge()
	local sylvia = GetActor("sylvia")
	local sylvia_intoplunge = FindNodeByPartialName("Anim_SYL_RunIntoPlunge")
	sylvia:PlayAnim(sylvia_intoplunge,1,1)
	sylvia:SetCallback(script_node,"PlungeIdle")
end

global function PlungeIdle()
	local sylvia = GetActor("sylvia")
	local sylvia_plungeidle = FindNodeByPartialName("Anim_SYL_PlungePoseIdle")
	sylvia:PlayAnim(sylvia_plungeidle,1,1)
end