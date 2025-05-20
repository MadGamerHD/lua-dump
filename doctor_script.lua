global script_node
if (not IsLoadingSavedGame()) then
	local doctor = GetActor ("doctor")
	local screwdriver = script_node:FindInventoryItem ()
	doctor:AddInventoryItem (screwdriver)
end