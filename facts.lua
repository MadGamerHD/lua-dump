local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

--ACT 1
--FACT_SEAWATER_TITLE	(door)
--FACT_PRESSURE_TITLE	(airlock)
--FACT_POD_TITLE		(pods)
--FACT_VEGE_TITLE		(ingreds)

global function InteractWater()
	OverlayManager:ShowFact("FACT_SEAWATER_TITLE","FACT_SEAWATER_DESC")
end

global function InteractAirlock()
	OverlayManager:ShowFact("FACT_PRESSURE_TITLE","FACT_PRESSURE_DESC")
end

global function InteractPod()
	OverlayManager:ShowFact("FACT_POD_TITLE","FACT_POD_DESC")
end

global function InteractVeg()
	OverlayManager:ShowFact("FACT_VEGE_TITLE","FACT_VEGE_DESC")
end

--ACT 2
--FACT_NUCLEAR_TITLE 	(done)
--FACT_WARMING_TITLE 	(done)
--FACT_NYH_TITLE 		(done)
--FACT_VASHTA_TITLE 	(done)
--FACT_DIVING_TITLE 	(done)
--FACT_RAD_TITLE		(done)

global function InteractStone()
	OverlayManager:ShowFact("FACT_WARMING_TITLE","FACT_WARMING_DESC")
end

global function InteractBed()
	OverlayManager:ShowFact("FACT_NYH_TITLE","FACT_NYH_DESC")
end

global function InteractSign()
	OverlayManager:ShowFact("FACT_NUCLEAR_TITLE","FACT_NUCLEAR_DESC")
end

global function InteractVashta()
	OverlayManager:ShowFact("FACT_VASHTA_TITLE","FACT_VASHTA_DESC")
end

global function InteractSkeleton()
	OverlayManager:ShowFact("FACT_DIVING_TITLE","FACT_DIVING_DESC")
end

global function InteractTrig()
	OverlayManager:ShowFact("FACT_RAD_TITLE","FACT_RAD_DESC")
end

--ACT 3
--FACT_SHARK_TITLE	(porthole)
--FACT_USS_TITLE 		(plaque)

global function InteractPlaq()
	OverlayManager:ShowFact("FACT_USS_TITLE","FACT_USS_DESC")
end

global function InteractHole()
	OverlayManager:ShowFact("FACT_SHARK_TITLE","FACT_SHARK_DESC")
end

