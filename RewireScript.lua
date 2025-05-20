global script_node
global doc_idles

doc_idles = false

local function DocIdle()
	local doc_idles_script = FindNodeByName("lua_doctor_cutscene_idles")

	doc_idles_script:Wake()
end

global function RewiringComplete()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local progression_script = FindNodeByName("Act2Progression")
	local amy_int = FindNodeByName("InteractAmy_0")
	local default = FindNodeByName("EmDefaultCamera")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnLeft180")
	local talk2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2")
	local talkp = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward")
	local idle = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Idle03")
	
	FindNodeByName("RewireInteractable"):DisableNode()

	ShowLetterBox()
	
	SayPrep("skip", "async")
	
	doctor:PlayAnimBlendOut(turn,1,0.1,0.1)
	
	--CUTSCENE 6.1
	--AFTER CUTSCENE 6
	--INT. POSEIDON. SUB-AQUATIC GENERATOR ROOM  NIGHT
	doctor::SID_2075:Hmm, the Generator's still not working properly. Must be something blocking the vents. I'll keep working on it here, you head up the corridor, and...
	
	Wait(5)
	doctor:PlayAnimBlendOut(talkp,1,0.1,0.1)

	Wait(3.5)
	SayPrep("skip", "sync")

	amy:SetTarget(FindNodeByName("exit_loc_amy"))
	amy:SetMoveTime(4)
	amy:SetBehaviour("move")

	doctor:PlayAnimBlendOut(idle,1,0.2,0.2)
	amy::SID_2076:I know, I know, bravely face the darkness and monsters, and save the day, again.

	doctor:PlayAnimBlendOut(talk2,1,0.1,0.1)
	doctor::SID_2077:Well, it's probably just a matter of flicking a switch, actually. But yes. Good luck with, er... flicking that switch...
	
	default:CutTo()
	HideLetterBox()
	
	--even though amy is pc?
	amy_int:Trigger()
	
	DocIdle()
	doc_idles = true
	
	progression_script.script.SetStage_JounreyToProcessingRoom()
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc1 = FindNodeByName("Rewire_Loc_Doc")
	local loc2 = FindNodeByName("Rewire_Loc_Amy")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")
	local prop = FindNodeByName("Rewire_Prop")
	local amy_int = FindNodeByName("InteractAmy_0")
	local cam = FindNodeByName("Rewire_Cam")
	local MinigameManager = FindManagerByName("EmAdventureGame_MiniGameManager")
	local rewiringGame = MinigameManager:GetCircuitMiniGame()
		
	if FindPlayer():GetName() == doctor:GetName() then
		amy_int:StopTrigger()
		
		--mini cut scene
		ShowLetterBox()
		cam:CutTo()
		--LockActorCamera()

		doctor:SetBehaviour("wait")
		doctor:SetTarget(loc1)
		doctor:SetMoveTime(1.5)
		doctor:SetBehaviour("move")
		
		amy:SetTarget(loc2)
		amy:SetMoveTime(2.5)
		amy:SetBehaviour("move")
		
		Wait(1.5)
		doctor:PlayAnim(anim,2,0.1)
		
		Wait(2)
		prop:MoveOnPivot(FindNodeByName("open"), 1, "lerp",FindNodeByName("closed"))

		Wait(1)
		--FreeActorCamera()
		HideLetterBox()
		
		MinigameManager:SetMiniGameID("MINI_WIRE01")
		rewiringGame:SetBoard(0)
		MinigameManager:StartMiniGame(rewiringGame)	
		MinigameManager:SetCallback(script_node, "RewiringComplete")
	else
		--VO
		amy::SID_2412:I think I'd rather leave the wiring to the Doctor.
	end
end

global function Init()
	if doc_idles then
		DocIdle()
	end
end

global function EndDocIdle()
	local doc_idles_script = FindNodeByName("lua_doctor_cutscene_idles")

	doc_idles_script.script.End()
	doc_idles = false
end