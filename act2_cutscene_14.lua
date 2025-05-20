--14
--played when characters enter lift 
--ends and cut scene continues into council 14.1

global function Start()
	local doctor = GetActor("doctor")
	local music = FindNodeByName("music_14")

	SayPrep("skip", "")	
	ShowLetterBox()
	PlayMusic(music)

	doctor:SetBehaviour("wait")
	
	SetGlobalObjectiveState("Dalek_2_4_1", 3)
	SetGlobalObjectiveState("Dalek_2_4_2", 2)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local emperor = GetActor("emperor")
	local doc_loc = FindNodeByName("DocCouncilPos2")
	local amy_loc = FindNodeByName("AmyCouncilPos2")
	local CouncilArea = FindNodeByTag("Council")
	local idle1 = FindNodeByTag("EmpIdle1")
	local chronon = FindNodeByTag("Chronon")
	local cutscene_14_1 = FindNodeByName("cutscene_14_1")

	chronon:SyncDataFromDef()
	
	doctor:GetTransform():SetNodeParent(CouncilArea)
	amy:GetTransform():SetNodeParent(CouncilArea)

	doctor:Teleport(doc_loc)
	doctor:EnablePhysics()
	amy:Teleport(amy_loc)
	amy:EnablePhysics()
	emperor:PlayAnim(idle1,1,0)
	
	FindNodeByName("lua_transition").script.BlackScreen(2)

	cutscene_14_1:Trigger()
end