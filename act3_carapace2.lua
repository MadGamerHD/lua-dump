global function Interact()
	local doctor = GetActor("doctor")

	SayPrep("skip", "")	
	
	--CHANGE THIS TO:
	--"They might not stay blinded for long. I have to hurry."
	
	--VO
	--Examine Emperor's empty Carapace
		doctor::SID_0770:Not so full of himself now, is he?
end