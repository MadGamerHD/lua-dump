global script_node


-- Patrol dialogue

global function PatrolGreenToAmber()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue - patrol green to amber
	dalek::SID_1230:Sensors alerted!                                   
	
end

global function PatrolAmberToRed()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1231:Stop intruder!                           
end

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


-- guard dialogue

global function GuardGreenToAmber()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1235:Alert!                           
end

global function GuardAmberToRed()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1236:Halt!                            
end

global function GuardAttack()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1237:Exterminate!     
end

global function GuardRedToAmber()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1238:Target lost!                              
end

global function GuardAmberToGreen()
	local dalek = script_node:FindActor()

	--HINT
	--Dalek Game Dialogue
	dalek::SID_1239:Area clear!                           
end


-- Special case dialogue

global function Blind()
	local dalek = script_node:FindActor()

	if Random(2) == 1 then
		--HINT
		--Dalek Game Dialogue - act3 finale; blinded daleks
		dalek::SID_1228:My vision is impaired
	else
		--HINT
		--Dalek Game Dialogue - act3 finale; blinded daleks
		dalek::SID_1229:I cannot see!
	end
end
