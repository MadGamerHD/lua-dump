local long_doorcam = FindNodeByName("CutSceneCamera_0")
local med_frontcam = FindNodeByName("CutSceneCamera_1")
local short_backcam = FindNodeByName("CutSceneCamera_2")
local amycam = FindNodeByName("CutSceneCamera_3")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local supreme = GetActor("supreme")
	local doc_rec = FindNodeByName("reciever_doc_loc")
	local amy_rec = FindNodeByName("new_amy_loc")
	local doc_council = FindNodeByName("doctor_council_loc")
	local amy_council = FindNodeByName("amy_council_loc")

	SayPrep("skip", "")		
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	doctor:Teleport(doc_rec)
	amy:Teleport(amy_rec)
	ShowLetterBox()

	long_doorcam:CutTo()
		--CUT SCENE 19
		--INT. RUINED KAALANN. VISUALISER -- DAY
		--THE DOCTOR holds up the completed Vision Disrupter. 
			doctor::SID_0757:There. This will blind the Daleks. But its range is limited. 
	med_frontcam:CutTo()
			doctor::SID_0849:Unless I can fit it into the cradle of the old Emperor. That will take out every Dalek in the chamber.
	amycam:CutTo()
		--As Amy weakens again, turns partially invisible. 
			amy:StartInvisibilityFading(0,5,1,1)
	--As Amy weakens again, turns partially invisible.
			amy::SID_0758:Doctor. I feel so strange. 
	short_backcam:CutTo()
			doctor::SID_0759:I'm sorry, Amy. We're running out of time. We can do this. But it has to be now.

	ShowFade()
	Wait(1)
	doctor:Teleport(doc_council)
	amy:Teleport(amy_council)
	Wait(1)
	HideFade()
	
	amy:StartInvisibilityFading(5,5,1,1)
	
	long_doorcam:CutTo()
	Wait(1)
		--CUT SCENE 19.1
		--CUT TO:
		--INT. RUINED KAALANN. SUPREME COUNCIL CHAMBER -- DAY
		--The Doctor and Amy reach the chamber. The Daleks are gathered around the Eye - now still contained but supported in the magnetic field. 
		--NOTE: This scene is played out in the corridor before they enter (unless there are guards outside?) Gameplay climbing back up removed.
			supreme::SID_0760:Open the Eye.
	med_frontcam:CutTo()
		--And the Eye begins to open.
			doctor::SID_0761:It's now, or never.
	long_doorcam:CutTo()
		--But Amy stands in front of the Doctor.
			amy::SID_0762:There's too many of them, Doctor! They'll exterminate you on sight! Give it to me. 
	short_backcam:CutTo()
		--And Amy starts to turn transparent again...
			amy::SID_0763:I can do this. You have to let me.
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local gens_off = FindNodeByName("gens_off")
	local gens_on = FindNodeByName("gens_on")
	local console_off = FindNodeByShortName("EM_ENTITY_coords_console_off")
	local console_on = FindNodeByShortName("EM_ENTITY_coords_console_on")
	local controls_off = FindNodeByShortName("EM_ENTITY_unit_off:0")
	local controls_on = FindNodeByShortName("EM_ENTITY_unit_on:0")
	local amy_carapace = FindNodeByName("amy_carapace_interact")
	local doc_carapace = FindNodeByName("doc_carapace_interact2")
	local reenter = FindNodeByName("reenter_council_trigger")

	gens_off:StopTrigger()
	gens_on:Trigger()
	console_off:StopTrigger()
	console_on:Trigger()
	controls_off:StopTrigger()
	controls_on:Trigger()
	doc_carapace:StopTrigger()
	amy_carapace:Trigger()
	reenter:Trigger()

	doctor:EnablePhysics()
	amy:EnablePhysics()
	amy:SetBehaviour("pc")
	doctor:SetBehaviour("wait")
	HideLetterBox()	

	amy:StartInvisibilityFading(2,8,1,1)
	
	AddGlobalObjective("Dalek_3_5")
end
