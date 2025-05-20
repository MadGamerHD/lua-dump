global function Interact()
	local doctor = GetActor("doctor")
	local TimeBandage = FindNodeByName("TimeBandage")	
	local Osc = FindNodeByName("Oscillator")
	
	if doctor:IsInventoryItem(TimeBandage) then
		--VO
		--Doctor interacts with Fabricator Dispensor
			doctor::SID_2504:This is a good place to store the Tachyon Feedback Loop for Amy.
	elseif doctor:IsInventoryItem(Osc) then
		--VO
		--Doctor has used the TFL with dispensor (and has osc)
			doctor::SID_2547:The Loop is in place but I can't get it to Amy without boosting power via the Voltmeter.
	else
		--VO
		--Doctor has used the TFL with dispensor
			doctor::SID_2505:The Tachyon Feedback Loop is in place, now I need to find an Oscillator device to boost the power.
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local TimeBandage = FindNodeByName("TimeBandage")
	local int_low = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractOnTable") 
	local dispensor_sound = FindNodeByName("dispensor")
	local beacon_fact = FindNodeByName("OscillatorFactInteract")
	local beacon_pickup = FindNodeByName("OscillatorInteract")
	
	if doctor:IsUsingInventoryItem(TimeBandage) then
		doctor:SetMoveTime(1)
		doctor:SetTarget(FindNodeByName("Stand5"))
		doctor:SetBehaviour("move")
		
		Wait(1)
		doctor:PlayAnim(int_low,1,0.2)

		SayPrep("","async")
		Wait(5)
		--VO
		--Doctor has used the TFL with dispensor
			doctor::SID_2506:That's got the Loop in the Dispensor, now to boost the power so I can send it to Amy.
		
		dispensor_sound:Trigger()					
		doctor:RemoveInventoryItem(TimeBandage)
		beacon_fact:StopTrigger()
		beacon_pickup:Trigger()
		--voltmeter
		FindNodeByName("Object_6_3"):Wake()
		
		--Use the Tachyon Feedback Loop with the Console (done)
		SetGlobalObjectiveState("Objective_2_3_1", 3)
		--Find a device with an Oscillator function (active)
		SetGlobalObjectiveState("Objective_2_3_2", 2)		
		
		doctor:SetBehaviour("pc")
	else
		FindNodeByName("CommonScripts").script.RandomRefusal()	
	end
end
