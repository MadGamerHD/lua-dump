global function Play()
	local SkullDeathLocator = FindNodeByName("EM_LOCATOR_Skull_Death")
	local SkullDeathCamera = FindNodeByName("EM_CAMERA_Skull_Death")

	StopMusic()
	ShowFade()
	Wait(0.75)
	SkullDeathLocator:Trigger()
	SkullDeathCamera:CutTo()
	WaitFrame()
	CutFromFade()
	Wait(1)
	LoadCheckpoint()
end