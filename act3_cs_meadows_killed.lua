global function run_cutscene()
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	local meadows=GetActor("meadows")
	local cyberleader=GetActor("cyberleader")
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	--CUT SCENE 12
	--INT. CONTROL ROOM -- DAY
	--The CYBERLEADER is activated.  THE DOCTOR steps back, horrified - but trying to work out his next step.
	--MEADOWS approaches the CYBERLEADER. 
		meadows::SID_0341:Lord, I have reactivated you!
	--The Cyberleader regards her coldly.
		cyberleader::SID_0342:Your protocol has been successful. Now you will be deleted.
	--The Cyberleader aims his weapon at Meadows - she is suddenly terrified.
		meadows::SID_0343:But I gave you life!
		cyberleader::SID_0344:Your continued function is unnecessary.
		doctor::SID_0345:No! You don't have to kill her!
		cyberleader::SID_0346:Cybermen do not require Cyberslaves. Cybermen are superior...  to all.
	-- And the Cyberleader fires at Meadows. Killing her.
	-- The Doctor takes his chance to escape.
	-- As more CYBERMEN wake from cryo-stasis.
end

global function end_cutscene()
	local doctor=GetActor("doctor")
	local doctor_point=FindNodeByName("loc_cse_doctor1")

	HideLetterBox()
	
	doctor:Teleport(doctor_point)
	doctor:SetBehaviour("pc")
	
	--Wake the cybermen
	SetGlobalObjectiveState("Cyber_3_3", 3) -- 2 is unlock, 3 is done
	--Rescue Amy
	AddGlobalObjective("Cyber_3_4")
	--Locate the conversion chamber
	SetGlobalObjectiveState("Cyber_3_4_1", 2) -- 2 is unlock, 3 is done
	--Sneak past the patrolling cyberslaves
	SetGlobalObjectiveState("Cyber_3_4_2", 2) -- 2 is unlock, 3 is done
	--release Amy from the chair
	SetGlobalObjectiveState("Cyber_3_4_3", 2) -- 2 is unlock, 3 is done
end