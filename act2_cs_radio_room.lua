global script_node


global function Trigger()
	local doctor=GetActor("doctor")
	local doc_point=FindNodeByName("loc_csc_DocToLab")
	doctor:Teleport(doc_point)

	local mat_part=FindNodeByName("cybermat_part")
	doctor:AddInventoryItem(mat_part)

end


global function run_part_1()


	ShowLetterBox()

	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	ShowFade()
	
	
	--local meadows = FindNodeByTag("meadows")
	--meadows:StopTrigger()
	
	Wait(1.0)
	local cyberslave = GetActor("cyberslave1")
	local loc = FindNodeByName("loc_csc_cyberslave")
	cyberslave:Teleport(loc)
	local doctor_point=FindNodeByName("loc_csc_doctor1")
	local amy_point=FindNodeByName("loc_csc_amy1")
	doctor:Teleport(doctor_point)
	amy:Teleport(amy_point)
	
	local door = FindNodeByName("int_radio_door")
	door:StopTrigger()
	
	HideFade()
	SayPrep("skip","")
	Wait(1)
	doctor::   [CRASH]
	
	--Dispatch the cybermats
	SetGlobalObjectiveState("Cyber_2_4_3", 3) -- 2 is unlock, 3 is done

	doctor_point=FindNodeByName("loc_csc_doctor2")
	doctor:SetTarget(doctor_point)
	doctor:Face(0.5,"lerp")
	
	--CUT SCENE 8
	--AMY yells as she crashes through the ceiling into the radio room.
	--INT. CORRIDOR  DAY
	--THE DOCTOR bangs on the radio room door -
	doctor::SID_0288:Amy?! 

	
	--CUT TO
	--INT. RADIO ROOM -- DAY
	--AMY is still on the floor, but dusting herself off - she's okay.
	amy::SID_0289:It's all right. I'm fine.
	--doctor_point=FindNodeByName("loc_csc_doctor2")
	doctor_point=FindNodeByName("loc_cs8_doc1")
	
	doctor:Teleport(doctor_point)
	Wait(4)
	--Then she gets up - and sees a CYBERSLAVE standing there.
	amy::SID_0290:Then again, maybe not!
	cyberslave:SetBehaviour("patrol")
	cyberslave:EnableSensors()

end

global function end_cutscene()
	local amy = GetActor("amy")

	HideLetterBox()
	amy:SetBehaviour("pc")
end




