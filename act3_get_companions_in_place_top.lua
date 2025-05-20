

global function Trigger()


	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")

	local amy_loc = FindNodeByName("loc_pre_amy")
	local chis_loc = FindNodeByName("loc_pre_chisholm")


		amy:SetTarget(amy_loc)
		amy:SetMaxSpeed(2)
		amy:SetBehaviour("move")

		chisholm:SetTarget(chis_loc)
		chisholm:SetMaxSpeed(2)
		chisholm:SetBehaviour("move")

end