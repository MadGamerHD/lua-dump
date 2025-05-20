
global function run_cutscene()
	local focus_node = FindNodeByName("loc_cs4_chisholm_end")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	
	
--	local loc_node =FindNodeByName("loc_cs4_doc_end")
--	doctor:Teleport(loc_node)
--	local amy_node =FindNodeByName("loc_cs4_amy_end")
--	amy:Teleport(amy_node)
--	ShowLetterBox()
	
	
	SayPrep("","")
	doctor:SetFocus(focus_node)
	Wait(1)
	amy:SetFocus(doctor)
	--OPTION 3: If No-one has picked up the SatNav
	amy::SID_0093:So what do we do?
	amy:SetTarget(doctor)
		amy:Face(0.5,"lerp")
		
				--rubbing hands together
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking3") --3.76s
		doctor:PlayAnim(anim, 1, 0)
	
	doctor::SID_0094:Did I tell you Conan Doyle based Sherlock Holmes on my powers of observation and deduction? 
	doctor:SetFocus(amy)
	--*EDIT had to cut up one line (0094) into two.
	doctor::SID_1018: Let's look around. There's always a clue to go on.
	amy:ClearFocus()
	doctor:ClearFocus()
	
	AddGlobalObjective("Cyber_1_6")
	--Find the sat nav
	--SetGlobalObjectiveState("Cyber_1_6_1", 2) -- 2 is unlock, 3 is done
	--Hook the Satnav to the TARDIS
	--SetGlobalObjectiveState("Cyber_1_6_2", 2) -- 2 is unlock, 3 is done
	
	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.chisholm_down_again = true
	
	local chisholm_int = FindNodeByName("int_chisholm_examine")
	chisholm_int:Trigger()
	chisholm_int = FindNodeByName("int_chisholm")
	chisholm_int:StopTrigger()
	
	
end
