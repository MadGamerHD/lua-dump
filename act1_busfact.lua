local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Interact()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--FACT
	OverlayManager:ShowFact("FACT_BUS_TITLE","FACT_BUS_DESC")
end