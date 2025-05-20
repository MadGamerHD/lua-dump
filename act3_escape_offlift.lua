global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")
	local amy_loc = FindNodeByName("amy_offlift")
	local chis_loc = FindNodeByName("chis_offlift")

	amy:SetTarget(amy_loc)
	amy:SetMoveTime(1.5)
	amy:SetBehaviour("move")

	chisholm:SetTarget(chis_loc)
	chisholm:SetMoveTime(1.5)
	chisholm:SetBehaviour("move")

	Wait(1.5)
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	chisholm:SetTarget(amy)
	chisholm:SetBehaviour("follow")
end