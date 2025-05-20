global first
global script_node

global function Trigger()
	local doctor=GetActor("doctor")
	local loc = FindNodeByName("back_into_cave")
	local cutscene = FindNodeByName("Cutscene_10")
	local turn = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TurnRight180")
	
	if(first == nil) then
		first = 1
		cutscene:Trigger()
	else
		ShowLetterBox()	
		LockActorCamera()
		
		doctor:PlayAnimAndWait(turn,1,0.1)
		
		doctor:SetTarget(loc)
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node,"WalkDone")

		--HINT
		--no return to the tunnels yet
			doctor::SID_0881:I've got to get up to that ship and find out if the Cybermen are awake yet.
	end
end

global function WalkDone()
	local doctor=GetActor("doctor")

	HideLetterBox()	
	FreeActorCamera()	
	doctor:SetBehaviour("pc")
end