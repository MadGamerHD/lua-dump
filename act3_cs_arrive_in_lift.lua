global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local loc1 = FindNodeByName("loc_doctor1_csa")
	local loc2 = FindNodeByName("loc_amy1_csa")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward")
	local sting = FindNodeByName("16s_exp_sting")
	local ldoor = FindNodeByName("ldoor")
	local rdoor = FindNodeByName("rdoor")
	local left = FindNodeByName("left")
	local right = FindNodeByName("right")
	local close = FindNodeByName("liftclose")

	ldoor:Teleport(left)
	rdoor:Teleport(right)
	
	ldoor:MoveToOrigin(1,"lerp")
	rdoor:MoveToOrigin(1,"lerp")

	PlayMusic(sting)
	
	ShowLetterBox()
	doctor:SetBehaviour("wait")

	SayPrep("skip", "")
	doctor:Teleport(loc1)
	amy:Teleport(loc2)

	close:Trigger()
	
	Wait(1)
	doctor:PlayAnim(anim,0.75,0.5)
		
	Wait(1)
	--CUT SCENE 9.1
	--Mini cutscene: stealth area tunnels
		doctor::SID_0458:Careful, this place is crawling with Cyberslaves.
		amy::SID_0459:Looks like a network of tunnels. Why dig all those?
		doctor::SID_0460:Standard procedure in digs. You dig a cross pattern of trenches or in this case tunnels until you find what you are looking for.
		amy::SID_0461:And they found it?
		doctor::SID_0462:They weren't looking for what they found. If only they had never started to look
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	HideLetterBox()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	doctor:EnableStealth()
	amy:EnableStealth()

	--Stealth music is automatically played when entering stealth

	--Find a way through the tunnels
	AddGlobalObjective("Cyber_3_1")
end
