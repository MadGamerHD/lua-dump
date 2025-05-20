--local Door = FindNodeByName("EM_ANIMATOR_Door:0")

local doctor = GetActor("doctor")
if (not IsLoadingSavedGame()) then
	local screwdriver = FindNodeByName("screwdriver")

	doctor: AddInventoryItem (screwdriver)
end

