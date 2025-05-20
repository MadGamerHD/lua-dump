local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Interact()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--FACT
	--OverlayManager:ShowFact("FACT_BATTERY_TITLE","FACT_BATTERY_DESC")
	OverlayManager:ShowFact("CYBERMEN_FACT01_TITLE","CYBERMEN_FACT01_01")
	--OverlayManager:ShowHint("CYBERMEN_FACT01_TITLE","CYBERMEN_FACT01_01 CYBERMEN_FACT01_01", "hint_blank.tga hint_blank.tga hint_blank.tga", 0, 0, 5)
end