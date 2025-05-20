global script_node
global not_first_time
global not_amy_first_time
global got_locker_code
global doc_ask_about_chisholm
global amy_ask_about_chisholm
global heard_about_meadows
local loc = FindNodeByName("loc_tower_intercom")
local loc_amy = FindNodeByName("loc_tower_intercom_amy")
local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")
local common_scripts = FindNodeByName("common_scripts")

heard_about_meadows = false

global function InteractOld()
	local doctor =GetActor("doctor")
	local amy =GetActor("amy")
	local doctor_player =common_scripts.script.DoctorIsPlayer()
	if(doctor_player) then	
		doctor:SetTarget(loc)
		doctor:SetCallback(script_node, "InteractMoveFinished")
		doctor:SetMoveTime(1)
		doctor:SetBehaviour("move")
	else
		amy:SetTarget(loc_amy)
		amy:SetCallback(script_node, "InteractMoveFinished")
		amy:SetMoveTime(1)
		amy:SetBehaviour("move")
	end
end

global function ChisholmGroan()
	local chisholm=GetActor("chisholm")
	--NEW
	--HINT
	--CHisholm just groans for some responses
	chisholm::SID_1581:Groans.
end
	
--global function InteractMoveFinished()
global function Interact()
	local chisholm=GetActor("chisholm")
	local doctor = GetActor("doctor")
	SayPrep("skip", "")	
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	

		local serum = FindNodeByName("serum")
		if(doctor:IsInventoryItem(serum)) then
			--local cutscene = FindNodeByName("give_chisholm_cure_CS9")
			doctor:SetBehaviour("wait")
			ShowFade()
			Wait(1)
			local cutscene = FindNodeByName("Cutscene_9a")
			cutscene:Trigger()
		else
			if(doc_ask_about_chisholm and heard_about_meadows) then
				--VO
				--interacting with intercom when all choices are exhausted
				doctor::SID_2196:I better leave him alone until I have some good news.
				
			else
				doctor:SetTarget(loc)
				doctor:SetMoveTime(1)
				doctor:SetBehaviour("move")
				Wait(1)
				ShowLetterBox()
				doctor:PlayAnim(anim, 1, 0.1)
				doctor:DisableAnimLoop()
				Wait(1)
				
				if(not not_first_time) then
					doctor::SID_0115: Hello? Chisholm, are you in there?
					chisholm::SID_0116:Go away. You can't help me now. Best thing you can do is save yourselves.
					doctor::SID_0117:I promise we will find a way to help you.
					not_first_time = true
				else
					--HINT
					doctor::SID_1534:Mr. Chisholm?
					--HINT
					--NEW
					chisholm::SID_1535: Yes?		
				end
				
				doctor:SetBehaviour("pc")
				
				local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
				if(not doc_ask_about_chisholm) then
				DecisionManager:AddOption("", "CYBER_CH_CHISHOLM", script_node, "Decision1")
				end
				if( not heard_about_meadows) then
				DecisionManager:AddOption("", "CYBER_CH_GSO", script_node, "Decision2")
				end
				DecisionManager:Start()
			end
		end
	else
		local amy=GetActor("amy")
		
		local chase_is_not_on = FindNodeByName("script_doctor").script.stop_chase
		WaitFrame()
		if(amy_ask_about_chisholm and got_locker_code) then
			--VO
			--Amy trying to interact with tower already talked twice
			amy::SID_2197:I better leave him alone.
		elseif(not chase_is_not_on)	 then
			--VO
			--Amy trying to interact with tower when chase is on
			amy::SID_2198: I haven't got time to chat with Chisholm now!
		else
			amy:SetTarget(loc_amy)
			amy:SetMoveTime(1)
			amy:SetBehaviour("move")
			Wait(1)
			amy:PlayAnim(anim_amy, 1, 0.1)
			amy:DisableAnimLoop()
			ShowLetterBox()
			Wait(1)
			if(not not_amy_first_time) then
	
				--HINT. DIALOGUE TREE
				amy::SID_1585:Hello, Mr. Chisholm? Are you there?
			
				--HINT. DIALOGUE TREE
				--ask about GSO
				chisholm::SID_0119:Why are you still here?
				amy::SID_0120:I need to ask you a question.
				not_amy_first_time = true
			else
				--HINT
				amy::SID_1536: Mr. Chisholm?
			end
			amy:SetBehaviour("pc")
			local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
			if(not amy_ask_about_chisholm) then
				DecisionManager:AddOption("icon1.tga", "CYBER_CH_CHISHOLM", script_node, "Decision1_amy")
			end
			if (not got_locker_code) then
				DecisionManager:AddOption("icon2.tga", "CYBER_CH_RADIO", script_node, "Decision2_amy")
			end
			DecisionManager:Start()
		end
	end
end

global function Decision1()
	doc_ask_about_chisholm = true
	local doctor = GetActor("doctor")
	local chisholm=GetActor("chisholm")
	doctor:SetBehaviour("wait")
	SayPrep("skip","")


		--HINT. DIALOGUE TREE
		--ask about chisholm
		doctor::SID_0121:Are you alright?
		chisholm::SID_0122:Something is happening to me. The feeling has gone in my right arm.

	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
end

global function Decision2()
	heard_about_meadows = true
	local doctor = GetActor("doctor")
	local chisholm=GetActor("chisholm")
	doctor:SetBehaviour("wait")
	SayPrep("skip","")
	
	--HINT. DIALOGUE TREE
	--ask about GSO
	doctor::SID_0123:Who is in charge here? Could there be other survivors?
	heard_about_meadows = true
	chisholm::SID_0124:Elizabeth Meadows is the senior scientist. Maybe she's not infected.

	chisholm::SID_0125:She's pretty resourceful. If anyone has survived, it's her.
	doctor::SID_0126:Thanks. We'll find her. Don't worry. We'll fix this.


	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
end

global function Decision1_amy()
	amy_ask_about_chisholm = true
	local amy = GetActor("amy")
	local chisholm=GetActor("chisholm")
	amy:SetBehaviour("wait")
	SayPrep("skip","")

	--HINT. DIALOGUE TREE
	--ask about Chisholm
	amy::SID_0127:How are you doing in there?
	chisholm::SID_0128:It's getting worse. You'd better get away.

		amy::SID_0129:The Doctor will help you. I know he will.
		chisholm::SID_0130:You think so? I saw what happened to my friends.
		amy_ask_about_chisholm = 1

	HideLetterBox()
	amy:SetBehaviour("pc")
	amy:EnablePhysics()
end

global function Decision2_amy()
	got_locker_code = true
	local amy = GetActor("amy")
	local chisholm=GetActor("chisholm")
	amy:SetBehaviour("wait")
	SayPrep("skip","")
--	if(got_locker_code) then
	--HINT. DIALOGUE TREE
	--ask about radio part again	 
--		chisholm::SID_1584:As I said… 
--	else

		--HINT. DIALOGUE TREE
		--ask about radio part
		amy::SID_0131:Do you know where I can find a Capacitor for the radio?
		amy::SID_0132:It's broken and we need to warn Fort Cecil.
--	end
	chisholm::SID_0133:There's a spare one in my Locker. The code is 3245
	amy::SID_0134:Thank you.

	local int_locker_use = FindNodeByName("int_locker_use")
	local int_locker_examine = FindNodeByName("int_locker")
	
	int_locker_use:Trigger()
	int_locker_examine:StopTrigger()
	
	HideLetterBox()
	amy:SetBehaviour("pc")
	amy:EnablePhysics()
end


