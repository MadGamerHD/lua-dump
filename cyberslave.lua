global died_already
global first
global script_node

first = true

global function Init()
	if(died_already) then
		local cyberslave = GetActor("cyberslave0")
		cyberslave:SetBehaviour("wait")
		local anim = FindNodeByPartialName("Anim_CYS_Death")
		cyberslave:PlayAnim(anim, 1000, 0)
		cyberslave:DisableSensors()
	end
end

global function Idle()
	local cyberslave = GetActor("cyberslave0")
	if cyberslave:GetBehaviour() == "follow" then
		local dialogue_script = FindNodeByName("lua_cyberslave0_dialogue")
		local voice = Random(6)
		if(voice == 1) then
			dialogue_script.script.MustElimate()
		elseif(voice == 2) then
			dialogue_script.script.Die()
		end
		
	end
	Wait(10)
		
end

global function Interact()
	local int_pickup = FindNodeByName("int_pickup")
	
	if(first) then
		int_pickup:StopTrigger()
		first = false
		local cutscene = FindNodeByName("first_slave_down1")
		cutscene:Trigger()
	else
		local doctor =GetActor("doctor")
		local amy =GetActor("amy")
		local common_scripts = FindNodeByName("common_scripts")
		local doctor_player =common_scripts.script.DoctorIsPlayer()
		if(doctor_player) then	
			--VO
			--Interacting with dead cyber
			doctor::SID_2204:Poor chap.
		else
			--VO
			--Interacting with dead cyber
			amy::SID_2205:I killed him. I had no choice.
		end
	end
end
