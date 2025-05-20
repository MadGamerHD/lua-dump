
global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	local music = FindNodeByName("CS6_music")
	PlayMusic(music)
	local positiona=FindNodeByName("tower_door_posb")
	local door=FindNodeByName("door_prop")
	door:Move(positiona, 1, "lerp")
	Wait(69)
	door:MoveToOrigin(0.5, "lerp")
	Wait(0.5)
	local audio_slam_door =FindNodeByName("audio_slam_door")
	audio_slam_door:Trigger()



end

global function end_cutscene()	
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local music = FindNodeByName("background_music")
	
	local doctor_point=FindNodeByName("loc_acs_doctor1")
	doctor:Teleport(doctor_point)	
	local amy_point=FindNodeByName("loc_acs_amy1")
	amy:Teleport(amy_point)

	local snowfall = FindNodeByName("snowfall_FX")
	local snowfallTrigger = FindNodeByName("trigger_snowfall")

	snowfall:Trigger()
	snowfallTrigger:Wake()
	WaitFrame()
	HideLetterBox()
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
	OverlayManager:ShowTutorial("HINTS")
	Wait(1)
	
	

	
	--adds new objective
	--Get into the base
	AddGlobalObjective("Cyber_2_1")
	PlayMusic(music)

	SaveCheckpoint()
end
