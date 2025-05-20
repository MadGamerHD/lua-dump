global script_node
global FirstExamine
FirstExamine = 0

global function MoveToComplete()
	local OscWorld = FindNodeByTag("OscillatorWorldObj")
	local OscInv = FindNodeByName("Oscillator")
	local doctor = GetActor("doctor")
	local InteractAnim = FindNodeByPartialName("Anim_DRW_InteractOnTable")
		
	doctor:PlayAnim(InteractAnim , 1, 0.2)
	
	Wait(1.5)
	OscWorld:Hide()
	doctor:AddInventoryItem(OscInv)
	FindNodeByTag("OscillatorInteract"):Sleep()
	
	SayPrep("skip","async")
	
	--VO 
	--The doctor picks up the oscillator
		doctor::SID_1574:I recognise that Distress Beacon. And it contains an Oscillator.
	
	--Find a device with an Oscillator function (done)
	SetGlobalObjectiveState("Objective_2_3_2", 3)
	--Use Oscillator to boost TARDIS power via the Voltmeter (active)
	SetGlobalObjectiveState("Objective_2_3_3", 2)
	
	doctor:SetBehaviour("pc")
end

global function Interact()
	local hint = QueryObjective(0) 
	local CountScript = FindNodeByName("DrawingObjectiveScript")
	
	print(hint)
	
	--ready to pickup beacon 
	if (hint == "hint_2_3_2") then
		local doctor = GetActor("doctor")

		doctor:SetTarget(FindNodeByName("OscMove"))
		doctor:SetMoveTime(1.5)
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node, "MoveToComplete")
	else
		if (FirstExamine == 0) then
			FirstExamine = 1
			CountScript.script.AddToCount()
		end

		FindManagerByName("EmAdventureGame_OverlayManager"):ShowFact("FACT_BECON_TITLE","FACT_BECON_DESC")
		CountScript.script.CheckForCompletion()
	end
end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end
