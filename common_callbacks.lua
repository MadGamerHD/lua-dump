global script_node
local stop_anim_actor
local stop_anim_time

global function StopAnim()
	stop_anim_actor:StopAnim(stop_anim_time)
end

global function BlendOutAnim(actor, blend_out_time)
	stop_anim_actor = actor
	stop_anim_time = blend_out_time

	stop_anim_actor:SetCallback(script_node, "StopAnim")
end