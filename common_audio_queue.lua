global script_node
local current_audio
local next_audio

global function Play(first, second)
	current_audio = first
	next_audio = second
	RunAsync(script_node, "PlayInternal")
end

global function Stop()
	RunAsync(script_node, "StopInternal")
end

-- Internal functions are below, please don't use them externally

global function PlayInternal()
	current_audio:TriggerAndWait()
	current_audio = next_audio
	current_audio:TriggerAndWait()
	current_audio = nil
end

global function StopInternal()
	if current_audio then
		current_audio:StopTrigger()
		current_audio = nil
	end
end
