global function Start()
	local doctor = GetActor("doctor")
	local Coil = FindNodeByName("DalekaniumCoilObj")
	local Crystal = FindNodeByName("CrystalObj")

	doctor:SetBehaviour("wait")	
	LockActorCamera()
	ShowLetterBox()

	if doctor:IsInventoryItem(Coil) and doctor:IsInventoryItem(Crystal) then
		--VO
		--Trying to enter the visuliser area before making chronon for Amy (got items)
			doctor::SID_1878:I have both the items so I should get back to Amy.
	else
		--VO
		--Trying to enter the visuliser area before making chronon for Amy (not got items)
			doctor::SID_1034:Ah, the Visualiser Room. The Production Facility must be the other way.
	end
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	FreeActorCamera()
	doctor:SetBehaviour("pc")
end
