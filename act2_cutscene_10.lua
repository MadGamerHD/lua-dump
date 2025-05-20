--10
--played when player completes assembly game
--ends and doc heads into production

local light_dr_up = FindNodeByPartialName("EM_LIGHT_DR_Up:0")
local light_dr_left = FindNodeByPartialName("EM_LIGHT_DR_Left:0")
local light_dr_left_back = FindNodeByPartialName("EM_LIGHT_DR_Left_Back:0")
local light_dr_right = FindNodeByPartialName("EM_LIGHT_DR_Right:0")
local light_ay_up = FindNodeByPartialName("EM_LIGHT_AY_Up:0")
local light_ay_left = FindNodeByPartialName("EM_LIGHT_AY_Left:0")
local light_ay_left_back = FindNodeByPartialName("EM_LIGHT_AY_Left_Back:0")
local light_ay_right = FindNodeByPartialName("EM_LIGHT_AY_Right:0")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_script = FindNodeByName("amy_startup_0")
	local music =  FindNodeByName("cutscene_10_music")
	local chronon = FindNodeByTag("Chronon")
	chronon:StopTrigger()	
	
	SayPrep("skip", "")
	ShowLetterBox()
	
	PlayMusic(music)
	
	light_dr_up:Trigger()
	light_dr_right:Trigger()
	light_ay_up:Trigger()
	light_ay_left_back:Trigger()
	light_ay_right:Trigger()
		
	doctor:SetBehaviour("wait")
	amy_script.script.AmyState  = 1

end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_interact = FindNodeByName("Amy_Interact")
	local amy_hint_interact = FindNodeByName("AmyHintInteract")
	local DocWaypoint = FindNodeByName("ChrononDoctor1Loc")
	local AmyWaypoint = FindNodeByName("ChrononAmy1Loc")
	local DalekSensor = FindNodeByName("daleksensor")
	local amy_interact_script = FindNodeByName("amy_interact_script")
	local theme = FindNodeByName("dalek_city_theme_def")
	local chronon = FindNodeByTag("Chronon")
	chronon:StopTrigger()	
		
	light_dr_up:StopTrigger()
	light_dr_right:StopTrigger()
	light_ay_up:StopTrigger()
	light_ay_left_back:StopTrigger()
	light_ay_right:StopTrigger()

	doctor:Teleport(DocWaypoint)
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	doctor:EnableWalls()

	amy:Teleport(AmyWaypoint)
	amy:SetBehaviour("wait")
	amy_hint_interact:Sleep()
	amy_interact:Wake()

	--add new door panel interact	
	
	doctor:AddInventoryItem (DalekSensor)

	HideLetterBox()
	
	PlayMusic(theme)
	
	amy:StartInvisibilityFading(8,2,1,1)
	
	amy_interact_script.script.tired_anim = true
	
	AddGlobalObjective("Dalek_2_2")
	
	FindNodeByName("lua_transition").script.BlackScreen(10)
	
	--NEW
	--VO
	--Extra explanation after cut scene 10
		doctor::SID_1053:The Production Facility must be close by. It's bound to have some spare Dalekanium Coils and Kontron Crystals.
end
