local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Interact()
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")
	--FACT
	OverlayManager:ShowFact("FACT_NEWD_TITLE","FACT_NEWD_DESC")
end

global function Use()
	local docScript = FindNodeByName("DoctorScript_0")
	docScript.script.NoPoint()
end