global script_node

global function ReachedLocation()
	local doctor = GetActor("doctor")

	SayPrep("skip","async")
	
	SetPOIPosAndLookZ(FindNodeByName("DateLookat"))
	BeginPOI(2, 400, 3, true, true)

	doctor:PlayAnim(FindNodeByTag("TheDoctor_Anim_IdleToCrouch"),0.8,0.2)

	FindNodeByName("TickerNoise"):Trigger()
	FindNodeByTag("DateFlip"):Trigger()
	
	Wait(1)
	FindNodeByName("TickerNoise"):StopTrigger()
	FindNodeByTag("Date1"):Hide()
	FindNodeByTag("Date2"):Show()
	
	Wait(1)
	FindNodeByName("TickerNoise"):Trigger()
	
	Wait(1)
	FindNodeByName("TickerNoise"):StopTrigger()

	--INT. TARDIS CONTROL ROOM - DAY
	--The date on the panel suddenly changes to another date.
	--It flicks back again. And keeps jumping between two dates.
		doctor::SID_1173:Make your mind up. Am I here, or a thousand years in the future?  Here or future? Here? Future?

	FindNodeByName("Console6InteractableScript").script.Object7State = 1
	FindNodeByTag("Date2"):Hide()
	FindNodeByTag("Date1"):Show()
	
	Wait(1)
	FindNodeByName("TickerNoise"):Trigger()
	
	Wait(1)
	FindNodeByName("TickerNoise"):StopTrigger()
	FindNodeByTag("Date1"):Hide()
	FindNodeByTag("Date2"):Show()
	
	Wait(1)
	FindNodeByName("TickerNoise"):Trigger()
	
	Wait(1)
	FindNodeByName("AllControlsScript").script.InteractDone()
	StopPOIWait()
	ResetPlayerCamera()
	FindNodeByName("TickerNoise"):Sleep()
	
	Wait(1)
	FindNodeByTag("DateFlip"):Sleep()
	
	--Find the Date Bank (done)
	SetGlobalObjectiveState("Objective_2_1_1", 3)
end

global function Interact()
	local doctor = GetActor("doctor")
	
	ShowLetterBox()
	
	doctor:SetMoveTime(0.5)
	doctor:SetTarget(FindNodeByName("DateStand"))
	doctor:SetBehaviour("move")	
	doctor:SetCallback(script_node, "ReachedLocation")
	
	FindNodeByName("Object_7_1"):Sleep()
end

global function Use()
	FindNodeByName("CommonScripts"):RandomRefusal()
end