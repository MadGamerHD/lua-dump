--14.1
--played after cutscene 14.05
--ends and enters dialogue 14.2

global function Start()
	local music = FindNodeByName("14_1_music")
	local emperor = GetActor("emperor")
	
	emperor:DisablePhysics()
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_loc = FindNodeByName("DocCouncilPos2")
	local amy_loc = FindNodeByName("AmyCouncilPos2")
	local CouncilArea = FindNodeByTag("Council")
	local cutscene_14_2 = FindNodeByName("cutscene_14_2")
	local chronon = FindNodeByTag("Chronon")

	chronon:SyncDataFromDef()
	
	doctor:GetTransform():SetNodeParent(CouncilArea)
	amy:GetTransform():SetNodeParent(CouncilArea)
	doctor:Teleport(doc_loc)
	doctor:EnablePhysics()
	amy:Teleport(amy_loc)
	amy:EnablePhysics()

	FindNodeByName("lua_transition").script.BlackScreen(2)
	
	cutscene_14_2:Trigger()
end