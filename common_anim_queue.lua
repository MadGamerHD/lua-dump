global script_node
local actor_internal
local current_anim
local next_anim

global function Play(actor, first, second)
	actor_internal = actor
	current_anim = first
	next_anim = second
	RunAsync(script_node, "PlayInternal")
end

global function Stop()
	RunAsync(script_node, "StopInternal")
end

global function Trigger()
	local doctor = GetActor("doctor")
	local interact1 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")
	local interact2 = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractFloor")
	
	Play(doctor, interact1, interact2)
end

-- Internal functions are below, please don't use them externally

global function PlayInternal()
	actor_internal:PlayAnimAndWait(current_anim,1,0.5)
	current_anim = next_anim
	actor_internal:PlayAnimAndWait(current_anim,1,0.5)
	current_anim = nil
end

global function StopInternal()
	if current_anim then
		actor_internal:StopAnim()
		current_anim = nil
	end
end
