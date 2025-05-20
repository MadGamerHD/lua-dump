global script_node

global function Interact()
	local doctor = GetActor("doctor")
	local CrysTarget = FindNodeByName("CrystalGrabLoc")

	doctor:SetTarget(CrysTarget)
	doctor:SetMoveTime(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "CrstalGrabMoveFinish")
end

global function CrstalGrabMoveFinish()
	local doctor = GetActor("doctor")
	local crystal = FindNodeByName("CrystalObj")
	local InteractAnim = FindNodeByPartialName("Anim_DRW_InteractOnTable")

	SayPrep("skip","async")

	if (not doctor:IsInventoryItem(crystal)) then
		doctor:AddInventoryItem(crystal)
		doctor:PlayAnim(InteractAnim , 1, 0)
		doctor:SetCallback(script_node,"CrystalFinishAnim")
				
		--VO
		--Pick up Kontron Crystal
			doctor::SID_0623:A Kontron Crystal. Just what I need.
	end
end

global function CrystalFinishAnim()
	local doctor = GetActor("doctor")
	local DalekaniumCoil = FindNodeByName("DalekaniumCoilObj")
	local cyrstalWorldObj = FindNodeByTag("KontronCrystal")
	local cyrstalIteractWorldObj = FindNodeByTag("kontronCrystalInteract")
	local CCScript = FindNodeByName("coil_and_crystal")
	
	cyrstalWorldObj:Hide()
	cyrstalWorldObj:Sleep()
	cyrstalIteractWorldObj:ScaleDownOff(cyrstalWorldObj)
	cyrstalIteractWorldObj:Hide()
	cyrstalIteractWorldObj:Sleep()
	doctor:EnableWalls()
	doctor:EnablePhysics()

	SetGlobalObjectiveState("Dalek_2_2_3", 3)
	
	if (doctor:IsInventoryItem(DalekaniumCoil)) then
		CCScript.script.PlayObjectiveCompleteMessage()
	else
		--VO
		--Prompt to find Coil
			doctor::SID_1877:Now I need to find that Dalekanium Coil.

		doctor:SetBehaviour("pc")
		SaveCheckpoint()
	end
end

global function Use()
	local docScript = FindNodeByName("DoctorScript_0")
	docScript.script.NoPoint()
end
