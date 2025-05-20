global script_node
global dana_move_loc4

dana_move_loc4 = false

local function DanaMoveLoc4()
	local dana = GetActor("dana")
	local loc3 = FindNodeByName("Cutscene7aLocator_Dana")
	local loc4 = FindNodeByName("LabatoryLocator_Dana")

	dana:Teleport(loc3)
	dana:SetTarget(loc4)
	dana:SetMoveTime(14)	
	dana:SetBehaviour("move")
	dana:EnableMoveWalls()
	dana:SetCallback(script_node, "DanaMovedLoc4")
	dana_move_loc4 = true
end

global function DanaMovedLoc4()
	local int = FindNodeByName("InteractableDana_0")
	local idles = FindNodeByName("script_dana_idle")
	idles.script.play_idles = true
	local idles = FindNodeByName("script_oswald_idle")
	idles.script.play_idles = true
	dana_move_loc4 = false
	int:Trigger()
	FindNodeByName("Tanaka_NavMeshHole"):Trigger()
end

global function Trigger()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("Cutscene7aLocator_Doctor_Move")
	local cutscene = FindNodeByName("ActiveCutScene_7a")
	
	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc)
	doctor:SetMoveTime(1)	
	doctor:SetBehaviour("move")	
		
	Wait(1)
	ShowFade()
	
	Wait(2)
	cutscene:Trigger()
end

global function PerformCutscene7a()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local oswald = GetActor("oswald")
	local dana = GetActor("dana")
	local music = FindNodeByName("cs7a_music")

	PlayMusic(music)
	HideFade()
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	SayPrep("", "")
end

global function EndCutscene7a()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local oswald = GetActor("oswald")
	local loc1 = FindNodeByName("Cutscene7aLocator_Doctor")
	local loc2 = FindNodeByName("Cutscene7aLocator_Amy")
	local os_loc = FindNodeByName("After_7_1_Oswald")
	local amb = FindNodeByName("act2_amb_def")
	local lift_script = FindNodeByName("lift_script_upper")
	
	PlayMusic(amb)
	
	HideLetterBox()
	
	doctor:Teleport(loc1)
	amy:Teleport(loc2)
	--double check
	oswald:Teleport(os_loc)
		
	DanaMoveLoc4()
	
	--amy and doc outside lift
	lift_script.script.Reset()
		
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	--FindNodeByName("TriggerCutscene7a"):DisableNode()
	FindNodeByName("Act2Progression").script.SetStage_NegotiateAccessToTunnels()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)	

	FindNodeByName("AutomaticHorizontalDoor_0").script.Reset()

	--Wait(14) this is very very bad; they could be anywhere when it saves
	--SaveCheckpoint() now saves at end of timeline
end

global function Init()
	if dana_move_loc4 then
		DanaMoveLoc4()
	end
end
