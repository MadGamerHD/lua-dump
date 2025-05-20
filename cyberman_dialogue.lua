global script_node


global function Delete()
	local cyberman = script_node:FindActor()

	--HINT
	--random pursuit line
	cyberman::SID_1058: You will be deleted.
end

global function AnotherDelete()
	local cyberman = script_node:FindActor()

	--HINT
	--random pursuit line
	cyberman::Delete.
end

global function Stop()
	local cyberman = script_node:FindActor()

	--HINT
	--random pursuit line
	cyberman::SID_1060: Delete.
end


-- Patrol dialogue

global function PatrolGreenToAmber()
	if Random(2) == 1 then
		Delete()
	else
		Stop()
	end
end

global function PatrolAmberToRed()
	if Random(2) == 1 then
		Delete()
	else
		Stop()
	end
end
--[[
global function PatrolAttack()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1232:Exterminate, Exterminate! 
end

global function PatrolRedToAmber()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1233:Enemy evading!                                   
end

global function PatrolAmberToGreen()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1234:Area secured!
end
--]]


-- guard dialogue

global function GuardGreenToAmber()
	PatrolGreenToAmber()                      
end

global function GuardAmberToRed()
	PatrolAmberToRed()                          
end
--[[
global function GuardAttack()
	PatrolAttack()  
end

global function GuardRedToAmber()
	PatrolRedToAmber()                       
end

global function GuardAmberToGreen()
	PatrolAmberToGreen()                     
end
--]]