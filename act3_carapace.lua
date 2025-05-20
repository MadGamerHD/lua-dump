
global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	
	--*NOTE Talk interaction not examine to remove huge highlight but reponse is still VO
	--VO 
	--Examine Emperor's empty Carapace
		doctor::SID_0716:Not as impressive when there's nobody home.
end

global function Use()
	local doctor = GetActor("doctor")
	local wiring = FindNodeByName("wiring")
	local common_scripts = FindNodeByName("comon_scripts")

	SayPrep("skip", "")
	if doctor:IsUsingInventoryItem(wiring) then
	--VO
	--Use dalekanium wires with Emperor Carapace
		doctor::SID_0712:That won't do any good.
	else
		common_scripts.script.RandomRefusal()
	end
end

