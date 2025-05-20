local locator_names =
	{
		"mat2_route_0",
		"mat2_route_1", 
		"mat2_route_2",
		"mat2_route_3",
		"mat2_route_4",
		"mat2_route_5",
		"mat2_route_6"
	}


global model
global script_node
local current_locator
current_locator = 0
local first = 0


global function Routing_Mat()
	local next_locator = current_locator + 1
	print("next_locator ", next_locator)

		local mat = GetActor("mat2")
		local locator_node = FindNodeByTag(locator_names[next_locator])
		mat:SetTarget(locator_node)
		mat:SetMaxSpeed(1.0)
		mat:SetCallback(script_node, "ArrivedAtLocator")
		mat:SetBehaviour("move")

end

global function ArrivedAtLocator()

	print("ArrivedAtLocator")
	current_locator = current_locator + 1
	if current_locator == 7 then
		current_locator = 0
	end
	--Routing_Mat()
end

if(first == 0) then
	local mat = GetActor("mat2")
	--mat:EnableSensors()
	--mat:DisablePhysics()
	Routing_Mat()
	first = 1
end

global function Idle()
	Routing_Mat()
end

