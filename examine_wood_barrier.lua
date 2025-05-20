global model
global function Interact()
	print ("examine wood barrier","\n")
	local doctor = GetActor("doctor")
	
	SayPrep("skip", "")

	--VO
	--Examine wood barrier
		doctor::SID_0496:We need to find a way to break through that barricade.
end

global function Use()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	--local d3 = FindNodeByName("wood3")

	if doctor:IsUsingInventoryItem(screwdriver) then

	SayPrep("skip", "")
	
		--d3:Trigger()
		--VO
		--Use Sonic with barrier
			doctor::SID_0497:No. The Sonic Screwdriver won't work on wood.
	end
end