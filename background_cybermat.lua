global script_node
local run_count = 0

global function Trigger()

	if run_count == 0 then
		if Random(2) == 1 then
			local timeline = script_node:FindNodeByTag("timeline")
	
			timeline:Trigger()
			run_count = run_count + 1
		end
	end
end