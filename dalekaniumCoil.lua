global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local DalekaniumCoil = FindNodeByName("DalekaniumCoilObj")
	local CoilTarget = FindNodeByName("CoilGrabLoc")

	doctor:SetTarget(CoilTarget)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "MoveToGrab")
end

global function MoveToGrab()
	local doctor = GetActor("doctor")
	local DalekaniumCoil = FindNodeByName("DalekaniumCoilObj")
--	local InteractAnim = FindNodeByPartialName("TheDoctor_Anim_DRW_Interact1_5m")
	local InteractAnim = FindNodeByTag("1_5m")

	SayPrep("skip", "async")	
	
	if (not doctor:IsInventoryItem(DalekaniumCoil)) then
		doctor:AddInventoryItem(DalekaniumCoil)
		doctor:PlayAnim(InteractAnim, 1, 0)
		doctor:SetCallback(script_node,"FinishGrab")
				
		--VO
		--Pick up Dalekanium Coil
			doctor::SID_0624:I knew I would find a Dalekanium Coil in here. Daleks are so predictably organised.			
	end
end

global function FinishGrab()
	local doctor = GetActor("doctor")
	local coilWorldObj = FindNodeByTag("dalekaniumWorldObj")
	local coiliIteractWorldObj = FindNodeByTag("DalekaniumCoilInteract")
	local crystal = FindNodeByName("CrystalObj")
	local CCScript = FindNodeByName("coil_and_crystal")

	coilWorldObj:Hide() 
	coilWorldObj:Sleep()
	coiliIteractWorldObj:Hide()
	coiliIteractWorldObj:Sleep()
	
	SetGlobalObjectiveState("Dalek_2_2_2",3)
	
	if (doctor:IsInventoryItem(crystal)) then
		CCScript.script.PlayObjectiveCompleteMessage()
	else
		--VO
		--Prompt to find Crystal
			doctor::SID_1876:Now I need to find that Kontron Crystal.

		doctor:SetBehaviour("pc")
		SaveCheckpoint()
	end
end

global function Use()
	local docScript = FindNodeByName("DoctorScript_0")
	docScript.script.NoPoint()
end
