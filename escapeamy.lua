lobal script_node

global function AmyOntoLadder()
	local amy = GetActor("amy")
--	local amy_onto_ladder = FindNodeByPartialName("Anim_AMY_OntoLadder")
	amy:DisableWalls()
--	amy:PlayAnim("amy_onto_ladder",1,0)
	amy:SetCallback(script_node, "AmyClimbLadder")
end

global function AmyClimbLadder()
	local amy = GetActor("amy")
--	local amy_climb_ladder = FindNodeByPartialName("Anim_AMY_ClimbLadder")
--	amy:PlayAnim("amy_climb_ladder",1,0)
end

global function DoctorOntoLadder()
	local doctor = GetActor("doctor")
--	local doctor_onto_ladder = FindNodeByPartialName("Anim_DRW_OntoLadder_IntoLookBehind")
	doctor:DisableWalls()
--	doctor:PlayAnim("doctor_onto_ladder",1,0)
end