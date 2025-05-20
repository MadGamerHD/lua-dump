local maincam = FindNodeByName("CutSceneCamera_0")
local doccam = FindNodeByName("CutSceneCamera_1")
local amycam = FindNodeByName("CutSceneCamera_2")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_loc = FindNodeByName("reciever_amy_loc")
	local doc_loc = FindNodeByName("reciever_doc_loc")
	local vis_rec = FindNodeByShortName("EM_ENTITY_vis_reciever:0")
	local vis_door = FindNodeByShortName("EM_ENTITY_corridor_doors1:0")
--	local int_med = FindNodeByPartialName("EM_ANIMATOR_Anim_DRW_TheDoctor_InteractOnTable")

	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	doctor:Teleport(doc_loc)
	amy:Teleport(amy_loc)
	ShowLetterBox()

	--doctor picks up reciever
--	doctor:PlayAnim(int_med,1,1)
	
	Wait(2)
	doccam:CutTo()
	--CUT SCENE 18.1
	--INT. RUINED KAALANN. VISUALISER  ROOM -  DAY
	--Pickup Visualiser Receiver
		doctor::SID_0741:This is linked to the eye of every Dalek. If I can reverse-engineer it, we can interfere with their vision.
		doctor::SID_0847:We just need some parts from the Production Facility.
	amycam:CutTo()
		vis_rec:StopTrigger()
		amy::SID_0742:Oh, I think I know what's coming...
	doccam:CutTo()
		doctor::SID_0743:Could you pop next door and rustle me up a couple of things while I get started on this gizmo?
	amycam:CutTo()
		amy::SID_0744:What do you need? Cup of tea? Choccie biccies?
	doccam:CutTo()
		doctor::SID_0745:A Dalek Gun and a Dalek Eye Stalk. I recommend looking for salvage rather than a live one.
	amycam:CutTo()
		amy::SID_0959:Yeah, you're so funny.
	doccam:CutTo()
		doctor::SID_0848:Good luck. Let me open this door for you.
	-->sealed door opens as doctor overrides security.	
	maincam:CutTo()
	Wait(0.5)
	vis_door:StopTrigger()
	Wait(0.5)
end
	
global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_loc = FindNodeByName("reciever_amy_loc2")
	local varga_prop = FindNodeByName("varga_prop")
	
	amy:Teleport(amy_loc)
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("pc")
	HideLetterBox()	
	
	--set varga idle until Amy passes...
	varga_prop:StopTrigger()
		
	SetGlobalObjectiveState("Dalek_3_3", 3)
	AddGlobalObjective("Dalek_3_4")
end
