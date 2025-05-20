global function Start()
	local amy = GetActor("amy")
	local lookat = FindNodeByName("invis_lookat")
	local position = FindNodeByName("invis_pos")
	local varga = FindNodeByShortName("EM_ENTITY_Vine_7")
	local varga_surprise = FindNodeByName("varga_surprise_def")	
	
	SayPrep("skip", "")	
	amy:SetBehaviour("wait")
--	ShowLetterBox()
	LetterBoxOverride(1)
	
	DisableActorCameraCollision()	
	SetPOILookAtNode(lookat)
	SetPOIPositionNode(position)
	BeginPOI(2, 6, 2, true, true)

	PlayMusic(varga_surprise)

	amy:StartInvisibilityFading(10,6,0.2,1)
	
	Wait(3)
	amy:SetFocus(varga)
end

global function End()
	local amy = GetActor("amy")
	local varga_prop = FindNodeByName("varga_prop")
	local theme = FindNodeByName("dalek_city_theme_def")
	
	PlayMusic(theme)
	
	EnableActorCameraCollision()

	amy:ClearFocus()
	amy:StartInvisibilityFading(4,7,1,0.2)
	varga_prop:Trigger()

	HideLetterBox()
	amy:SetBehaviour("pc")
end