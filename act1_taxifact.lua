local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Interact()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--FACT
	OverlayManager:ShowFact("FACT_HACKNEY_TITLE","FACT_HACKNEY_DESC")
end