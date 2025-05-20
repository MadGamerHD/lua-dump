local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")


global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	doctor:DisableStealth()
	amy:DisableStealth()

end

global function End()
	local doctor = GetActor("doctor")
	doctor:ClearFocus()
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()

	
end

global function EndWithAmy()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	--ResetPlayerCamera()
end

global function EndWithAmyStealth()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	HideLetterBox()
	doctor:EnableStealth()
	amy:EnableStealth()
	
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")

end

global function Trigger()
	local doctor = GetActor("doctor")
	local doctor_crouch = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_KneeltoIdle") --1.63s
	doctor:PlayAnimAndWait(doctor_crouch,1,0)
end

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	doctor:SetBehaviour("pc")
	--local doc_int = FindNodeByName("int_doctor")
	--doc_int:Trigger() --make doctor interactable when Amy is it.
	
end