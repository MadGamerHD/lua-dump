global function Trigger()
	print("I do trigger sometimes, honest")
	local amy = GetActor("amy")
	SayPrep("skip", "async")
	--VO
	--the Doctor has climbed down the chasm. We need AMy to stay put
	amy::SID_0899:I'm not going to go down there, in these shoes. I'd never get back up again.
	local loc_node=FindNodeByName("loc_doctor_investigate")
	
	local currentPlayer = FindPlayer()
	
	amy:SetTarget(loc_node)
	amy:SetBehaviour("move")
	
	if currentPlayer:GetName() == amy:GetName() then
		Wait(4)
		amy:SetBehaviour("pc")
	end
end
