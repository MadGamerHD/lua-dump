global script_node
global FirstExamine

FirstExamine = 0

global function Interact()
	if (FindNodeByName("CommonScripts").script.DoctorIsPlayer())then
		local doctor = GetActor("doctor")
		local doc_loc = FindNodeByName("FobInteractLoc")
		local pickup = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractHigh") --3.4
		local crystal = FindNodeByName("KontronCrystal")
		local watch =  FindNodeByName("FobWatch")

		doctor:SetTarget(doc_loc)
		doctor:SetMoveTime(1.5)
		doctor:SetBehaviour("move")

		SayPrep("skip","async")
		--VO
		--The Doc picks up the Fob
			doctor::SID_2507:My Fob Watch. Perfect device for keeping track of time.
		
		Wait(2)
		doctor:PlayAnim(pickup,1,0.1)
		
		Wait(2)
		FindNodeByTag("FobWatchEntity"):Hide()
		doctor:AddInventoryItem(watch)

		--Find something to keep track of time (done)
		SetGlobalObjectiveState("Objective_2_2_1", 3)

		Wait(1)
		if (not doctor:IsInventoryItem(crystal)) then
			--VO
			--The doctor has picked up the Fob watch, and now just needs to find the kontron crystal
				doctor::SID_1576:Now I just need something to focus and hold the time in place.
		else
			--VO
			--Doc has both objects fob and crystal
				doctor::SID_2508:Great that's everything I need. I need to get back to the Control Room.
	
			--note:player has both objects
			--Assemble Tachyon Feedback Loop (active)
			SetGlobalObjectiveState("Objective_2_2_3", 2)
		end	
	
		doctor:SetBehaviour("pc")
		
		FindNodeByName("FobInteract"):Sleep()
	else
		local CountScript = FindNodeByName("DrawingObjectiveScript")
		
		if (FirstExamine == 0) then
			FirstExamine = 1
			CountScript.script.AddToCount()
		end
	
		FindManagerByName("EmAdventureGame_OverlayManager"):ShowFact("FACT_FOB_TITLE","FACT_FOB_DESC")
		CountScript.script.CheckForCompletion()
	end
end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end
