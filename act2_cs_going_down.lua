global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	SayPrep("skip", "")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	--take cure to Chisholm
	SetGlobalObjectiveState("Cyber_2_6", 3) -- 2 is unlock, 3 is done
	
	--CUT SCENE 9
	--EXT. GSO TOWER
	--The Doctor arrives at the tower with the cure.
	doctor::SID_0307:I've developed a Serum. It will reverse the nano-virus. Please, come down and take it.
	chisholm::SID_0308:Are you sure it will work?
	--Chisholm opens the door .
	chisholm::SID_0309:I've seen what happened to the others. I don't want to end up like that. I'd rather be dead.
	
	--chisholm::SID_0310: I've seen what it did to the others. I don't want to end up that way.
	
	--He takes the serum from the Doctor. Drinks.
	doctor::SID_0311:I can't be sure how long it will take to work. But believe me, you're going to be all right.
	chisholm::SID_0312:Did you find Meadows?
	doctor::SID_0313:Yes. But now she's disappeared.
	chisholm::SID_0314:Had she been infected?
	doctor::SID_0315:Apart from the injured arm she seemed fine. But now I can't find her on the Base. Any idea where she could've gone?
	chisholm::SID_0316:Only the excavation.
	amy::SID_0317:But that's where the Cyberslaves are digging, isn't it? She's got to be mad.
	chisholm::SID_0318:This whole project is hers. This is her team. She would do anything to save them.
	doctor::SID_0319:How do we get to the excavation?
	chisholm::SID_0320: There's a Lift in the Lab.
	doctor::SID_0321: Yes I saw that, but the door had a heavy security lock.
	ShowFade()
	chisholm::SID_0322: I'll get us past that.
	local cutscene = FindNodeByName("Cutscene_9")
	
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Chisholm")
	breath:StopTrigger()
	cutscene:Trigger()
	HideFade()
	
end

global function more_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	
	--INT. CORRIDOR. ACCESS TO EXCAVATION LIFT SHAFT -- DAY
	--CHISHOLM is with THE DOCTOR and AMY.  There's a retinal scanner beside the locked door.
	chisholm::SID_0323:It's a closed environment. There's a retinal scanner to log who goes down there. 
	--Chisholm steps forward.  It scans his eye.
	--The door opens.
	--Chisholm doubles over in pain.  The Doctor catches him.
	doctor::SID_0324:Oh! I don't think you're going any further. Let the Serum do its job. I can handle things from here.
	--And Chisholm stumbles back as the Doctor and Amy get into the lift. 
	--CUT TO
	--INT. LIFT -- DAY
	--The lift door closes on THE DOCTOR and AMY and the lift car starts to drop.
	doctor::SID_0325:Going down for household appliances and homicidal Cybermen.
	amy::SID_0326:Yep. You are so funny.
	--And they've reached the bottom.  The lift doors open.
	
	EndAct()

end
