global script_node

global function run_cutscene()
	ShowLetterBox()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	local doc_point = FindNodeByName("loc_cs3_1_doc1")
	doctor:Teleport(doc_point)
	local doc_script = FindNodeByName("lua_doctor_dialogue:0")
	RunAsync(doc_script,"DeathByFalling")
	local anim = FindNodeByPartialName("Anim_DRW_Fall_and")

	doctor:PlayAnim(anim,1,0)	
--	doctor:SetCallback(script_node, "restart")
--end

--global function restart()
	Wait(1.8)

	local doc_point = FindNodeByName("loc_cs3_1_doc2")
	ShowFade()
	Wait(3)
	doctor:Teleport(doc_point)
	doctor:EnablePhysics()
	doctor:SetBehaviour("pc")
	ResetPlayerCamera()
	HideFade()
	HideLetterBox()
end

global function Trigger()

	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:DisablePhysics()
	local doc_point = FindNodeByName("loc_cs3_1_doc1")
	doctor:Teleport(doc_point)
	local anim = FindNodeByPartialName("Anim_DRW_Fall_and")

	doctor:PlayAnim(anim,1,0)	

end