global script_node

global function CutStart()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local Start1 = FindNodeByName("DocConsole1")
	local Start2 = FindNodeByName("AmyConsole1")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	local shutdownSound = FindNodeByName("VisualiserShutdown_1")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	
	amy:DisableStealth()
	doctor:DisableStealth()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	doctor:DisablePhysics()
	amy:DisablePhysics()
	VisEye:Sleep()
	VisEye:Hide()
	amy:Teleport(Start2)
	doctor:Teleport(Start1)
	CutToLetterBox()
	shutdownSound:Trigger()
	VisEye:Hide()
	VisEye:CutsceneReset()
end

global function VisuliserFinishCutEnd()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	local stealth1 = FindNodeByName("ActivateStealth5")
	local stealth2 = FindNodeByName("ActivateStealth6")
	HideLetterBox()
	AddGlobalObjective("Dalek_2_4")
		
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	doctor:SetBehaviour("pc")
	stealth1:Wake()
	stealth2:Wake()
end

global function MoveToEnd()

	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local Start1 = FindNodeByName("DocEnd")
	local Start2 = FindNodeByName("AmyEnd")
	
	doctor:SetTarget(Start1)
	amy:SetTarget(Start2)
	doctor:SetMoveTime(4)
	amy:SetMoveTime(4)
	doctor:SetBehaviour("move")
	Wait(1.5)
	amy:SetBehaviour("move")

end