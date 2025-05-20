global script_node

global function Examine()
	local doctor = GetActor("doctor")
	
	--VO
	doctor::SID_2068:Lovely! A nice collection of Sticky Mushrooms.
end

global function Finish()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	
	local mushroom = script_node:FindNodeByTag("mushroom")
	mushroom:StopTrigger()
	
	FindNodeByName("IngredientsGameplay").script.CheckForAllIngredients()
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	SayPrep("skip","async")
	
	if FindPlayer():GetName() == amy:GetName() then
		
		--VO
		amy::SID_2445:Hmm, I'll let the Doctor pick the ingredients...
		return 
	end
	
	local ingredients_script = FindNodeByName("IngredientsGameplay")
	
	if(ingredients_script.script.have_sticky_mushrooms == false) then
	
		local mushroom = script_node:FindNodeByTag("mushroom")
		
		doctor:SetTarget(mushroom)
		doctor:SetMoveTime(1.5)
		doctor:SetMoveNearbyDistance(0.25)
		doctor:SetBehaviour("move")

		Wait(0.75)
		--VO
		doctor::SID_2069:Excellent, some Sticky Mushrooms. I'll take those.
		
		doctor:SetCallback(script_node, "Finish")
		doctor:PlayAnim(FindNodeByPartialName("TheDoctor_Anim_DRW_InteractFloor"), 1.0, 0.3)
		
		Wait(2.25)
		
		mushroom:Hide()
		
		ingredients_script.script.PickupMushrooms()
		
	else
		--VO
		doctor::SID_2070:We've got more than enough Sticky Mushrooms for now.
	end
end
