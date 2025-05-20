global function PerformCutscene4_1()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local jones = GetActor("jones")
	local music = FindNodeByName("cs4_music")

	PlayMusic(music)
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	SayPrep("skip", "")
	
	--Hide the door that's brought in for the animation
	FindNodeByName("EM_ENTITY_Level_End_Door_0"):DisableNode()

	--CUT SCENE 4
	--INT. POSEIDON. ANTE-CHAMBER -- NIGHT
	--The airlock door opens before THE DOCTOR, FLANAGAN and AMY.
		--doctor::SID_1625:Open Sesame. Thanks for your help, Jones.
		
		--jones::SID_1626:It's been a relief to talk to someone who understands me, Doctor.
		
	--Amy grins at the Doctor.
		--amy::SID_1627:Oh, boy. I think you've pulled.
		
	--The Doctor gives her a wink.
		--doctor::SID_1628:Well, I can see the attraction.
	
end

global function StopMusicBeforeLoad()
	StopMusic()
	FindNodeByName("amb_jones"):StopTrigger()
	FindNodeByName("amb_creak"):StopTrigger()
end

global function EndCutscene()
	-- Return the door used ion the anim
	FindNodeByName("EM_ENTITY_Level_End_Door_0"):EnableNode()

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(6)

	HideLetterBox()
	
	EndAct() --We're outta here!
end