global function Interact()
	FindNodeByName("Ob_5_4Sound"):Trigger()
	FindNodeByName("Console5InteractableScript").script.Object4State = 1
	FindNodeByName("AllControlsScript").script.TurnOffInterface()
	FindNodeByName("AllControlsScript").script.InteractDone()
end

global function Use()
end
