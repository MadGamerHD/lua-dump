global script_node
global model


local doctor_jump = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_JumpGap1_5_RF")
--local doctor_jump = FindNodeByTag("TheDoctor_Anim_JumpGap")

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	doctor:SetBehaviour("wait")
	
	local loc = FindNodeByName("loc_jump1_talking_to_amy")
	doctor:Teleport(loc)
	--doctor:SetTarget(loc)
	--doctor:SetMaxSpeed(1.5)
	--doctor:SetBehaviour("move")	
	
	--find a way down to the driver
	SetGlobalObjectiveState("Cyber_1_1_2", 2) -- 2 is unlock, 3 is done
	
	ShowLetterBox()
	local cutscene = FindNodeByName("show_jump1")
	cutscene:Trigger()
	
	amy:SetTarget(doctor)
	amy:Face(0.5,"lerp")
	Wait(0.5)
	doctor:SetFocus(amy)
	amy:SetFocus(doctor)
	
	SayPrep("skip", "")
	--HINT
	--short exchange as the doctor leaves Amy to climb down the chasm.
	doctor::SID_0108: Amy, you stay here. I'll see if I can reach the Skidoo Rider down there.

	--HINT
	amy::SID_0109: Please don't fall to your death. I don't fancy living in an igloo. Not without central heating.	
	
	doctor:ClearFocus()
	amy:ClearFocus()

	local doctor_locator = script_node:FindNodeByTag("jump_tag")
	doctor:SetTarget(doctor_locator)
	--doctor:DisablePhysics()
	doctor:DisableWalls()
	doctor:SetMaxSpeed(1)
	doctor:SetBehaviour("move")
	--HINT
	doctor::SID_0110:Amy! I didn't know you cared.

	doctor:PlayAnim(doctor_jump,1,0.5)
	Wait(0.75)
	local doctor = GetActor("doctor")
	doctor:EnablePhysics()
	Wait(0.5)
	HideLetterBox()
	doctor:SetBehaviour("pc")
	local ambience = FindNodeByName("ambience_upper_cave")
	ambience:StopTrigger()	
	local ambience = FindNodeByName("ambience_inner_cave")
	ambience:Trigger()	
	model:StopTrigger()
end
