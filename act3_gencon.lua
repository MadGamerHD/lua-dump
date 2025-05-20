global sabotage_start
global script_node

global function Interact1()
	local doctor = GetActor("doctor")
	local object_states = FindNodeByName("object_states_script")

	SayPrep("skip", "")
	
	if object_states.script.Connected then
		--VO
		--Examine field generator controls (after trap set)
			doctor::SID_0941:Once I access these controls I can activate the trap.
	else
		--*NOTE swapped from generators to controls	
		--VO
		--Examine field generator controls (before trap set)
			doctor::SID_0713:The Daleks have already set up these Magnetic Field Generators, but there's no power. We need to improvise
	end
end

global function Use1()
	local doctor = GetActor("doctor")
	local wiring = FindNodeByName("wiring")
	local screwdriver = FindNodeByName("screwdriver")
	local object_states = FindNodeByName("object_states_script")
	local cutscene_17 = FindNodeByName("cutscene_17")

	SayPrep("skip", "")
	if doctor:IsUsingInventoryItem(wiring) then

	--VO
	--Use dalekanium wires with magnetic field generator controls
		doctor::SID_0942:The Wires can't reach the Debris to connect the circuit from here.

	elseif doctor:IsUsingInventoryItem(screwdriver) then
		if object_states.script.Connected then
			cutscene_17:Trigger()
		else
		--*NOTE swapped from generators to controls
		--VO
		--Use Sonic with magnetic field generator controls (before connected to battery)
			doctor::SID_0714:That won't work yet. I need to connect a power source before I can augment the output.
		end
	end
end

----

global function Interact2()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	
	--*NOTE swapped from generators to controls
	--VO
	--Examine magnetic field generator (after trap, before return to council chamber)
		doctor::SID_0887:That trap worked perfectly.
end

global function Use2()
	local common_scripts = FindNodeByName("common_scripts")
	
	common_scripts.script.RandomRefusal()
end

----

global function Interact3()
	local amy = GetActor("amy")

	SayPrep("skip", "")	
	--*NOTE swapped from generators to controls
	--VO
	--Examine magnetic field generator when eye in place 
		amy::SID_0764:The Daleks have powered them up and the Eye is open. I need to hurry.
end

global function Use3()
	local common_scripts = FindNodeByName("common_scripts")
	
	common_scripts.script.RandomRefusal()
end

----

global function Interact4()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	
	if sabotage_start then
		--NEW
		--VO
		--Examine console after generators set to explode
			doctor::SID_1048:I only have a few seconds before these generators blow!	
	else
		--*NOTE swapped from generators to controls
		--VO
		--Examine magnetic field generator (one object) before using sonic on them
			doctor::SID_0769:I need to overload these generators somehow.	
	end
end

local function sabotage_sub()	
	local doctor = GetActor("doctor")
	local sabotage_time = FindNodeByName("sabotage_time")
	--*NOTE swapped from generators to controls
	--VO
	--Use sonic with magnetic field generator controls to overload them (one by one).
		doctor::SID_0771:I don't have much time now... I must get to Amy!
	
	--player must run to amy before all 4 gens collapse (BANG: timer starts...BANG... BANG...TOO LATE!)
	sabotage_time:Trigger()
end

global function Use4()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	local sabotage_loc = FindNodeByName("sabotage_loc")
	
	SayPrep("skip", "")
	if doctor:IsUsingInventoryItem(screwdriver) then
		if sabotage_start then
			--NEW
			--VO
			--Use Sonic on console after generators set to explode
				doctor::SID_1049:Amy is counting on me, I have to get to her!
		else
			doctor:SetBehaviour("wait")
			doctor:SetTarget(sabotage_loc)
			doctor:SetMaxSpeed(2)
			doctor:SetBehaviour("move")
			doctor:SetCallback(script_node, "AtLoc")
		end
	end
end

global function AtLoc()
	local doctor = GetActor("doctor")
	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 1.25)
	doctor:PlayAnimAndWaitBlendOut(use_sonic,1,0.5,0.5)
	
	sabotage_start = true
	SetGlobalObjectiveState("Dalek_3_6_1",3)
	doctor:SetBehaviour("pc")

	SaveCheckpoint()
end

----

global function Interact()
	local object_states = FindNodeByName("object_states_script")

	if object_states.script.GeneratorState == 1 then
		Interact1()
	elseif object_states.script.GeneratorState == 2 then
		Interact2()
	elseif object_states.script.GeneratorState == 3 then
		Interact3()
	else 
		Interact4()
	end
end

global function Use()
	local object_states = FindNodeByName("object_states_script")

	if object_states.script.GeneratorState == 1 then
		Use1()
	elseif object_states.script.GeneratorState == 2 then
		Use2()
	elseif object_states.script.GeneratorState == 3 then
		Use3()
	else 
		Use4()
	end
end

global function Idle()
	if sabotage_start == true then
		sabotage_sub()
		sabotage_start = false
	end
end

