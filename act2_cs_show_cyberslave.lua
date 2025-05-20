
global function run_cutscene()
--global function Trigger()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	doctor:SetBehaviour("wait")
	
	local breath = FindNodeByName("EM_ENTITY_Breath_Amy")
	breath:StopTrigger()
	breath = FindNodeByName("EM_ENTITY_Breath_Doc")
	breath:StopTrigger()
		
	SayPrep("skip","")
	
	local cam_pos = FindNodeByName("Spline_radio_room_slave_point")
	SetPOIPosAndLookZ(cam_pos)
	BeginPOI(3.0, 6.0, 3.0, true, true)
	
	--CUT SCENE 6.2
	--INT. GSO - DAY
	--FIRST HALLWAY OF THE GSO.
	--This is  small cutscene to warn the player that a cyberslave is just around the corner (i.e. warn them to go the other way)
	--RE-RECORD - needs to be whispered and urgent.
	doctor::SID_0415: Watch out Amy. There's another Cyberslave around the corner.
	amy::SID_0416: This place gives me the creeps.
		local stealth_fiddler = FindNodeByName("Trigger_stealth1")
	stealth_fiddler:Trigger()
	local music = FindNodeByName("music_enter_stealth_def")
	PlayMusic(music)
	doctor::SID_0417: Until we know exactly what's going on, we need to watch our step.
	--doctor:SetBehaviour("pc")
	--ResetPlayerCamera()


end
	
	


	
	
