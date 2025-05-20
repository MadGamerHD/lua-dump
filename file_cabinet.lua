global got_birthday
global script_node
global first
global set_objective
global first_approach

global done_meadows
global done_base
global done_chisholm

local doc_anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Interactkeyboard")
local amy_anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractKeyboardTable")


done_meadows = false
done_base = false
done_chisholm = false


global function MoveAway()

	StopPOIWait()
	ResetPlayerCamera()

end

global function Trigger()
	StopPOIWait()
	ResetPlayerCamera()
	--local doctor  = GetActor("doctor")
--	local way_point = FindNodeByName("loc_computer")
--	doctor:SetTarget(way_point)
--	doctor:Teleport(way_point)
--	doctor:PlayAnim(doc_anim, 1, 0)

	local  amy= GetActor("amy")
	local way_point = FindNodeByName("loc_computer")
	amy:SetTarget(way_point)
	amy:Teleport(way_point)
	amy:PlayAnim(amy_anim, 1, 0)



end

global function ZoomIn()

	local camera_view = FindNodeByName("splinenode_computer_poi")	
	SetPOIPosAndLookZ(camera_view)
	BeginPOI(2, 400, 2, true, true)

end


global function Interact()

	local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		local doctor = GetActor("doctor")
		if(done_meadows and done_base and done_chisholm) then
			doctor::SID_2199:I've already got everything I can out of the computer.
		else
			
			local way_point = FindNodeByName("loc_computer")
			doctor:SetTarget(way_point)
			doctor:SetMoveTime(1)
			doctor:SetBehaviour("move")
			ZoomIn()
			ShowLetterBox()

			if(first_approach == nil) then
				SayPrep("skip","")
				--HINT.
				--searching in computer
				doctor::SID_0452:Let's see if we can't get some information out of this system.
				first_approach = 1
			else
				Wait(1)
			end
			
			doctor:SetBehaviour("pc")
			if(not done_meadows) then
				DecisionManager:AddOption("icon1.tga", "CYBER_FILE1", script_node, "Decision1")
			end
			if(not done_base) then
				DecisionManager:AddOption("icon2.tga", "CYBER_FILE2", script_node, "Decision2")
			end
			if(not done_chisholm) then
				DecisionManager:AddOption("icon3.tga", "CYBER_FILE3", script_node, "Decision3")
			end
			DecisionManager:Start()
		end
	else
		local amy = GetActor("amy")
		if(done_meadows and done_base and done_chisholm) then
			amy::SID_2200:There's nothing else of interest on there.
		else
			
			local way_point = FindNodeByName("loc_computer")
			amy:SetTarget(way_point)
			amy:SetMoveTime(1)
			amy:SetBehaviour("move")
			ZoomIn()
			ShowLetterBox()
			Wait(1)
			if(not done_meadows) then
				DecisionManager:AddOption("icon1.tga", "CYBER_FILE1", script_node, "Decision1_amy")
			end
			if(not done_base) then
				DecisionManager:AddOption("icon2.tga", "CYBER_FILE2", script_node, "Decision2_amy")
			end
			if(not done_chisholm) then
				DecisionManager:AddOption("icon3.tga", "CYBER_FILE3", script_node, "Decision3_amy")
			end
			DecisionManager:Start()
		end
	end	
end

global function Decision1()
	done_meadows = true
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:PlayAnim(doc_anim, 1, 0)
	SayPrep("skip","")
	if(first == nil) then
		
		first = 1
		local chisholm_told = FindNodeByName("script_intercom").script.heard_about_meadows
		if(chisholm_told) then
			--VO
			--choosing file about Meadows, and already heard about her
			doctor::SID_2022:There's a file here on Elizabeth Meadows. As Chisholm said, she's in charge here.
		else	
			--VO
			--choosing file about Meadows
			doctor::SID_0186:There's a file here on an Elizabeth Meadows. From the look of it, she's in charge here.
		end
		doctor:SetBehaviour("wait")
		--VO
		--choosing file about Meadows
		doctor::SID_0187: One daughter Daisy. Daisy Meadows? Poor girl. It's her birthday tomorrow: 5th of May.
		got_birthday = true
		local know_about_code = FindNodeByName("script_lab_code_panel").script.know_about_code
		WaitFrame()
		if(know_about_code) then
			--VO
			--spelling out code
			doctor::SID_1832: 0505. I wonder...
			
		end
		--talk to meadows
		SetGlobalObjectiveState("Cyber_2_3_3", 2) -- 2 is unlock, 3 is done
	else
		--VO
		--choosing file about Meadows, second time
		doctor::SID_1155: Elizabeth Meadows is in charge.
	end
	MoveAway()
	HideLetterBox()
	doctor:SetBehaviour("pc")
	
	if(set_objective == nil) then
	set_objective = 1
		--find the code to the lab door
		SetGlobalObjectiveState("Cyber_2_3_2", 3) -- 2 is unlock, 3 is done
		--talk to meadows
		SetGlobalObjectiveState("Cyber_2_3_3", 2) -- 2 is unlock, 3 is done
	end
end

global function Decision2()
	done_base = true
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:PlayAnim(doc_anim, 1, 0)
	SayPrep("skip","")
	--VO
	--choosing file about GSO
	doctor::SID_0188:Looks like this is a multi-national scientific project. A real brainy bunch.
	HideLetterBox()
	MoveAway()
	doctor:SetBehaviour("pc")
end

global function Decision3()
	done_chisholm = true
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor:PlayAnim(doc_anim, 1, 0)
	SayPrep("skip","")
	--VO
	--choosing file about Chisholm
	doctor::SID_0189: Our friend Chisholm is in here. Seems he is chief engineer as well as an archaeologist.
	HideLetterBox()
	MoveAway()
	doctor:SetBehaviour("pc")
end

global function Decision1_amy()
	done_meadows = true
	local amy = GetActor("amy")
	amy:SetBehaviour("wait")
	amy:PlayAnim(amy_anim, 1, 0)
	SayPrep("skip","")
	--VO
	--choosing file about Meadows
	amy::SID_0190:There's a file here on an Elizabeth Meadows. Looks like she’s in charge.
	HideLetterBox()
	MoveAway()
	amy:SetBehaviour("pc")
end

global function Decision2_amy()
	done_base = true
	local amy = GetActor("amy")
	amy:SetBehaviour("wait")
	amy:PlayAnim(amy_anim, 1, 0)
	SayPrep("skip","")
	--VO
	--choosing file about GSO
	amy::SID_1156:Lots of information in here about the station itself.
	HideLetterBox()
	MoveAway()
	amy:SetBehaviour("pc")
end

global function Decision3_amy()
	done_chisholm = true
	local amy = GetActor("amy")
	amy:SetBehaviour("wait")
	amy:PlayAnim(amy_anim, 1, 0)
	SayPrep("skip","")

	--VO
	--choosing file about Chisholm
	amy::SID_0192:Chisholm is in here. He's chief engineer as well as an archaeologist. Bet he was teacher's pet.
	HideLetterBox()
	MoveAway()
	amy:SetBehaviour("pc")
end


global function Minigame_starter()
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local CircuitMinigame = MinigameManager:GetCircuitMiniGame()

	MinigameManager:SetCallback(script_node, "MinigameWon")
	MinigameManager:StartMiniGame(CircuitMinigame)
end

