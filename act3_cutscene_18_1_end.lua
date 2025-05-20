global WalkToIdles

global script_node

global function TurnStart()
	local doctor = GetActor("doctor")	
	local doc_90 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight90")

	--This value is remembered after save	
	WalkToIdles = true
	
	doctor:PlayAnim(doc_90,1,1)
	doctor:SetCallback(script_node, "TurnDone")
end

global function Init()
	if WalkToIdles then
		TurnStart()
	end
end

global function TurnDone()
	local doctor = GetActor("doctor")
	local doc_loc2 = FindNodeByName("reciever_doc_loc")
	
	doctor:SetTarget(doc_loc2)
	doctor:SetMaxSpeed(2)
	doctor:SetBehaviour("move")
	doctor:SetCallback(script_node, "AtLoc")
end

global function AtLoc()
	local doctor = GetActor("doctor")
	local doc_90 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight90")
	
	doctor:PlayAnimBlendOut(doc_90,1,1,1)
	doctor:SetCallback(script_node, "Idles")	
end

global function Idles()
	local idles = FindNodeByName("doctor_idles")
	
	idles:Wake()
end