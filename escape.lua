global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local dalek = GetActor("dalek")
	local dalek3 = GetActor("dalek3")
	local dalek5 = GetActor("dalek5")
	local dalek6 = GetActor("dalek6")
	local ladder_locator = FindNodeByName("ladder_locator")
	local doctor_start_locator = FindNodeByName("doctor_escape_start")
	local amy_start_locator = FindNodeByName("amy_escape_start")
	local doctor_manhole = FindNodeByName("doctor_manhole")
	local amy_manhole = FindNodeByName("amy_manhole")
	local tripwire1 = FindNodeByShortName("EM_ENTITY_tripwire1:0")
	local tripwire2 = FindNodeByShortName("EM_ENTITY_tripwire2:0")
	local bang = FindNodeByName("dynamite_bang")
	local traf_amb = FindNodeByName("traf_amb")
	local sub_amb = FindNodeByName("sub_amb")
	local patrol2 = FindNodeByName("patrol2")

	SayPrep("skip", "")

	ShowLetterBox()
	--[ladder camera]
	doctor:SetBehaviour("wait")
	doctor:Teleport(doctor_start_locator)
	amy:DisablePhysics()
	amy:SetBehaviour("wait")
	Wait(0.1)
	amy:Teleport(amy_start_locator)

	--doctor beckon idle from car push
		--doctor::Up you go Amy.
	--amy:SetTarget(ladder_locator)
	--amy:SetMaxSpeed(3)
	--amy:SetBehaviour("move")
	--[dyno camera]
		--sylvia::I'll need to set this trap.
	--sylvia:PlayAnim(sylvia_interact_low,1,1)
	--amy:Teleport(amy_manhole)
	--[ladder camera]

	Wait(6.9)
	tripwire2:Trigger()

	--doctor:SetTarget(ladder_locator)
	--doctor:SetMaxSpeed(3)
	--doctor:SetBehaviour("move")
		--doctor::Hurry!
	--[dyno camera]
	--sylvia:PlayAnim(sylvia_interact_med,1,1)
	--dalek moves on spline1 (into shot)
	--[ladder camera]

	Wait(3)
	tripwire1:Trigger()

		--doctor::Sylvia! 
	--[dyno camera]
		--dalek::Exterminate! 
		--sylvia::Run! Doctor! Run!
		--dalek::Exterminate!
	
	Wait(2)
	dalek3:SetFocus(sylvia:GetTransform())
	dalek3:SetTarget(sylvia:GetTransform())
	dalek3:Face(1,"sine")

	Wait(3)
	--dalek beam fx and sound
	--*sylvia death anim

		--sylvia::Argh!
	--[ladder camera]
		--doctor::No!
	--[dyno camera]
	--dalek moves on spline2 (through trap)
	--explosion fx and sound 

	Wait(2.5)
	bang:Trigger()

		--dalek::Argh!
	--ShowFade()
	
	Wait(1.5)
	sub_amb:StopTrigger()
	dalek:SetSpline(patrol2) 
	dalek:SetBehaviour("patrol")
	dalek5:GetTransform():Trigger()
	dalek6:GetTransform():Trigger()
	
	--doctor:Teleport(doctor_manhole)
		--HideFade()
	
	Wait(1)
	traf_amb:Trigger()

	--[manhole camera]
	--chars dust themselves off
		--amy::They killed her! 
	--The Doctor looks at her. Grim. 
		--doctor::We have to get back to the TARDIS!
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local manhole_start = FindNodeByName("interact_manhole_start")	
	local manhole_end = FindNodeByName("interact_manhole_end")	
	local tardis_start = FindNodeByName("interact_tardis_start")	
	local tardis_end = FindNodeByName("interact_tardis_end")	
	local exit_stealth = FindNodeByName("stealth_toggle_fromtaxi")
		
	doctor:SetBehaviour("pc")
	doctor:EnableWalls()
	doctor:EnableStealth()
	amy:SetTargetToDefault()
	amy:SetBehaviour("follow")
	amy:EnableWalls()
	amy:EnableStealth()
	amy:EnablePhysics()
	
	manhole_start:StopTrigger()
	manhole_end:Trigger()
	tardis_start:StopTrigger()
	tardis_end:Trigger()
	exit_stealth:StopTrigger()
	HideLetterBox()
	
	SetGlobalObjectiveState("Dalek_1_3_3", 3)
	AddGlobalObjective("Dalek_1_4")
end