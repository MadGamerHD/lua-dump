--19
--plays when amy assembly game complete

--19.1
--ends and play shifts to amy

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local daleks = FindNodeByShortName("council_daleks")
--	local music = FindNodeByName("music_19_1")
	local varga = FindNodeByTag("temp_varga")
	local idles = FindNodeByName("doctor_idles")
	local endscript = FindNodeByName("cutscene_18_1_end")
	
	--Stop Doctor walking to Vis Locator after save.
	endscript.script.WalkToIdles = false
	
	--Doctor stops doing random idle anims as he goes into stealth on end
	idles:Sleep()
	
	varga:StopTrigger()
	daleks:Trigger()
				
	SayPrep("skip", "")
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	--amy:StartInvisibilityFading(5,5,1,1)

	--Wait(21.9667)
end

global function End_19()
end

global function Start_19_1()
	local music = FindNodeByName("music_19_1")
	PlayMusic(music)
end

global function End()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local doc_council = FindNodeByName("doctor_council_loc")
	local amy_council = FindNodeByName("amy_council_loc")
	local gens_off = FindNodeByName("gens_off")
	local gens_on = FindNodeByName("gens_on")
	local console_off = FindNodeByTag("timeconsole_off")
	local console_on = FindNodeByTag("timeconsole_on")
	local controls_off = FindNodeByShortName("EM_ENTITY_unit_off:0")
	local controls_on = FindNodeByShortName("EM_ENTITY_unit_on:0")
	local amy_carapace = FindNodeByName("amy_carapace_interact")
	local doc_carapace = FindNodeByName("doc_carapace_interact2")
	local vis_dis = FindNodeByShortName("EM_ANIMATOR_vivion_disruptor:0")
	local noback = FindNodeByName("nobackdown_trigger")
	local chronon = FindNodeByTag("Chronon")
	local portaloo = FindNodeByShortName("EM_ENTITY_capsule_for_eye_of_time:0")
--	local eye = FindNodeByShortName("EM_ANIMATOR_Eye_of_Time_FX:0")
	local eye = FindNodeByShortName("EM_ENTITY_Eye_of_Time_FX:0")	
--	local contact0 = FindNodeByShortName("EM_LOCATOR_Contact_pos:0")
--	local contact1 = FindNodeByShortName("EM_ENTITY_contact1:0")
--	local contact2 = FindNodeByShortName("EM_ENTITY_contact2:0")
--	local contact3 = FindNodeByShortName("EM_ENTITY_contact3:0")

	chronon:SyncDataFromDef()
	portaloo:StopTrigger()
	eye:Trigger()
--	contact0:Trigger()
--	contact1:Trigger()
--	contact2:Trigger()
--	contact3:Trigger()

	doctor:Teleport(doc_council)
	doctor:EnablePhysics()
	doctor:DisableStealthMusic()
	doctor:EnableStealth()
	amy:Teleport(amy_council)
	amy:EnablePhysics()
	amy:DisableStealthMusic()
	amy:EnableStealth()
	
	gens_off:StopTrigger()
	gens_on:Trigger()
	console_off:StopTrigger()
	console_on:Trigger()
	controls_off:StopTrigger()
	controls_on:Trigger()
	doc_carapace:StopTrigger()
	amy_carapace:Trigger()
	vis_dis:StopTrigger()
	noback:Trigger()
	
	HideLetterBox()
	
	amy:StartInvisibilityFading(2,7,1,0.2)
	amy:SetBehaviour("pc")	
	
	AddGlobalObjective("Dalek_3_5")

	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)

	--VO
	--Instructions for Amy after cs19
		amy::SID_1882:Right, so I need to get up to that Emperor Dalek.
end
