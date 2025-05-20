local common_scripts = FindNodeByName("common_scripts")

global function Interact()

	local doctor =GetActor("doctor")
	local amy =GetActor("amy")
	local doctor_player =common_scripts.script.DoctorIsPlayer()
	if(doctor_player) then	
		--VO
		doctor::SID_2028:I've set the door to stay open.
	else
		--VO
		amy::SID_2029: The Doctor has unlocked this door.
	end
end

global function Use()
	local keycard = FindNodeByName("key_card")
	local doctor = GetActor("doctor")
	if (doctor:IsUsingInventoryItem(keycard)) then
		--VO
		--using item on open door
		doctor::SID_2030: The door is already open.
	else
		common_scripts.script.RandomRefusal()
	end

end
