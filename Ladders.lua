global script_node

local tutorial_played
local DiversControlScript = FindNodeByName("GeneratorGameplayScript")

-- Actors that are constantly needed nere
local doctor = GetActor("doctor")
local amy = GetActor("amy")

--------------------------------------------------------------------
-- Ladder functions
--------------------------------------------------------------------

local function DoctorRefuseToClimbLadder()
	local doctor = GetActor("doctor")
	
	SayPrep("skip","")
	--VO
	doctor::SID_2715:There's no reason to run around up there now.
end

local function AmyRefuseToClimbLadder()
	local amy = GetActor("amy")
	
	SayPrep("skip","")	
	--VO
	amy::SID_2411:I'd really rather get the Generator running, and not hang around these possibly dead divers.
end

local function ClimbUpLadder(index)
	local amb = FindNodeByName("act2_amb_def")

	FindNodeByName("LadderInteractableUp_0"):DisableNode()
	FindNodeByName("LadderInteractableUp_1"):DisableNode()
	FindNodeByName("LadderInteractableDown_0"):EnableNode()
	FindNodeByName("LadderInteractableDown_1"):EnableNode()
	
	doctor:SetTarget(FindNodeByName("climbup_loc_doctor_"..index))
	doctor:SetMoveTime(1.0)
	doctor:SetBehaviour("move")
	
	-- Fade the screen down to fake the start of a ladder climb
	Wait(1.0)
	doctor:PlayAnim(FindNodeByPartialName("Anim_DRW_InteractHigh"), 1.0, 0.3)
	Wait(0.3)
	ShowFade()
	Wait(0.9)
	doctor:StopAnim(0.0)
	Wait(0.1)
	doctor:Teleport(FindNodeByName("LadderLocatorTop_Doctor_"..index))
	amy:Teleport(FindNodeByName("LadderLocatorTop_Amy_"..index))
	
	HideFade()
	
	doctor:DisableStealth()
	amy:DisableStealth()
	PlayMusic(amb)
	doctor:SetBehaviour("pc")
	
	FindNodeByName("GeneratorGameplayScript").script.SetDiversToPatrol()
end

local function ClimbDownLadder(index)
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

	FindNodeByName("LadderInteractableUp_0"):EnableNode()
	FindNodeByName("LadderInteractableUp_1"):EnableNode()
	FindNodeByName("LadderInteractableDown_0"):DisableNode()
	FindNodeByName("LadderInteractableDown_1"):DisableNode()
	
	doctor:SetTarget(FindNodeByName("climbdown_loc_doctor_"..index))
	doctor:SetMoveTime(1.0)
	doctor:SetBehaviour("move")
	
	-- Fade the screen down to fake the start of a ladder climb
	Wait(1.0)
	doctor:PlayAnim(FindNodeByPartialName("Anim_DRW_ClimbDown1m_Idle"), 1.0, 0.3)
	Wait(0.3)
	ShowFade()
	Wait(0.9)
	doctor:StopAnim(0.0)
	Wait(0.1)
	doctor:Teleport(FindNodeByName("LadderLocatorBottom_Doctor_"..index))
	amy:Teleport(FindNodeByName("LadderLocatorBottom_Amy_"..index))
	
	HideFade()
	
	doctor:EnableStealth()
	amy:EnableStealth()

	doctor:SetBehaviour("pc")
	
	if not tutorial_played then
		OverlayManager:ShowTutorial("STEALTH")	
		OverlayManager:TutorialsOff()
		tutorial_played = true
	end
end

global function ClimbUpLadder_0()
	if FindPlayer():GetName() == doctor:GetName() then
		if DiversControlScript.script.num_divers_dead == 2 then
			DoctorRefuseToClimbLadder()
		else
			ClimbUpLadder(0)
		end
	else
		AmyRefuseToClimbLadder()
	end
end

global function ClimbUpLadder_1()
	if FindPlayer():GetName() == doctor:GetName() then
		if DiversControlScript.script.num_divers_dead == 2 then
			DoctorRefuseToClimbLadder()
		else
			ClimbUpLadder(1)
		end
	else
		AmyRefuseToClimbLadder()
	end
end

global function ClimbDownLadder_0()
	ClimbDownLadder(0)
end

global function ClimbDownLadder_1()
	ClimbDownLadder(1)
end

global function Use()
	if FindPlayer():GetName() == doctor:GetName() then
		FindNodeByName("common").script.RandomRefusal()
	else
		AmyRefuseToClimbLadder()
	end
end
