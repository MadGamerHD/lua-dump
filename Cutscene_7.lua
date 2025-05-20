global function PerformCutscene7()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("cs7_music")

	PlayMusic(music)
	
	ShowLetterBox()
	HideFade()

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	SayPrep("skip", "")
	local generator = FindNodeByName("audio_generator_springs_to_life")
	generator:Trigger()
end

global function EndCutscene7()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("cs7_doc_loc")
	local loc2 = FindNodeByName("cs7_amy_loc")
	local amb = FindNodeByName("act2_amb_def")
	local gen_amb = FindNodeByName("amb_gen")

	PlayMusic(amb)
	gen_amb:Trigger()	
		
	doctor:Teleport(loc1)
	amy:Teleport(loc2)
	
	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	--FindNodeByName("TriggerCutscene7a"):EnableNode()
	FindNodeByName("Door1Script_2").script.DoorOpen() -- doc is inside of door trigger!
	FindNodeByName("Act2Progression").script.SetStage_ReturnToAssemblyHall()
end