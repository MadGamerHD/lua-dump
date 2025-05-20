global script_node

global function Trigger()

	local walk = FindNodeByPartialName("Anim_DRW_Walk")
	local idle = FindNodeByPartialName("Anim_DRW_Idle01")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	doctor:Teleport(FindNodeByName("loc_doc_face_skidoo"))
	amy:Teleport(FindNodeByName("loc_amy_intro_start"))
	doctor:EnablePhysics()
	HideFade()
	Wait(1)
	SayPrep("skip", "")
	
	--adds new objective
	AddGlobalObjective("Cyber_1_1")

	--turns objective to complete
	SetGlobalObjectiveState("Cyber_1_1_1", 2) -- 2 is unlock, 3 is done


	
	--CUT SCENE 2.1
	--INT. ICE CAVE - DAY
	--THE DOCTOR and AMY step out of the TARDIS.  Taking it in.
	amy::SID_0060:Where are we?
	SayPrep("", "async")
	doctor::SID_0061:The Arctic Circle somewhere. And the TARDIS will keep you warm, at least for a while.
	Wait(2)
	doctor:SetTarget(amy)
	doctor:Face(0.5,"lerp")
	Wait(2)
	local doctor = GetActor("doctor")
	local doctor_anim = FindNodeByPartialName("Anim_DRW_Idle03")
	doctor:PlayAnim(doctor_anim,1,0)
	--cdoctor:DisableAnimLoop()
	--doctor:SetCallback(script_node,"run_cutscene1")


--end
	SayPrep("", "")
--global function run_cutscene1()
	local walk = FindNodeByPartialName("Anim_DRW_Walk")
	local idle = FindNodeByPartialName("Anim_DRW_Idle01")
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
SayPrep("skip", "")
	--The Doctor is looking about him.
	
	Wait(0.5)
	local loc_node = FindNodeByName("loc_doctor_investigate")
	doctor:SetTarget(loc_node)
	doctor:Face(0.5,"lerp")
	Wait(1.5)
	doctor::SID_0063:Now that signal wasn't too strong. Couldn't lock on all that accurately.
	doctor:PlayAnim(idle,1,0)


-- the ground shakes
	SayPrep("skip", "async")
	amy::SID_0064:It's an earthquake! I mean an ice-quake! 
	Wait(1)
	doctor:Teleport(FindNodeByName("loc_doc_face_amy"))
	Wait(1.5)
	SayPrep("skip", "")
	doctor:SetTarget(amy)
	doctor:Face(1,"lerp")
	doctor::SID_0065: Just a little glacial movement.
	amy::SID_0066:Yeah. Just a little glacial movement for you in your hobnail boots. We're wearing heels here. 
	local loc_node = FindNodeByName("loc_doctor_investigate")
	doctor:SetTarget(loc_node)
	doctor:Face(1,"lerp")

	--But he's checking the fracture lines in the ice now...
	doctor::SID_0067:From the look of these, I'd say we're on some sort of floating ice plateau. 
	doctor:Face(1,"lerp")
	doctor:SetMaxSpeed(1.0)
	doctor:SetBehaviour("move")

	
	--The Doctor moves forward in the cave
	amy::SID_0069:Where are you going?
	doctor::SID_0070:Ahh... Just a quick look around. 

	--doctor:PlayAnim(idle,1,1.5)

	Wait(0.5)
	amy::SID_0071:Didn't you listen to anything I just said?
	doctor::SID_0072: No.
	
	--doctor:SetBehaviour("wait")
	--amy:SetBehaviour("move")
	--SaveCheckpoint()
end
