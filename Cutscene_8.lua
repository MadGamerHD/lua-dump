global function Trigger()
	GetActor("doctor"):SetBehaviour("wait")
	GetActor("amy"):SetBehaviour("wait")
	StopMusic()
	FindNodeByName("amb_creaks"):StopTrigger()
	FindNodeByName("amb_lab"):StopTrigger()
	ShowFade()
	Wait(2)
	HideFade()
	FindNodeByName("amb_creaks"):Trigger()
	FindNodeByName("amb_lab"):Trigger()
	FindNodeByName("ActiveCutScene_8"):Trigger()
	FindNodeByName("AutomaticHeavyDoor_0").script.Reset()
end

global function PerformCutscene8()
	local music = FindNodeByName("cs8_music")

	PlayMusic(music)

	ShowLetterBox()

	SayPrep("", "")
	local idles = FindNodeByName("script_dana_idle")
	idles.script.play_idles = false
	idles = FindNodeByName("script_oswald_idle")
	idles.script.play_idles = false
end

global function EndCutscene8()	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("Cutscene8Locator_Doctor")
	local loc2 = FindNodeByName("Cutscene8Locator_Amy")
	local trig0 = FindNodeByName("TriangulateInteract_0")
	local trig1 = FindNodeByName("TriangulateInteract_1")
	local fact0 = FindNodeByName("trig_fact0")
	local fact1 = FindNodeByName("trig_fact1")
	local amb = FindNodeByName("act2_amb_def")

	PlayMusic(amb)
		
	doctor:RemoveInventoryItem(FindNodeByName("mushrooms"))
	doctor:RemoveInventoryItem(FindNodeByName("sprouts"))
	doctor:RemoveInventoryItem(FindNodeByName("oil"))
	
	HideLetterBox()
	
	doctor:Teleport(loc1)
	amy:Teleport(loc2)
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

	fact0:StopTrigger()
	fact1:StopTrigger()
	trig0:Trigger()
	trig1:Trigger()

	FindNodeByName("Act2Progression").script.SetStage_TriangulateSensors()
end
