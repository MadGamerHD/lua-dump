global model
global script_node
global MessCaddieCollected



MessCaddieCollected = false

global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	
	if (MessCaddieCollected) then
		--VO
		--Interacting with the backpack a second time.
		doctor::SID_0032: There's nothing else of any use in the Backpack.
		doctor:SetBehaviour("pc")
	else
		local doctor = GetActor("doctor")
		local SwitchLocator = FindNodeByShortName("EM_ENTITY_backpack:0")
		doctor:SetTarget(SwitchLocator)
		doctor:SetCallback(script_node, "InteractMoveFinished")
		doctor:SetMoveTime(1)
		doctor:SetMoveNearbyDistance(0.9)
		doctor:SetBehaviour("move")
	end
end

global function InteractMoveFinished()
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor") -- 5.97s
--	doctor:SetCallback(script_node, "InteractAnimFinished")
	doctor:PlayAnim(anim, 1, 1)
	--doctor:DisableAnimLoop()
--end

--global function InteractAnimFinished()

	local doctor = GetActor("doctor")
	--doctor:SetBehaviour("wait")
	local MessCaddie = script_node:FindInventoryItem()
	SayPrep("skip", "async")
	

	--VO
	--Interacting with the backpack
	doctor::SID_0033:This must be the poor fellow's Backpack. I'll take his Mess Caddie; every Arctic explorer's essential.
	doctor:AddInventoryItem(MessCaddie)
	MessCaddieCollected = true
	Wait(6)
	doctor:SetBehaviour("pc")

	--find the mess caddie
	SetGlobalObjectiveState("Cyber_1_2_1", 3) -- 2 is unlock, 3 is done
	--fill the mess caddie
	SetGlobalObjectiveState("Cyber_1_2_2", 2) -- 2 is unlock, 3 is done
	--give the driver his drink
	SetGlobalObjectiveState("Cyber_1_2_3", 2) -- 2 is unlock, 3 is done
	
	local tutorial_script = FindNodeByName("script_act1_tutorials")
	if(tutorial_script.script.next_hint == 4) then
		tutorial_script.script.Trigger()

	end
	local int_node = FindNodeByName("int_backpack_examine")
	int_node:Trigger()
	int_node = FindNodeByName("int_backpack")
	int_node:StopTrigger()
	SayPrep("skip", "")
	
end

