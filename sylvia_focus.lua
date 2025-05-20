global function Trigger()
	local sylvia = GetActor("sylvia")
	local doctor_ent = FindNodeByShortName("EM_ENTITY_TheDoctor:0")

	sylvia:SetFocus(doctor_ent)
end	