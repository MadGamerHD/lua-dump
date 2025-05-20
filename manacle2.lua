global script_node
global state

global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")
	--VO
	--Interacting with manacle.
		doctor::SID_2212:The manacles are locked tight.
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_man2 = FindNodeByName("doc_man2")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
	local int_man2 = FindNodeByName("int_man2")
	local manacle1 = FindNodeByName("script_manacle1")
	local manacle2 = FindNodeByName("script_manacle2")		
	local manacle3 = FindNodeByName("script_manacle3")	
	local click1 = FindNodeByName("click1")
	local bang2 = FindNodeByTag("open_bang2")
	local closed = FindNodeByName("Manacle2")
	local open = FindNodeByShortName("EM_ENTITY_manacles_open:0")
	local doctors_head_locator = doctor:FindNodeByTag("head_locator")

	int_man2:StopTrigger()
		
	doctor:SetTarget(doc_man2)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
		
	Wait(2.5)
	amy:SetFocus(closed)
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
	doctor:PlayAnim(anim, 1, 0.1)
	
	Wait(2.5)
	click1:Trigger()
	bang2:Trigger()

	amy:SetFocus(doctors_head_locator)
	Wait(0.2)
	closed:Hide()
	open:Trigger()

	state = 1

	if manacle2.script.state==1 and manacle3.script.state==1 then
		manacle1.script.Amy_Freed()
	else
		doctor:SetBehaviour("pc")
		amy::SID_2410:Gasp.
	end

	bang2:StopTrigger()
end
