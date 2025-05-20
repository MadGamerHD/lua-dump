global function Interact()
	local amy = GetActor("amy")
	local laser = FindNodeByTag("Laser_Screw")
	local interactable = FindNodeByName("LaserInteractable")
	local cut_7 = FindNodeByName("Cut_7")
	
	laser:Hide()
	interactable:Sleep()
	
	cut_7:Trigger()
end
