global script_node
global FirstExamine
FirstExamine = 0


global function Interact()
	local CountScript = FindNodeByName("DrawingObjectiveScript")
	if (FirstExamine == 0) then
		FirstExamine = 1
		CountScript.script.AddToCount()
	end
	
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
	OverlayManager:ShowFact("FACT_STAFF_TITLE","FACT_STAFF_DESC")
	CountScript.script.CheckForCompletion()

end

global function Use()
	local RandomRef = FindNodeByName("RandomRefusalScript")
	RandomRef.script.RandomRefusal()
end

