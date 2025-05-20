global script_node

global function Examine()
	local doctor = GetActor("doctor")

	--VO
	doctor::SID_2080:Some Sea Sprouts, growing rather nicely.
end

global function Finish()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	
	local sprouts = script_node:FindNodeByTag("sprouts")
	sprouts:StopTrigger()
	
	FindNodeByName("IngredientsGameplay").script.CheckForAllIngredients()
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	SayPrep("skip","async")	
	
	if FindPlayer():GetName() == amy:GetName() then
		--VO
		amy::SID_2446:Hmm, I'll let the Doctor pick the ingredients...
		return 
	end

	local ingredients_script = FindNodeByName("IngredientsGameplay")
	
	if(ingredients_script.script.have_sea_sprouts == false) then
		
		local sprouts = script_node:FindNodeByTag("sprouts")
		
		doctor:SetTarget(sprouts)
		doctor:SetMoveTime(1.5)
		doctor:SetMoveNearbyDistance(0.25)
		doctor:SetBehaviour("move")

		Wait(0.75)
		--VO
		doctor::SID_2081:Sea Sprouts, lovely, I'll have some of those.
		
		doctor:SetCallback(script_node, "Finish")
		doctor:PlayAnim(FindNodeByPartialName("TheDoctor_Anim_DRW_InteractFloor"), 1.0, 0.1)
		
		Wait(2.25)

		sprouts:Hide()
		
		ingredients_script.script.PickupSprouts()
		
	else
		--VO
		doctor::SID_2082:We've got plenty of Sea Sprouts now.
	end
	
	
end
