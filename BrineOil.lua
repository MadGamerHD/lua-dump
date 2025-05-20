global script_node

global function Examine()
	local doctor = GetActor("doctor")
	
	--VO
	doctor::SID_2065:Ah, some Brine Oil. Doesn't smell very nice, but it's a excellent lubricant.
end

global function Finish()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("pc")
	
	local brine = script_node:FindNodeByTag("brine")
	brine:StopTrigger()
	
	FindNodeByName("IngredientsGameplay").script.CheckForAllIngredients()
end

global function Interact()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	SayPrep("skip","async")
	
	if FindPlayer():GetName() == amy:GetName() then
		--VO
		amy::SID_2444:Hmm, I'll let the Doctor pick the ingredients...
		return 
	end
	
	local ingredients_script = FindNodeByName("IngredientsGameplay")
	
	if(ingredients_script.script.have_brine_oil == false) then
		
		local brine = script_node:FindNodeByTag("brine")
	
		doctor:SetTarget(brine)
		doctor:SetMoveTime(1.5)
		doctor:SetMoveNearbyDistance(0.25)		
		doctor:SetBehaviour("move")
		
		Wait(0.75)
		--VO
		doctor::SID_2066:Some Brine Oil. That'll do nicely.
		
		doctor:SetCallback(script_node, "Finish")
		doctor:PlayAnim(FindNodeByPartialName("TheDoctor_Anim_DRW_InteractFloor"), 1.0, 0.1)
		
		Wait(2.25)
		
		brine:Hide()
		
		ingredients_script.script.PickupBrineOil()
		
	else
		--VO
		doctor::SID_2067:We've already got plenty of Brine Oil. Smells bad enough as it is.
	end
end
