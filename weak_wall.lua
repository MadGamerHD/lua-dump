global first

global function Interact()
	local doctor=GetActor("doctor")
	
	SayPrep("skip", "")
	--VO
	--fragile looking piece of wall
		doctor::SID_0481: This wall here looks like it has been battered by the ice. The metal has been weakened.
	
	if(first == nil) then
		--Locate weak wall
		SetGlobalObjectiveState("Cyber_3_5_1", 3) -- 2 is unlock, 3 is done
		--blast wall
		SetGlobalObjectiveState("Cyber_3_5_2", 2) -- 2 is unlock, 3 is done
	end
end