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
			doctor::SID_1879:I have both components so I need to get back to Amy rather than explore.
	else	
		--VO
		--Trying to get into the visuliser area from the other side of the tower before chronon blocker has been created (not got items).
			doctor::SID_1032:This is the Visualiser Room. I need to go back until I've found both components of the Chronon Blocker.
	end
end

global function End()
	local doctor = GetActor("doctor")

	HideLetterBox()
	FreeActorCamera()
	doctor:SetBehaviour("pc")
end
