global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	--CUT SCENE 17
	--INT. RUINED KAALANN. SUPREME COUNCIL CHAMBER -- DAY
	--The Doctor is about to trigger the magnetic field generators - when Amy staggers...
		amy::SID_0719:Doctor...
	
--		amy:StartInvisibilityFading(1,1,1,1)
	
	--She's turning transparent again...
		amy::SID_0720:It's happening again.

--		amy:StopInvisibilityFading()

	--The Doctor looks concerned.
		doctor::SID_0721:We've jumped time again. The Chronon Blocker won't work here. Just hold on, Amy! I can save you. I promise! 
		doctor::SID_0845:But we have to deal with the Daleks first!
	--As the vortex opens again - and Daleks start coming through the Eye. 
	--And the Doctor triggers the magnetic field generators.
	--And the Daleks descend. As they come into contact with the electric field they explode. 
	--The Daleks destroyed, he goes back to Amy - weakened, but no longer transparent. 
		doctor::SID_0724:Stay with me, Amy!
		amy::SID_0725:I'm - I'm okay.
		doctor::SID_0726:Come on - we have to be ready for them.
		
	--on end
	AddGlobalObjective("Dalek_3_2")
end