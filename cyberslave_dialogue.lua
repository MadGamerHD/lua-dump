global script_node


global function MustElimate()
	local cyberslave = script_node:FindActor()

	--HINT
	--random pursuit line (slow droning voice)
	cyberslave::SID_1056:  Must eliminate...
end

global function Die()
	local cyberslave = script_node:FindActor()

	--HINT
	--random pursuit line (slow droning voice)
	cyberslave::SID_1057:  Die...
end

global function Delete()
	local cyberslave = script_node:FindActor()

	--HINT
	--random pursuit line (slow droning voice)
	cyberslave::Delete superfluous humans.
end

global function Stop()
	local cyberslave = script_node:FindActor()

	--HINT
	--random pursuit line (slow droning voice)
	cyberslave::Stop!
end


-- Patrol dialogue

global function PatrolGreenToAmber()
	if Random(2) == 1 then
		MustElimate()
	else
		Die()
	end
end

global function PatrolAmberToRed()
	if Random(2) == 1 then
		MustElimate()
	else
		Die()
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


-- other dialogue

global function DeathByElectricity()
	local cyberslave = script_node:FindActor()

	--HINT
	--cyberslave death scream
	cyberslave::SID_1055: Argh!
end
