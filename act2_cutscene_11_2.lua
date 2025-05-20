--11.2
--played when player enters vis room
--ends and player moves into room

global function Start()
	local doctor = GetActor("doctor")
	local VisEye = FindNodeByName("VisEye_Prop:0")
	local music = FindNodeByName("add1")

	PlayMusic(music)		
	VisEye:Show()
	
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	SayPrep("skip", "")
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	--local VisEye = FindNodeByName("VisEye_Prop:0")
	local chronon = FindNodeByTag("Chronon")
	local doc_loc = FindNodeByName("cs11_2_doc")
	local amy_loc = FindNodeByName("cs11_2_amy")
	local game_doors = FindNodeByName("DoorPropLuaVisDoor")
	local theme = FindNodeByName("dalek_city_theme_def")
	
	chronon:SyncDataFromDef()
	--VisEye:Show()
	game_doors.script.ForceDoorClose()

	doctor:Teleport(doc_loc)
	doctor:GetTransform():Trigger()
	amy:Teleport(amy_loc)
	amy:GetTransform():Trigger()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	amy_hint_interact:Wake()

	HideLetterBox()

	PlayMusic(theme)
	
	SetGlobalObjectiveState("Dalek_2_3_1", 3)
	SetGlobalObjectiveState("Dalek_2_3_2", 2)
	SetGlobalObjectiveState("Dalek_2_3_3", 2)
	SetGlobalObjectiveState("Dalek_2_3_4", 2)

	FindNodeByName("lua_transition").script.BlackScreen(3)
	
	--NEW
	--VO
	--Extra info for the player after cut sceen 11.2
		doctor::SID_1277:There are three security consoles that I need to decrypt, that's the first one over there. 
end
