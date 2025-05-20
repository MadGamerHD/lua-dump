global DoneFirstTime

global function Trigger()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	--local rec_doc_loc = FindNodeByName("reciever_doc_loc")
	
	SayPrep("skip", "")
	amy:EnableStealth()

	if not DoneFirstTime then
	--VO
	--Trigger plane on entry to production facility
		amy::SID_0746:The Daleks are all over the building already. I need to be careful.
	
	amy:StartInvisibilityFading(3,3,1,1)
	--doctor:Teleport(rec_doc_loc)
	DoneFirstTime = true
	SetGlobalObjectiveState("Dalek_3_4_1", 3)
	
	SaveCheckpoint()
	end
end
