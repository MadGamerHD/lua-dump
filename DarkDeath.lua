global script_node
local trigger = script_node:FindNodeByTag("trigger")

global function Enable()
	trigger:Wake()
end

global function Disable()
	trigger:Sleep()
end

global function EnterDark()
	local actor = GetTriggerNode():FindActor()
	local SkullDeath = FindNodeByName("LuaSkullDeath")

	actor:Die("vashta")
	actor:SetCallback(SkullDeath, "Play")
end