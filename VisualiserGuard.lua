global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local dalek = FindNodeByTag("VisualiserDalekActor")
	local dalekEntity = FindNodeByTag("visualiserDalek")
	local lookat = FindNodeByTag("VisualiserDalekLookAt")
	local alarm = FindNodeByName("skaro_alarm")
	local doorScript = FindNodeByTag("VisualiserGuardDoorScript")
	ShowLetterBox()

	doctor:SetBehaviour("wait")
	dalekEntity:Wake()
	dalekEntity:Show()
	StopMusic()
	
	Wait(1)
	doctor:GetTransform():Hide()
	amy:GetTransform():Hide()
	doorScript.script.ForceOpenDoor()
	alarm:Trigger()
	
	Wait(1)
	alarm:StopTrigger()	

	Wait(2)
	dalek:SetFocus(lookat)

	Wait(0.5)
	dalek:SetAim(lookat)

	Wait(0.5)
	dalek:Fire()
end

global function End()
	local doctor = GetActor("doctor")

	doctor:Die("beam")
end