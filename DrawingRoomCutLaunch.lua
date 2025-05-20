global script_node
global PlayedCut
PlayedCut = 0

global function CheckForCompletion()
	local Cut6

	Wait(1)
	-- if the user is fast they can interact with another object within a second; therefore wait must come first

	Cut6 = FindNodeByName("Cut_6")

	if (FindNodeByName("DrawingObjectiveScript").script.ItemsExamined > 5 and PlayedCut == 0) then
		PlayedCut = 1
		Cut6:Trigger()
	end
	
end