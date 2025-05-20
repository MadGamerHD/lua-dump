global script_node

global disabled_tardis
global levers_done

global function CheckCombination()
	local hint = QueryObjective(0)          
	local hint1 = QueryObjective(1)    

	print(" CHECK COMB SWITCH" , "\n")
	print(hint)
	
	--all up
	if (hint1 == "hint_1_2_2") then
		FindNodeByName("CombinationScript2").script.CheckCombination()
	--aim tractor
	elseif (hint1 == "hint_1_4_2") then
		FindNodeByName("CombinationScript3").script.CheckCombination()
	--red levers (done)
	elseif levers_done then
		FindNodeByName("CombinationScript1").script.CheckCombination()
	end
end

global function Run_1_1_AlreadyText()
	local amy = GetActor("amy")
	--VO 
	--Amy trys to pull a red lever that has already been pulled, objective 1_1
		amy::SID_1286:I've already pulled that one.
end

global function SleepControls()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam1_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam2_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam3_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam4_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam5_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam6_Anim_TARDIS_Interior:0"):Sleep()

	FindNodeByShortName("EM_ANIMATOR_P02_Atom_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_P01_Eye_Rot_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_Gyroscope_anim_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_animated_thermometer1_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_animated_thermometer_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_Tapetest1_Anim_TARDIS_Interior:0"):Sleep()
	FindNodeByShortName("EM_ANIMATOR_Tapetest_Anim_TARDIS_Interior:0"):Sleep()

	disabled_tardis = true
end

local function WakeControls()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam1_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam2_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam3_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam4_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam5_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P03_Foam6_Anim_TARDIS_Interior:0"):Wake()

	FindNodeByShortName("EM_ANIMATOR_P02_Atom_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_P01_Eye_Rot_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_Gyroscope_anim_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_animated_thermometer1_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_animated_thermometer_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_Tapetest1_Anim_TARDIS_Interior:0"):Wake()
	FindNodeByShortName("EM_ANIMATOR_Tapetest_Anim_TARDIS_Interior:0"):Wake()

	disabled_tardis = false
end

global function Run_1_1_Text()
	local hint = QueryObjective(0)    
	local amy = GetActor("amy")
	
	SayPrep("skip","")
	
	if(hint == "hint_1_1") then
		print("Run text NEW","\n")
		
		if (FindNodeByName("Console5InteractableScript").script.Object5State == 1 and FindNodeByName("Console3InteractableScript").script.Object3State == 1) then
			FindNodeByTag("Panel1"):Trigger()
			FindNodeByTag("Panel2"):Trigger()
			FindNodeByTag("Panel3"):Trigger()
			FindNodeByTag("Panel4"):Trigger()
			FindNodeByTag("Panel5"):Trigger()
			FindNodeByTag("Panel6"):Trigger()
			WakeControls()
			FindNodeByName("Quantums"):Trigger()
			FindNodeByName("ConsoleAmbiance"):Trigger()
			FindNodeByName("ConsolePowerUp"):Trigger()
				
			-- controls audio
			FindNodeByName("tape_loop"):Trigger()
			FindNodeByName("Ob_6_1Sound"):Trigger() -- Gyroscope
			FindNodeByName("Atom_Audio"):Trigger()
			FindNodeByName("cooling"):Trigger()
			
			--Second lever (done)
			SetGlobalObjectiveState("Objective_1_1_2", 3)
			
			levers_done = true
			
			--VO: 
			--Amy has pulled the second red lever for objective 1_1
				amy::SID_1133:It's doing something! Sounds like it's powering up again.	
		else
			--First lever (done)
			SetGlobalObjectiveState("Objective_1_1_1", 3)
		
			FindNodeByName("FirstRedLever"):Trigger()		
			
			--VO: 
			--Amy has pulled the second red lever for objective 1_1
				amy::SID_1134:Just one more to go!
		end
	end
end

global function Init()
	if disabled_tardis then
		-- Enable animators for frame to position entities
		WakeControls()
		WaitFrame()
		SleepControls()
	end
end