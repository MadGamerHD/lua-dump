global function EnteringStealth()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			if Random(2) == 1 then
			
				--HINT
				--Entering stealth - Amy following
				doctor::SID_1240:We better be cautious here.       
			
			else
			
				--HINT
				--Entering stealth – Amy following
				doctor::SID_1241:We need to be careful.              

			end

		else

			if Random(2) == 1 then
			
				--HINT
				--Entering stealth – To himself
				doctor::SID_1249:I'll take my time.                        
			
			else
			
				--HINT
				--Entering stealth – To himself
				doctor::SID_1250:I'll get down.                             

			end

		end
		
	end
end

global function ExitingStealth()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			if Random(2) == 1 then
			
				--HINT
				--Exiting stealth – Amy following
				doctor::SID_1242:I think we're ok.                        
			
			else
			
				--HINT
				--Exiting stealth – Amy following
				doctor::SID_1243:We should be safe now.            

			end

		else

			if Random(2) == 1 then
			
				--HINT
				--Exiting stealth – To himself
				doctor::SID_1251:Narrow escape.                              
			
			else
			
				--HINT
				--Exiting stealth – To himself
				doctor::SID_1252:Crisis averted.                           

			end

		end

	end
end

global function DetectedByEnemy()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			--HINT
			--Detected by enemy – Amy following
			doctor::SID_1244:We need to hide

		else

			--HINT
			--Detected by enemy – To himself
			doctor::SID_1253:Oops!                                       

		end

	end
end

global function SeenByEnemy()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			--HINT
			--Seen by enemy – Amy following
			doctor::SID_1245:Move it now!     

		else

			--HINT
			--Seen by enemy – To himself
			doctor::SID_1254:No!            

		end

	end
end

global function FiredAtByEnemy()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			--HINT
			--Fired at by enemy – Amy following
			doctor::SID_1246:Run!                 

		else

			--HINT
			--Fired at by enemy – To himself
			doctor::SID_1255:Argh!                                        

		end

	end
end

global function LostSightOfEnemy()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			--HINT
			--Lost sight of enemy – Amy following
			doctor::SID_1247:Come on!                  

		else

			--HINT
			--Lost sight of enemy – To himself
			doctor::SID_1256:Phew!                 
	
		end

	end
end

global function EnemiesReturnToPatrol()
	local doctor = GetActor("doctor")

	if doctor:IsEqual(FindPlayer()) then
		local amy = GetActor("amy")

		if amy:GetBehaviour() == "follow" then
		
			--HINT
			--Enemies return to patrol – Amy following
			doctor::SID_1248:We should be more careful!       
	
		else

			--HINT
			--Enemies return to patrol – To himself
			doctor::SID_1257:That was close!               	

		end

	end
end

global function DeathByBeam()
	local doctor = GetActor("doctor")

	--HINT
	--Death by Dalek Beam!
	doctor::SID_1258:Argh!                                        
end

global function DeathBySting()
	local doctor = GetActor("doctor")

	--HINT
	--Death by Varga Sting!
	doctor::SID_1259:Argh!        
end

global function DeathByExplosion()
	local doctor = GetActor("doctor")

	--HINT
	--Death by Explosion!
	doctor::SID_1260:Argh! 	
end

global function DeathByFalling()
	local doctor = GetActor("doctor")

	--HINT
	--Death by falling
	doctor::SID_1261:Argh!	
end

global function DeathByElectricity()
	local doctor = GetActor("doctor")

	--HINT
	--Death by electricity
	doctor::SID_1262:Argh!
end
