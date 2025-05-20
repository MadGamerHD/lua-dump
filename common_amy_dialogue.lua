
global function EnteringStealth()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		if Random(2) == 1 then
			--HINT
			--Entering stealth – To herself
			amy::SID_1263:I'll take it slow.    
		else
			--HINT
			--Entering stealth – To herself
			amy::SID_1264:I better stay low.                
		end
	end
end

global function ExitingStealth()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		if Random(2) == 1 then
			--HINT
			--Exiting stealth – To herself
			amy::SID_1265:I'm glad that's over.                            
		else
			--HINT
			--Exiting stealth – To herself
			amy::SID_1266:Oh! Thank goodness for that.        
		end
	end
end

global function DetectedByEnemy()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		--HINT
		--Detected by enemy – To herself
		amy::SID_1267:Whoops!
	end
end

global function SeenByEnemy()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		--HINT
		--Seen by enemy – To herself
		amy::SID_1268:Oh no!
	end
end

global function FiredAtByEnemy()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		--HINT
		--Fired at by enemy – To herself                                      
		amy::SID_1269:Gasp!
	end
end

global function LostSightOfEnemy()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		--HINT
		--Lost sight of enemy – To herself                                          
		amy::SID_1270:Phew!         
	end
end

global function EnemiesReturnToPatrol()
	local amy = GetActor("amy")

	if amy:IsEqual(FindPlayer()) then
		--HINT
		--Enemies return to patrol – To herself
		amy::SID_1271:That was lucky!        
	end
end

global function DeathByBeam()
	local amy = GetActor("amy")

	--HINT
	--Death by Dalek Beam!
	amy::SID_1272:Argh!        
end

global function DeathBySting()
	local amy = GetActor("amy")

	--HINT
	--Death by Varga Sting!
	amy::SID_1273:Argh!        
end

global function DeathByExplosion()
	local amy = GetActor("amy")

	--HINT
	--Death by Explosion!
	amy::SID_1274:Argh!		
end

global function DeathByFalling()
	local amy = GetActor("amy")

	--HINT
	--Death by falling
	amy::SID_1275:Argh!		
end

global function DeathByElectricity()
	local amy = GetActor("amy")

	--HINT
	--Death by electricity
	amy::SID_1276:Argh!
end
