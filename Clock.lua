global script_node
global FirstExamine
FirstExamine = 0

global function Interact()
	local amy = GetActor("amy")
	local loc = FindNodeByName("amy_open")
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_InteractHigh") --2.3
	local clock = FindNodeByName("ClockProp")

	amy:SetBehaviour("wait")
	amy:SetTarget(loc)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	
	Wait(1)
	amy:PlayAnim(anim,1,0.1)
	
	Wait(2.2)
	FindNodeByName("Safe_Open_Sound"):Trigger()
	clock:MoveOnPivot(FindNodeByName("ClockPos2"), 1, "lerp",FindNodeByName("ClockPos1"))
	FindNodeByName("LaserInteractable"):Wake()

	amy:SetBehaviour("pc")
	FindNodeByName("ClockInteract"):Sleep()
end

global function InteractFact()
	local CountScript = FindNodeByName("DrawingObjectiveScript")
	if (FirstExamine == 0) then
		FirstExamine = 1
		CountScript.script.AddToCount()
	end
	
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
	OverlayManager:ShowFact("FACT_CLOCK_TITLE","FACT_CLOCK_DESC")
	CountScript.script.CheckForCompletion()
end