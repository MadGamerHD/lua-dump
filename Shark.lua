global script_node

local shark = FindNodeByName("Shark_Prop_0")

global function Init()
	local spline = FindNodeByName("spline_shark")
	shark:TeleportToOrigin()
	shark:SetSpline(spline)
end

global function Idle()
	Wait(1)

	if shark:IsLit() == 0 then
		shark:TeleportToOrigin()
	end
end
