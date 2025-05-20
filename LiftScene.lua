global script_node

--global function MoveUpstairs()
--	local doctor = GetActor("doctor")
--	local amy = GetActor("amy")
--	local UpstairsLocator1 = FindNodeByName( "UpperFloorLocator3" )
--	local UpstairsLocator2 = FindNodeByName( "UpperFloorLocator4" )
--	local CaptureScene = FindNodeByName( "Cutscene14.05" )
	
--	ShowFade()
--	doctor:Teleport( UpstairsLocator1 )
--	amy:Teleport( UpstairsLocator2  )
--	doctor:DisablePhysics()
--	amy:DisablePhysics()
--	doctor:DisableWalls()
--	amy:DisableWalls()
--	CaptureScene:Trigger()
--end

--global function ReachedLiftPos()
--	local Liftscript = FindNodeByName( "LiftSceneTimeline" )
--	Liftscript:Trigger()
--end

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_script = FindNodeByName("amy_startup_0")
	local eye_script = FindNodeByName("eye_disabled_script_0")
	local cutscene_14 = FindNodeByName("cutscene_14")
--	local LiftLocator1 = FindNodeByTag( "DoctorLift1" )
--	local LiftLocator2 = FindNodeByTag( "AmyLift1" )

	if (amy_script.script.AmyState  == 0) then
		if (eye_script.script.Console3Used == true) then

			cutscene_14:Trigger()

--			SayPrep("skip", "")
--			CutToLetterBox()
--			doctor:SetBehaviour("wait")
--			amy:SetBehaviour("wait")
--			doctor:SetTarget(LiftLocator1)
--			doctor:SetMoveTime(1)
--			doctor:SetBehaviour("move")
--			amy:SetTarget(LiftLocator2)
--			amy:SetMoveTime(2)
--			amy:SetCallback(script_node, "ReachedLiftPos")
--			amy:SetBehaviour("move")
--			SetGlobalObjectiveState("Dalek_2_4_1", 3)
--			SetGlobalObjectiveState("Dalek_2_4_2", 2)
		else
			--VO
			--Encourage the player to go to the Visualiser Room, rather then take the lift
			doctor::SID_0871:This won't get me to the Visualiser Room!
		end
	else	
		--VO
		--Encourage the player to go to the production area, rather then take the lift
		doctor::SID_0872:Ah, the main lift. But I need to stay on this level and find the components for the Chronon Blocker.
	end
end

--global function StartScene()
--	local doctor = GetActor("doctor")
--	local amy = GetActor("amy")
--	local LiftLocator1 = FindNodeByName( "DoctorLift1" )
--	local LiftLocator2 = FindNodeByName( "AmyLift1" )
--	doctor:Teleport(LiftLocator1)
--	amy:Teleport(LiftLocator2)
--end

--global function EndScene()
--	MoveUpstairs()
--end
