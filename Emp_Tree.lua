local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
local DocCam = FindNodeByName("CutSceneCamera_1")
local AmyCam = FindNodeByName("CutSceneCamera_2")
local EmpCam = FindNodeByName("CutSceneCamera_3")
local WideCam = FindNodeByName("CutSceneCamera_4")
local time_done
local stop_done
local power_done

global script_node

global function Start()
	local cutscene_14_2= FindNodeByName("cutscene_14_2")
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")	
	local emperor = GetActor("emperor")
	local temp_dalek1 = FindNodeByTag("temp_dalek1")
	local temp_dalek2 = FindNodeByTag("temp_dalek2")
	local music = FindNodeByName("music_14_2")
	local emp_loc = FindNodeByName("EmpLoc")
	local doc_loc = FindNodeByName("DocCouncilPos2")
	local amy_loc = FindNodeByName("AmyCouncilPos2")	
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles:Wake()
	amy_idles:Wake()

	--TEMP
	doctor:Teleport(doc_loc)
	amy:Teleport(amy_loc)
	
	SayPrep("skip", "")

	PlayMusic(music)

	doctor:SetFocus(emperor)
	doctor:DisableStealth()
	amy:SetFocus(emperor)
	amy:DisableStealth()
	temp_dalek1:Trigger()
	temp_dalek2:Trigger()
	emperor:DisablePhysics()
	emperor:Teleport(emp_loc)
	
	cutscene_14_2:PauseAt(0.1)
	
	DocCam:CutTo()

	--NEW
	--VO
	--Dialogue tree prompt
		doctor::SID_1294:I should ask a question...
	
	Wait(0.5)
	DecisionManager:AddOption("", "DIALOGUE_TIME", script_node, "DialogTime")
	DecisionManager:AddOption("", "DIALOGUE_STOP", script_node, "DialogStop")
	DecisionManager:AddOption("", "DIALOGUE_POWER", script_node, "DialogPower")
	DecisionManager:Start()
end

global function DialogTime()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local emperor = GetActor("emperor")
	local empIdle1 = FindNodeByTag("EmpIdle1")
	local doc_talk1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")

	doc_idles:Sleep()
		
	time_done = true

	SayPrep("skip", "")
	
	DocCam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk1 , 1, 1, 1)
	emperor:PlayAnim(empIdle1,1,1)
	--CUT SCENE 14.2
	--DIALOGUE TREE
	--Dialogue options: The more questions and answers we can add the better - this area needs expanding...
	--perhaps amalgamating the following cut scene?
	--Option 1) TIME!
		doctor::SID_0674:Have you got the first idea of what will happen if you carry on disrupting the time continuum?
	WideCam:CutTo()
		emperor::SID_0675:Daleks will be the masters of time and the universe.
	DocCam:CutTo()
	doc_idles:Wake()
	
	if not stop_done then
		DecisionManager:AddOption("", "DIALOGUE_STOP", script_node, "DialogStop")
	end
	if not power_done then
		DecisionManager:AddOption("", "DIALOGUE_POWER", script_node, "DialogPower")
	end
	DecisionManager:AddOption("", "DIALOGUE_REVEAL", script_node, "DialogReveal")
	DecisionManager:Start()
end

global function DialogStop()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local emperor = GetActor("emperor")
	local empIdle2 = FindNodeByTag("EmpIdle2")
	local empScrip = FindNodeByName("EmpAnimScript")
	local doc_talk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")	
	local doc_talk3 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3")	
	local doc_anim2 = FindNodeByPartialName("Anim_DRW_TalkConcern1")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")

	doc_idles:Sleep()
	
	stop_done = true

	SayPrep("skip", "")
	
	DocCam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk2 , 1, 1, 1)
	--Option 2) STOP!
		doctor::SID_0676:You have to stop. The Laws of Time can't be manipulated on such a massive scale.
	EmpCam:CutTo()
	emperor:PlayAnim(empIdle2,1,0)
	emperor:SetCallback(empScrip, "ReturnToIdle")
		emperor::SID_0677:The Laws of Time are controlled by the Daleks.
	DocCam:CutTo()
	doctor:PlayAnimBlendOut(doc_talk3 , 1, 0, 1)	
		doctor::SID_0956:No! They're too powerful for anyone to control. You carry on ignoring them and time will fold in on itself.
		doctor::SID_0957:You will destroy the Daleks - and everything else.
	
	doc_idles:Wake()

	if not time_done then
		DecisionManager:AddOption("", "DIALOGUE_TIME", script_node, "DialogTime")
	end
	if not power_done then
		DecisionManager:AddOption("", "DIALOGUE_POWER", script_node, "DialogPower")
	end
	DecisionManager:AddOption("", "DIALOGUE_REVEAL", script_node, "DialogReveal")
	DecisionManager:Start()
end

global function DialogPower()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local emperor = GetActor("emperor")
	local empScrip = FindNodeByName("EmpAnimScript")
	local empIdle2 = FindNodeByTag("EmpIdle2")
	local doc_anim = FindNodeByPartialName("Anim_DRW_TalkDefensive2")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")

	doc_idles:Sleep()

	power_done = true

	SayPrep("skip", "")
	
	DocCam:CutTo()
	doctor:PlayAnimBlendOut(doc_anim, 1, 0.5, 0.5)
	--Option 3) POWER!
		doctor::SID_0679:Show me the source of your power!
	WideCam:CutTo()
	emperor:PlayAnim(empIdle2,1,1)
	emperor:SetCallback(empScrip, "ReturnToIdle")
		emperor::SID_0680:The Emperor Dalek does not obey orders.
	DocCam:CutTo()
	doc_idles:Wake()

	if not time_done then
		DecisionManager:AddOption("", "DIALOGUE_TIME", script_node, "DialogTime")
	end
	if not stop_done then
		DecisionManager:AddOption("", "DIALOGUE_STOP", script_node, "DialogStop")
	end
	DecisionManager:AddOption("", "DIALOGUE_REVEAL", script_node, "DialogReveal")
	DecisionManager:Start()
end

global function DialogReveal()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local emperor = GetActor("emperor")
	local doc_point = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward")	
	local cutscene_14_2 = FindNodeByName("cutscene_14_2")
	local doc_idles = FindNodeByName("lua_doctor_cutscene_idles")
	local amy_idles = FindNodeByName("lua_amy_cutscene_idles")

	doc_idles.script.End()
	amy_idles.script.End()	

	SayPrep("skip", "")
	
	DocCam:CutTo()
	doctor:PlayAnimBlendOut(doc_point , 1, 0, 0.5)
	--Option 4) REVEAL? 	
		doctor::SID_0681:What use is power if there is no one to marvel at it? To quake with fear. Come on, show me. Scare me.
	EmpCam:CutTo()
		emperor::SID_0682:Witness the might of the Daleks. Fear it!

	SetGlobalObjectiveState("Dalek_2_4_2", 3)

	cutscene_14_2:ClearPause()
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local cutscene_15 = FindNodeByName("cutscene_15")
	local eye_of_time = FindNodeByShortName("EM_ENTITY_Eye_of_Time_FX:0")
	local portaloo = FindNodeByShortName("EM_ENTITY_capsule_for_eye_of_time:0")
	local temp_dalek1 = FindNodeByTag("temp_dalek1")
	local temp_dalek2 = FindNodeByTag("temp_dalek2")
	
	amy:ClearFocus()
	doctor:ClearFocus()
	
	temp_dalek1:StopTrigger()
	temp_dalek2:StopTrigger()
	
	portaloo:StopTrigger()
	eye_of_time:Trigger()
	
	cutscene_15:Trigger()
end
