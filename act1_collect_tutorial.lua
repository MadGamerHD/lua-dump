global script_node
local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")

global function Trigger()

	OverlayManager:ShowTutorial("COLLECTIONS")
	Wait(2)
	script_node:StopTrigger()

end