global function Interact()

	local amy=GetActor("amy")
	local doctor = GetActor("doctor")
	SayPrep("skip", "")	
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	

	--VO
	--examine retinal scanner on lift
	doctor::SID_1289: There's a heavy Security Lock on this Lift.
	else
		--VO
		--examine retinal scanner on lift
		amy::SID_1886:I think it's a lift. But it's locked.
	end
	

end


global function Use()
	local doctor=GetActor("doctor")
	local sonic = FindNodeByName("Screwdriver")
	if (doctor:IsUsingInventoryItem(sonic)) then
		--VO
		--using sonic with the ret scanner
		doctor::SID_2026:It's deadlocked. What a shame.
	else
		local common_scripts=FindNodeByName("common_scripts")
		common_scripts.script.RandomRefusal()
	end

end
