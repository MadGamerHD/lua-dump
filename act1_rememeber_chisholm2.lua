global first

global function Trigger()
	local doctor = GetActor("doctor")
	local return_spot = FindNodeByName("loc_remember_chicholm2")
	doctor:SetTarget(return_spot)
	doctor:SetBehaviour("move")
	if(first == nil) then
		--VO
		--Remininding the player that they have to get Chisholm across too.
		doctor::SID_1149: Chisholm won't be able to follow unless I create a path for him.
	else
		--VO
		--Hint to get Chisholm across
		doctor::SID_1150: Maybe I can create a makeshift bridge.
	end
	doctor:SetBehaviour("pc")
end
