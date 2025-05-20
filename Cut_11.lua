global function StartScene()
	--doctor has moved to point...

	PlayMusic(FindNodeByName("Cut_11MusicDef"))
end

global function EndScene()
	local doctor = GetActor("doctor")
	local fob = FindNodeByName("FobInteract")
	local broken = FindNodeByName("examine_bottle")

	PlayMusic(FindNodeByName("DocMusicDef"))

	fob:Trigger()
	broken:Trigger()
	
	HideLetterBox()

	doctor:SetBehaviour("pc")
end
