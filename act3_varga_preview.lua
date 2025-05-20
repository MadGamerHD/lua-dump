global function Trigger()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local lookat = FindNodeByName("varga_lookat")
	local position = FindNodeByName("varga_pos")
	local varga_surprise = FindNodeByName("varga_surprise_def")
						
	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")
	amy:SetFollowDistance(2)
	ShowLetterBox()
	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(2, 6, 2, true, true)

	PlayMusic(varga_surprise)

	--CUT SCENE 17.1
	--Player sees a varga plant for the first time.
		doctor::SID_0892:Stop! That's a Varga plant over there.
		doctor::SID_0893:These vines have a deadly sting. To get past we'll have to time it carefully.

end

global function End()
	local doctor = GetActor("doctor")
	local theme = FindNodeByName("dalek_city_theme_def")
	
	PlayMusic(theme)
	HideLetterBox()
	doctor:SetBehaviour("pc")
end