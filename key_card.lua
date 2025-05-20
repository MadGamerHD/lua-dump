global script_node
global vent_id

	global doc_cam 
	global amy_cam 
	global cam2
	global cam1
	global key_card 
	global doc_point
	global amy_point
	global slave_point

doc_cam = FindNodeByName("CutSceneCamera_1")
amy_cam = FindNodeByName("CutSceneCamera_2")

global function run_cutscene_die()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cyberslave0=GetActor("cyberslave0")
	
	ShowLetterBox()
	amy:SetBehaviour("wait")
	
WaitFrame()
	
	if(vent_id == 2) then 
		amy_cam:CutTo()
		key_card = FindNodeByName("key_card_3d_2")
		doc_point = FindNodeByName("loc_cs6_15_doc2")
		amy_point = FindNodeByName("loc_cs6_15_amy2")
		slave_point = FindNodeByName("loc_cs6_15_slave2")
		cam2 = FindNodeByName("CutSceneCamera_3")
		cam1 = amy_cam
	else
		doc_cam:CutTo()
		key_card = FindNodeByName("key_card_3d_1")
		doc_point = FindNodeByName("loc_cs6_15_doc1")
		amy_point = FindNodeByName("loc_cs6_15_amy1")
		slave_point = FindNodeByName("loc_cs6_15_slave1")
		cam2 = FindNodeByName("CutSceneCamera_4")
		cam1 = doc_cam
	end
	doctor:SetBehaviour("pc")
	ResetPlayerCamera()
	doctor:SetBehaviour("wait")
--EM_ANIMATOR_TheDoctor_Anim_DRW_ClimbUp1m
	--cyberslave:StopTrigger()
	--key_card:Trigger()
	local music = FindNodeByName("music_shock_2_5s")
	PlayMusic(music)

	SayPrep("skip", "")
	cyberslave0:SetBehaviour("wait")
	cyberslave0:Teleport(slave_point)
	cyberslave0:Die("electric")
	local sleeping_giant = FindNodeByName("script_cyberslave0")
	sleeping_giant.script.died_already = true
	
	amy:SetTarget(amy_point)
	Wait(0.5)
	amy:SetBehaviour("move")
	amy:SetMoveTime(3)
	Wait(2)
	doctor:SetTarget(doc_point)
--	doctor:SetMaxSpeed(3)
--	doctor:SetBehaviour("move")

	doctor:Face(1,"sine")
	
	--CUT SCENE 6.15
	--small exchange about the cyberslave they have just knocked out with the steam.
	--knocking out slave
	--HINT
	amy::SID_0451: Hah! Take that!
	local music = FindNodeByName("background_music")
	PlayMusic(music)
	doctor:SetBehaviour("pc")
	--HINT
	--small exchange about the cyberslave they have just knocked out with the steam.
	doctor::SID_1583:Well done, Amy.
	
	HideLetterBox()
	local slave = FindNodeByName("int_cyberslave0")
	slave:Trigger()
	
	--block the flow of the steam vent
	SetGlobalObjectiveState("Cyber_2_2_2", 3) -- 2 is unlock, 3 is done
	--Steam the cyberslave
	SetGlobalObjectiveState("Cyber_2_2_3", 3) -- 2 is unlock, 3 is done
	
	--Search the body of the cyberslave
	SetGlobalObjectiveState("Cyber_2_1_1", 2) -- 2 is unlock, 3 is done
	
	SaveCheckpoint()
end



global function run_cutscene_search_slave()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	cam1:CutTo()
	amy:Teleport(amy_point)
	ShowLetterBox()
	doctor:SetTarget(doc_point)
	doctor:SetMaxSpeed(1)
	doctor:SetBehaviour("move")
	Wait(1)
	SayPrep("skip", "")
	amy:SetFocus(doctor)
	--HINT
	doctor::SID_0159: Let's see if we can learn a bit more about this fellow.
	doctor:SetBehaviour("wait")
	Wait(0.1)
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")
	--local anim = FindNodeByTag("TheDoctor_Anim_Interact_Floor")
	doctor:PlayAnim(anim, 1, 0.1)
	doctor:DisableAnimLoop()
	--anim interact ground
	Wait(2)
	doctor:SetFocus(slave_point)
	--HINT
	doctor::SID_0160: This Keycard says it belongs to Alan Watts. I imagine that's who he used to be.
	doctor:SetBehaviour("wait")
	cam2:CutTo()
	--HINT
	amy::SID_0161: Used to be?
	doctor:ClearFocus()
	WaitFrame()
	anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2") -- 4.0s
	--finger in forehead
	doctor:PlayAnim(anim, 1, 0.5)
	SayPrep("", "async")
	doctor:SetFocus(amy)
	doctor:SetTarget(amy)
	doctor:Face(0.8,"sine")
	local keycard = FindNodeByName("key_card")
	doctor:AddInventoryItem(keycard)
	
	--HINT
	doctor::SID_0162: The Cybermat Nanoforms have done their work. Nothing really left of Alan here. Poor chap.





end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local int_examine = FindNodeByName("int_cyberslave0")
	
	int_examine:Trigger()
		
	HideLetterBox()
	doctor:ClearFocus()
	amy:ClearFocus()
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	

	--Search the body of the cyberslave
	SetGlobalObjectiveState("Cyber_2_1_1", 3) -- 2 is unlock, 3 is done
	--Use Keycard on door
	SetGlobalObjectiveState("Cyber_2_1_2", 2) -- 2 is unlock, 3 is done
end

global function Trigger()
	local doctor=GetActor("doctor")
	local keycard = FindNodeByName("key_card")
	doctor:AddInventoryItem(keycard)
end
