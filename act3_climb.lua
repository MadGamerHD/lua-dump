global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local player = FindPlayer()
	local eye_stalk = FindNodeByName("eye_stalk")
	local beam_gun = FindNodeByName("beam_gun")
	
	SayPrep("skip", "")
	if player:IsEqual(doctor) then		
	--VO
	--Climb back up to council chamber
		doctor::SID_0894:I need to get the Visualiser working and should hurry back down.
	elseif amy:IsInventoryItem(eye_stalk) and amy:IsInventoryItem(beam_gun) then
	--VO
	--Climb back up to council chamber (with disruptor parts)
		amy::SID_0895:I should get back to the Doctor with these parts.
	else
	--VO
	--Attempt to climb back up to council chamber (without disruptor parts)
		amy::SID_0896:The parts I need are back in the Production Facility. I should go back.
	end
end
