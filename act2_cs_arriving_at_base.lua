global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	local walk = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_StepFwd")
	local idle = FindNodeByPartialName("Anim_DRW_Idle01")
	Wait(1)
	SayPrep("skip","async")
	--doctor::[LOUD SOUND OF TARDIS ARRIVING]
	Wait(6)
	local doctor_point=FindNodeByName("loc_acs_doctor1")
	doctor:Teleport(doctor_point)	
	local amy_point=FindNodeByName("loc_acs_amy1")
	amy:Teleport(amy_point)
	SayPrep("skip","")
	
	--CUT SCENE 6
	--EXT. SURVEY OUTPOST  DAY
	--The Geological Survey Outpost.  Cold.  Sinister.  Inhospitable. Apparently deserted.
	--A board names it: ARCTIC GEOLOGICAL SURVEY BASE, ZEBRA BAY.
	--The TARDIS materializes within the quadrant of pre-fabricated buildings, snowcats, and a watchtower.
	--THE DOCTOR and AMY step out of the TARDIS.
	amy::SID_0165:Doctor, did you ever see The Thing?
	doctor:PlayAnim(walk,1,0.5)
	doctor:DisableAnimLoop()
	SayPrep("","async")
	doctor::SID_0166:The Carpenter, Kurt Russell Thing or the Howard Hawks Thing-y with the walking carrot?  
	
	
	
	Wait(0.6)
	--doctor:PlayAnim(idle,1,0.5)
	Wait(3.5)
	doctor:SetTarget(amy)
	doctor:Face(2,"sine")
	SayPrep("skip","")
	
	--*NOTE - this line doesn't belong here - MF.
	--*EDIT  - THis is already part of the line (0166) so has to be here. (I just had to cut it in two as it was too long)
	doctor::SID_0908: Not sure I see your point, anyway.
	Wait(1)
	amy:SetTarget(doctor)
	amy:Face(2,"sine")
	Wait(3)
end
	
global function run_cutscene2()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	local walk = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_StepFwd")
	local idle = FindNodeByPartialName("Anim_DRW_Idle01")
	local chisholm_point=FindNodeByName("loc_asc_chisholm1")
	chisholm:Teleport(chisholm_point)
	--As CHISHOLM stumbles out of the TARDIS...dwd
	Wait(0.2)
	SayPrep("skip", "")
	--doctor::SID_0167:Ah, Mr. Chisholm...
	doctor:SetTarget(chisholm)
	doctor:Face(0.5,"sine")
	SayPrep("","async")
	Wait(1)
	
	--CUT SCENE 6
	--EXT. SURVEY OUTPOST -- DAY
	--As CHISHOLM stumbles out of the TARDIS...
	chisholm::SID_0168:You brought me back! They'll get us all!
	doctor:Face(0.5,"sine")
	Wait(1)
	amy:SetTarget(chisholm)
	amy:Face(0.5,"sine")
	Wait(1)
	SayPrep("skip","")
	--The Doctor tries to calm him...
	doctor::SID_0169:I give you my word. I'll protect you... Whatever happened here, I can help. I promise.
	doctor:Face(0.5,"sine")
	
	doctor:PlayAnim(walk,1,0.5)
	doctor:DisableAnimLoop()
	--Wait(0.5)
	--doctor:PlayAnim(idle,1,0.5)
	chisholm:SetTarget(doctor)
	chisholm:Face(0.5,"sine")
	SayPrep("","")
	chisholm::SID_0170:How? They got everybody, they changed them!
	amy:Face(0.5,"sine")
	amy::SID_0171: Into what?
	chisholm::SID_0172:Like robots... Slaves... Cyberslaves.
	Wait(1)
	doctor::SID_0173:Cyberslaves?
	-- And something is crawling up unaware Chisholm's back, a CYBERMAT. 
	--Chisholm screams out as the Cybermat bites his neck.
	chisholm::SID_0805: Argh!
	
	

end
global function run_cutscene3()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	doctor:SetTarget(amy)
	doctor:Face(0.3,"sine")
	SayPrep("skip", "")
	
	--CUT SCENE 6.02
	--EXT. SURVEY OUTPOST -- DAY
	--Then hurls the cybermat at the ground - near Amy.
	--The Doctor throws himself at Amy -
	doctor::SID_0174:AMY! GET OUT OF THE WAY!

	--But the cybermat runs away.  Fast.  Under the base buildings. 
	amy::SID_0175:What was that?
	doctor::SID_0176:A Cybermat. 
	amy::SID_0177:If that's anything like a mousemat, it didn't look like one.
	doctor::SID_0178:Weird. I've seen them kill people before, but never turn people into... robots. That's new. That's fascinating. Why would they do that?
	
	doctor:SetTarget(chisholm)
	doctor:Face(0.8,"sine")
	--Chisholm, staggers back, his hand to his wounded neck...
	doctor::SID_0179:Let me take a look.
	local chisholm_point=FindNodeByName("loc_acs_chisholm2")

	chisholm::SID_0180:No! Get away! Get away from me! And get out of here!
	chisholm:SetTarget(chisholm_point)
	chisholm:Face(1,"sine")
	doctor::SID_0181:You have to let me help you.
	--But Chisholm throws the Doctor aside with almost supernatural strength. 
	chisholm::SID_0182:It's too late for me, now!
	
	chisholm:SetTarget(chisholm_point)
	chisholm:SetMaxSpeed(1.5)
	chisholm:SetBehaviour("move")
	Wait(1.5)
	chisholm_point=FindNodeByName("loc_acs_chisholm3")
	chisholm:SetTarget(chisholm_point)
	chisholm:SetMaxSpeed(1.5)
	--chisholm:SetBehaviour("move")
	Wait(1.5)
	amy:SetTarget(doctor)
	amy:Face(1,"sine")
	
	local positiona=FindNodeByName("tower_door_posa")
	local door=FindNodeByName("door_prop")
	door:Move(positiona, 2, "lerp")


	--And Chisholm runs for the watchtower as Amy goes to the Doctor.
	amy::SID_0183:What's going on here?
	chisholm_point=FindNodeByName("loc_acs_chisholm4")
	chisholm:Teleport(chisholm_point)
	chisholm:Sleep()

	local doctor_point=FindNodeByName("mat_hole1")
	doctor:SetTarget(doctor_point)
	doctor:Face(0.8,"sine")
	--The Doctor gets up dusting himself off - as Chisholm shuts himself off in the watchbtower...
	--The Doctor looks from the watchtower to the main base buildings.
	doctor::SID_0184:I think the answer to that is in there.
	door:MoveToOrigin(2, "lerp")
	
	chisholm_point=FindNodeByName("loc_acs_doctor2")
	doctor:SetTarget(chisholm_point)
	doctor:SetMaxSpeed(1.5)
	doctor:SetBehaviour("move")
	
	--And he heads towards the buildings.  Amy follows.
	amy::SID_0185:Yeah. Of course. It would be.
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	
	--adds new objective
	--Get into the base
	AddGlobalObjective("Cyber_2_1")

	--Sub objective
	--Search the body of the cyberslave - hidden, not turned on yet
	--SetGlobalObjectiveState("Cyber_2_1_1", 2) -- 2 is unlock, 3 is done
	--Use keycard on door - hidden, not turned on yet
	--SetGlobalObjectiveState("Cyber_2_1_2", 2) -- 2 is unlock, 3 is done
end
