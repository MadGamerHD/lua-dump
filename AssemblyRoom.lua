global script_node
global first_up

first_up = true

global lift_state
if not IsLoadingSavedGame() then
	lift_state = "locked"
	first_up = true
end

local function DoExcuseForNotUsingLift()
	local doctor = GetActor("doctor")
	local stage = FindNodeByName("Act2Progression").script.stage
	local Jones_Script = FindNodeByName("Jones_Script")
	
	SayPrep("skip","")
	
	if(stage == "JourneyToGenerator") then
	
		--VO
		--doctor::With the Vashta Nerada lurking about, I think it would be wise to get the generator running before doing anything else.
		
		--VO
		doctor::SID_2383:We can't go back yet, we need to fix the Generator.
		
	elseif(stage == "ReturnToAssemblyHall") then

		if Jones_Script.script.have_performed_passive_cutscene == 1 then
			--VO
			doctor::SID_2717:I've shown the ESC to Jones, now I need to find the others.
		else
			--VO
			doctor::SID_2616:I'd like to show Jones this Environment Status Chip before heading to the Assembly Hall
		end
		
	elseif(stage == "NegotiateAccessToTunnels") then
	
		--VO
		--doctor::The lift's locked down... I need to get the access codes from somewhere...
		
		--VO
		doctor::SID_2384:We can't leave until we get those access codes.
		
	elseif(stage == "GatherIngredients") then
	
		--VO
		--doctor::I made a promise to Dana. I'm not returning without the ingredients for a cure.
		
		--VO
		doctor::SID_2385:I can't go back yet, I need all the ingredients for the cure.
		
	elseif(stage == "FormulateCure") then
	
		--VO
		doctor::SID_2617:I must formulate the cure before doing anything else.
		
	elseif(stage == "TriangulateSensors") then
	
		--VO
		--doctor::I'm pretty certain Dana said the Triangulation Units were on the Bridge above.
		
		--VO
		doctor::SID_2386:We need to find out where the radiation's coming from before we go anywhere else.
		
	end
end

global function TakeLiftUp()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local progression = FindNodeByName("Act2Progression")
	
	print("TakeLiftUp")

	if lift_state == "unlocked" then
	
		print("Lift unlocked")
		
		ShowFade()
		
		Wait(2)
		doctor:Teleport(FindNodeByName("LiftUpLocator_Doctor"))
		amy:Teleport(FindNodeByName("LiftUpLocator_Amy"))
		HideFade()
		if(first_up) then	
			first_up = false
			local dana = GetActor("dana")
			dana:SetTarget(doctor)
			dana:Face(0.9, "sine")
			Wait(1)
			dana:SetTarget(FindNodeByName("loc_dana_walk_to_doc"))
			dana:SetMoveTime(2)
			dana:SetBehaviour("move")
			Wait(1.5)
			ShowFade()
			Wait(2)
			HideFade()
			FindNodeByName("ActiveCutscene_7a"):Trigger()
			
		end
		if(progression.script.stage == "ReturnToLab") then
			progression.script.SetStage_FormulateCure()
		end
		
		-- Always lock the lift after "using" it
		lift_state = "locked"
	else
		print("Lift locked")
		DoExcuseForNotUsingLift()
	end
end

global function TakeLiftDown()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	if lift_state == "unlocked" then
		
		ShowFade()
		
		Wait(2)
		doctor:Teleport(FindNodeByName("LiftDownLocator_Doctor"))
		amy:Teleport(FindNodeByName("LiftDownLocator_Amy"))
		HideFade()
				
		-- Always lock the lift after "using" it
		lift_state = "locked"
	else
		print("Lift locked")
		DoExcuseForNotUsingLift()
	end
end

local triangulator_0_configured = false
local triangulator_1_configured = false

local function CheckForTriangulationComlete()
	local doctor = GetActor("doctor")

	SayPrep("skip","")
	
	if (triangulator_0_configured == false) or (triangulator_1_configured == false) then
		doctor:SetBehaviour("pc")

		--HINT
		doctor::SID_2083:Right, that's one of them triangulated. Just one more to go.
	else
		--Return to Dana's Lab to view the results (UNLOCKED)
		SetGlobalObjectiveState("POSEIDON_2_8_3", 2)		
		
		--HINT
		doctor::SID_2084:There we go, both Triangulation units are online.
		
		--HINT
		doctor::SID_2235:Let's get back to the Lab and see what the sensors are picking up.
			
		ShowFade()
		Wait(0.5)
		local ActiveCutScene_9 = FindNodeByName("ActiveCutScene_9")
		ActiveCutScene_9:Trigger()
	end
end

global function Triangulate_0()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("right_trig_loc")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	local trig_int0 = FindNodeByName("TriangulateInteract_0")
	local beep = FindNodeByName("trig_1_beep")
	
	trig_int0:StopTrigger()

	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc)
	doctor:SetMoveTime(1.5)
	doctor:SetBehaviour("move")
	
	Wait(1.5)
	doctor:PlayAnim(anim,2,0.1)

	Wait(0.5)
	beep:Trigger()

	Wait(0.5)
	doctor:StopAnim(0.5)

	triangulator_0_configured = true

	--Activate the Right Triangulating Sensor(DONE)
	SetGlobalObjectiveState("POSEIDON_2_8_2", 3)
	
	CheckForTriangulationComlete()
end

global function Triangulate_1()
	local doctor = GetActor("doctor")
	local loc = FindNodeByName("left_trig_loc")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel1_2m")
	local trig_int1 = FindNodeByName("TriangulateInteract_1")
	local beep = FindNodeByName("trig_1_beep")

	trig_int1:StopTrigger()

	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc)
	doctor:SetMoveTime(1.5)
	doctor:SetBehaviour("move")
	
	Wait(1.5)
	doctor:PlayAnim(anim,2,0.1)

	Wait(0.5)
	beep:Trigger()

	Wait(0.5)
	doctor:StopAnim(0.5)
	
	triangulator_1_configured = true
	
	--Activate the Left Triangulating Sensor(DONE)
	SetGlobalObjectiveState("POSEIDON_2_8_1", 3)
	
	CheckForTriangulationComlete()
end


