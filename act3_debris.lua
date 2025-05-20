global function Interact1()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
		--VO
		--Examine Dalekanium debris close to field generators
			doctor::SID_0707:This Dalekanium is sitting in a pool of powerful acid. If I can connect it to the Generators, all I'll need is an electric charge.
end

----

global function Interact2()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
		--VO
		--Examine Dalekanium debris (after wires used, trap NOT sprung)
			doctor::SID_0889:Our homemade battery is powering the console. Now I just need to switch it on.
end

----
			
global function Interact3()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
		--VO
		--Examine Dalekanium debris (after wires used and trap sprung)
			doctor::SID_2039:This Dalekanium is simply debris now and no further use.
end

----

global function Interact4()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	
	SayPrep("skip", "")
	if player:IsEqual(doctor) then	
		--VO
		--Examine Dalekanium debris (after wires removed by Daleks)
			doctor::SID_0890:They disconnected my circuit. I imagine they didn't appreciate the science.
	else
		--VO
		--Examine Dalekanium debris (after wires removed by Daleks)
			amy::SID_0891:Seems like they disabled the trap that we set. Shame.
	end
end

----

global function Interact()
	local object_states = FindNodeByName("object_states_script")

	--Start
	if object_states.script.DebrisState == 1 then
		Interact1()
	--Use Wiring (see below)
	elseif object_states.script.DebrisState == 2 then
		Interact2()
	--CS17
	elseif object_states.script.DebrisState == 3 then
		Interact3()
	--CS18
	else 
		Interact4()
	end
end

----

global function Use()
	local doctor = GetActor("doctor")
	local wiring = FindNodeByName("wiring")
	local object_states = FindNodeByName("object_states_script")
	local wire_time = FindNodeByName("wiring_time")
	local common_scripts = FindNodeByName("common_scripts")
	
	if doctor:IsUsingInventoryItem(wiring) then
		SayPrep("skip", "")
		wire_time:Trigger()
		doctor:RemoveInventoryItem(wiring)
		object_states.script.DebrisState = 2
		object_states.script.Connected = true
		SetGlobalObjectiveState("Dalek_3_1_1", 3)
		SetGlobalObjectiveState("Dalek_3_1_2", 2)
	else
		--must be using Sonic screwdriver
		common_scripts.script.RandomRefusal()
	end
end
