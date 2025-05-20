local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")


--act1
global function fact_glacier()  --ICE?
	--Glacier fact
	OverlayManager:ShowFact("FACT_ICE_TITLE","FACT_ICE_DESC")
end

global function fact_skidoo()
	--Fallen Skidoo fact
	OverlayManager:ShowFact("FACT_SKIDOO_TITLE","FACT_SKIDOO_DESC")
end

--act2
global function fact_geology()
	--machinery outside
	OverlayManager:ShowFact("FACT_GEOLOGY_TITLE","FACT_GEOLOGY_DESC")
end

global function fact_nano_technology()
	--lab equipment
	OverlayManager:ShowFact("FACT_NANO_TITLE","FACT_NANO_DESC")
end

global function fact_cybermen()
	-- cyber arm
	OverlayManager:ShowFact("FACT_CYBERMEN_TITLE","FACT_CYBERMEN_DESC")
end

global function fact_arctic_circle()
	--map on wall
	OverlayManager:ShowFact("FACT_ARCTIC_TITLE","FACT_ARCTIC_DESC")
end

global function fact_cyber_biology()
	--Fallen cyberslave
	OverlayManager:ShowFact("FACT_BIOLOGY_TITLE","FACT_BIOLOGY_DESC") 
end

--act3
global function fact_absolute_zero()
	--Frozen equipment in tunnels
	OverlayManager:ShowFact("FACT_ZERO_TITLE","FACT_ZERO_DESC")
end

global function fact_cryogenics()
	--panel in mothership corridor
	OverlayManager:ShowFact("FACT_CRYOGENICS_TITLE","FACT_CRYOGENICS_DESC")
end

global function fact_cyber_conversion()
	--panel in conversion chamber
	OverlayManager:ShowFact("FACT_CONVERSION_TITLE","FACT_CONVERSION_DESC")
end

global function Trigger()
	--panel in conversion chamber
	OverlayManager:ShowFact("FACT_NANO_TITLE","FACT_NANO_DESC")
end