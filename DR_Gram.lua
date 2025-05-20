global script_node
global FirstExamine
FirstExamine = 0

global function Interact()
	local CountScript = FindNodeByName("DrawingObjectiveScript")
	if (FirstExamine == 0) then
		FirstExamine = 1
		CountScript.script.AddToCount()
	end
	FindManagerByName("EmAdventureGame_OverlayManager"):ShowFact("FACT_GRAM_TITLE","FACT_GRAM_DESC")
	CountScript.script.CheckForCompletion()
end

