global script_node

global function Interact()
	print("Interact!!!!", "\n")
	local BoxLoc = script_node:FindNodeByTag("Crate_Push_Start")
	local actorAmy =  FindNodeByName("Amy_Actor_0")
	actorAmy:SetTarget(BoxLoc)
	actorAmy:SetCallback(script_node, "PushBoxStart")
	actorAmy:SetMoveTime(1.5)
	actorAmy:SetBehaviour("move")
end

global function PushBoxAnimEnd()
	print("PushBoxAnimEnd","\n")
	local actorAmy =  FindNodeByName("Amy_Actor_0")
	local actorDoctor = FindNodeByName("TheDoctor_Actor_0")
	actorDoctor:SetBehaviour("pc")
	actorAmy:SetTargetToDefault()
	actorAmy:SetBehaviour("follow")

	local InteractObj1 = script_node:FindNodeByTag("PushBoxInteract")
	InteractObj1:DisableNode()
	local InteractObj2 = script_node:FindNodeByTag("ClimbInteract")
	InteractObj2:EnableNode()
end

global function PusboxStop()
	print("PusboxStop", "\n")
	local actorAmy =  FindNodeByName("Amy_Actor_0")
	
	local push_End = FindNodeByTag("Amy_Anim_PushCrate_OutOf")
	
	actorAmy:SetCallback(script_node, "PushBoxAnimEnd")
	
	actorAmy:PlayAnim(push_End,1,0)
end

global function PushBoxPush()

	print("PushBoxPush", "\n")
	local actorAmy =  FindNodeByName("Amy_Actor_0")
	local push_anim = FindNodeByTag("Amy_Anim_PushCrate")
	local BoxObj = script_node:FindNodeByTag("PushBox")
	local Waypoint1 = script_node:FindNodeByTag("Crate_Push_Stop")
	
	
	BoxObj:SetCallback(script_node, "PusboxStop")
	actorAmy:PlayAnim(push_anim,1,0)
	BoxObj:Move(Waypoint1, 10, "lerp")
end

global function PushBoxStart()

	print("PushBoxStart", "\n")
	local actorAmy =  FindNodeByName("Amy_Actor_0")
	local push_Start_anim = FindNodeByTag("Amy_Anim_PushCrate_Into")
	
	actorAmy:SetCallback(script_node, "PushBoxPush")
	
	local Crate = script_node:FindNodeByTag("Crate")
	actorAmy:PlayAnim(push_Start_anim,1,0)
end
