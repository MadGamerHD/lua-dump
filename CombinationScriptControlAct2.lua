global script_node

global function CheckCombination()
	local hint = QueryObjective(0)       
	print(hint,"\n")   

	if(hint == "hint_2_1_1" or hint == "hint_2_1_2" ) then
		FindNodeByName("CombinationScript4").script.CheckCombination()
	elseif (hint == "hint_2_2_4") then
		FindNodeByName("CombinationScript5").script.CheckCombination()
	elseif (hint == "hint_2_3_2" ) then
		FindNodeByName("CombinationScript6").script.CheckCombination()
	end
end

--REDUNDANT?
global function Run_1_1_AlreadyText()
	--local amy = GetActor("amy")
	
	--VO Amy trys to pull a red lever that has already been pulled, objective 1_1
	--amy::SID_1286:Ive already pulled that one.
end

--REDUNDANT?
global function Run_1_1_Text()
	local hint = QueryObjective(0)    
	local amy = GetActor("amy")
	
	if(hint == "hint_1_1") then
		if (FindNodeByName("Console5InteractableScript").script.Object5State == 1 and FindNodeByName("Console3InteractableScript").script.Object3State == 1) then
			--VO: Amy has pulled the second red lever for objective 1_1
			--amy::Okay, that should be them all!	
		else
			--VO: Amy has pulled the second red lever for objective 1_1
			--amy::Just one more to go!
		end
	end
end
