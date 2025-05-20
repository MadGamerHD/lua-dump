global script_node

global have_brine_oil
global have_sea_sprouts
global have_sticky_mushrooms

have_brine_oil = false
have_sea_sprouts = false
have_sticky_mushrooms = false

global function CheckForAllIngredients()
	local doctor = GetActor("doctor")
	
	if(have_brine_oil and have_sea_sprouts and have_sticky_mushrooms) then
		FindNodeByName("Act2Progression").script.SetStage_ReturnToLab()
		
		SayPrep("skip","async")
		--HINT
		--*NEW
		doctor::SID_2079:Right, that's all the ingredients we need. Come on Amy, let's get back to Dana's lab and work on that cure.
	end

	SaveCheckpoint()
end

global function PickupMushrooms()
	--Find some Sticky Mushrooms (LOCKED)
	SetGlobalObjectiveState("POSEIDON_2_6_4", 3)

	have_sticky_mushrooms = true
	local doctor = GetActor("doctor")
	doctor:AddInventoryItem(FindNodeByName("mushrooms"))
end

global function PickupSprouts()
	--Find some Sea Sprouts (LOCKED)
	SetGlobalObjectiveState("POSEIDON_2_6_3", 3)

	have_sea_sprouts = true
	local doctor = GetActor("doctor")
	doctor:AddInventoryItem(FindNodeByName("sprouts"))
end

global function PickupBrineOil()
	--Find some Brine Oil (LOCKED)
	SetGlobalObjectiveState("POSEIDON_2_6_2", 3)

	have_brine_oil = true
	local doctor = GetActor("doctor")
	doctor:AddInventoryItem(FindNodeByName("oil"))
end
