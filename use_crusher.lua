global function Interact()
	local doctor = GetActor("doctor")
	print ("This is the crusher control, maybe I can use this","\n")
end

global function Use()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")

	if doctor:IsUsingInventoryItem(screwdriver) then
		print("Crusher active!","\n")
	end
end