global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	ShowLetterBox()
	doctor:DisableStealth()
	amy:DisableStealth()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")


	HideFade()
	local walk = FindNodeByTag("TheDoctor_Anim_Walk")
	local idle = FindNodeByTag("TheDoctor_Anim_Idle")
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local meadows=GetActor("meadows")
	local doctor_point = FindNodeByName("loc_bcs_doctor1")
	local amy_point = FindNodeByName("loc_bcs_amy1")
	local meadows_point = FindNodeByName("loc_bcs_meadows1")
	doctor:Teleport(doctor_point)
	amy:Teleport(amy_point)
	meadows:Teleport(meadows_point)
	

	--meadows:Teleport(meadows_point)
	Wait(1)
	doctor:PlayAnim(walk,1,0.5)
	Wait(1)
	


	SayPrep("skip","async")
	local amy_point = FindNodeByName("loc_bcs_doctor1")
	amy:SetTarget(amy_point)
	amy:SetBehaviour("move")
	--CUT SCENE 7
	--Meeting meadows
	--THE DOCTOR and AMY come through the door of the laboratory - as hidden PROFESSOR MEADOWS swings at them with an ice axe ! or tries to surprise them anyway...
	amy::SID_0197:Doctor! Look out!
	--But the Doctor easily avoids the ax which embeds in a nearby table. 
	Wait(1)

	amy:SetTarget(doctor)
	amy:SetBehaviour("wait")
	
	SayPrep("","")
	doctor:PlayAnim(idle,1,0.5)

	amy:Face(0.8,"sine")
	--But the Doctor easily avoids the axe which embeds in a nearby table. 
	--wry, to Meadows
	doctor::SID_0198:You don't get many visitors up here, do you?
	doctor:SetTarget(meadows)
	doctor:Face(0.8,"sine")
	meadows::SID_0199:I thought you were one of them! Who are you?
	local amy_point = FindNodeByName("loc_bcs_amy2")
	amy:SetTarget(amy_point)
	amy:SetBehaviour("move")
	--The Doctor has moved across to a piece of kit - there's a flashing light on it - an emergency beacon.
	doctor::SID_0200:This is Amy, and I'm the Doctor. We answered your distress beacon.  
	amy:SetTarget(meadows)
	amy:SetBehaviour("wait")
	amy:Face(0.8,"sine")
	meadows::SID_0201:Thank God. My name's Elizabeth Meadows. I've been barricaded in here for days. 
	amy::SID_0806: It's all right. The Doctor will be able to help. 
	--she notes the sling.
	amy::SID_0202:What happened to your arm?
	--The Doctor is taking in the lab.  Examining bits and pieces, maybe looking for clues...
	meadows::SID_0203:I fell and hurt it running away from those things... They're everywhere.
	amy::SID_0204:You mean the Cybermats?
	meadows::SID_0205:They bite. Inject a nano-virus that converts flesh and bone into living machinery. 
	--As the Doctor stops by  a cabinet.  We don't see what's in there.  Yet.  But he's taken with it.
	amy::SID_0206:Cyberslaves. But slaves to who?
	--As the Doctor points to the Cyberman's arm from the cabinet, almost triumphant.
	doctor::SID_0209:To the Cybermen, of course. Where did you find this?
	meadows::SID_0210:We're a geological survey. It must've been under the ice for ten thousand years.
	--The Doctor is fascinated by the arm - and by what he's hearing.
	doctor::SID_0211:Amazing.  
	amy::SID_0212:So who are the Cybermen?
	doctor::SID_0213:Cybernetic bodies with living brains. Brains surgically removed from those they conquer. 
	--*EDIT split up previous line into two
	doctor::SID_1021: Stripped of everything but the urge to kill, and convert more like themselves.
	amy::SID_0214:And they've been under the ice ten thousand years?
	--The Doctor turns to them, full of urgency.
	doctor::SID_0215:Apparently. And the Cybermats have been converting a small army of slaves to dig them out. Is that right, Professor?
	meadows::SID_0216:Yes. I've been trying to develop an antidote. Something that will reverse the nano-virus. Make my team human again.
	--The Doctor glances down Meadows' microscope.
	doctor::SID_0217:You're very good. But it won't work. We need a sample of the virus in its pure form.
	--*EDIT split up previous line into two	
	doctor::SID_1022:You stay here Professor and do what you can. Amy, we're going to catch ourselves a Cybermat.
	--And the Doctor is out of there, followed by Amy. 
end

global function end_cutscene()
	local cyberslave = GetActor("cyberslave1")
	local loc = FindNodeByName("loc_csc_cyberslave")
	cyberslave:Teleport(loc)
	
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	doctor:EnableStealth()
	amy:EnableStealth()

	--talk to meadows
	SetGlobalObjectiveState("Cyber_2_3_3", 3) -- 2 is unlock, 3 is done
	SetGlobalObjectiveState("Cyber_2_3_1", 3) -- 2 is unlock, 3 is done
	--Create a serum
	AddGlobalObjective("Cyber_2_4")
	--Find the cybermat nest
	SetGlobalObjectiveState("Cyber_2_4_1", 2) -- 2 is unlock, 3 is done
	--Find a weapon to use on the mats
	SetGlobalObjectiveState("Cyber_2_4_2", 2) -- 2 is unlock, 3 is done
	--Dispatch the cybermats
	SetGlobalObjectiveState("Cyber_2_4_3", 2) -- 2 is unlock, 3 is done
	--salvage a cybermat part
	SetGlobalObjectiveState("Cyber_2_4_4", 2) -- 2 is unlock, 3 is done

	--analyse part
	--SetGlobalObjectiveState("Cyber_2_4_6", 2) -- 2 is unlock, 3 is done


end
