global script_node
global state

global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
	--VO
	--Interacting with manacle.
		doctor::SID_2211:The manacles are locked tight.
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local doc_man3 = FindNodeByName("doc_man3")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local int_man3 = FindNodeByName("int_man3")
	local manacle1 = FindNodeByName("script_manacle1")
	local manacle2 = FindNodeByName("script_manacle2")	
	local manacle3 = FindNodeByName("script_manacle3")	
	local click1 = FindNodeByName("click1")
	local bang3 = FindNodeByTag("open_bang3")
	local closed = FindNodeByName("Manacle3")
	local open = FindNodeByShortName("EM_ENTITY_manacles_open_1")	
	local doctors_head_locator = doctor:FindNodeByTag("head_locator")

	int_man3:StopTrigger()
		
	doctor:SetTarget(doc_man3)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	
	Wait(2.5)
	amy:SetFocus(closed)
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
	doctor:PlayAnim(anim, 1, 0.1)

	Wait(2.5)
	click1:Trigger()
	bang3:Trigger()
	
	amy:SetFocus(doctors_head_locator)
	Wait(0.2)
	closed:Hide()
	open:Trigger()

	state = 1

	if manacle2.script.state==1 and manacle3.script.state==1 then
		manacle1.script.Amy_Freed()
	else
		doctor:SetBehaviour("pc")	
		amy::SID_2409:Gasp.
	end
	
	bang3:StopTrigger()
end
